# Homeward Server Requirements

## Scope

A Dart `shelf` server on Cloud Run. It owns the agent loop, tools, validation,
and session state. It holds no Gemini key of its own.

## Routes

| Method | Path | Auth | Purpose |
| --- | --- | --- | --- |
| GET | `/.well-known/agent-card.json` | none | A2A agent card |
| POST | `/a2a` | Firebase ID token, App Check, Gemini key | A2A JSON-RPC: `message/stream`, `tasks/get`, `tasks/cancel` |
| POST | `/api/keys/verify` | Firebase ID token, App Check, Gemini key | Looks up the first turn model with the key, which spends no generate request: 200, or 422 `gemini_key_invalid` |
| POST | `/api/sessions` | Firebase ID token, App Check | Creates a session and an empty plan |
| GET | `/api/sessions` | Firebase ID token, App Check | Lists the caller's plans, newest activity first |
| GET | `/api/sessions/:id` | Firebase ID token, App Check | A plan's turns, for replay when it is opened (D90) |
| DELETE | `/api/sessions/:id` | Firebase ID token, App Check | Deletes session, turns, plan. Not built |
| DELETE | `/api/me` | Firebase ID token, App Check | Deletes every session of the caller. Not built |
| POST | `/internal/cleanup` | Cloud Scheduler OIDC | Deletes plans inactive for 90 days. Not built |
| GET | `/health` | none | Liveness; not `/healthz`, which Cloud Run may reserve |
| GET | `/dev/config` | `localhost` only | The developer's Gemini keys for the app; mounted by `server/tool/dev.dart` alone (D117) |
| GET | `/live` | Phase 2 | Voice WebSocket door. Not built (M6) |

`/api/*` routes use the envelope `{ "ok": true, "data": {} }` and
`{ "ok": false, "error": { "code": "", "message": "", "retryAfterSeconds": 0 } }`,
where `retryAfterSeconds` appears only when waiting helps. `/a2a` uses JSON-RPC
errors with the same codes in `error.data.code`.

## Middleware Order

For every route:

1. Request ID and trace context.
2. Request logging: method, path, status, and duration only. No header, body,
   key, or token is ever logged, which is how `X-Homeward-Gemini-Key` and
   `Authorization` stay out of logs; a test sends both and checks every record.
3. CORS: allows `HOMEWARD_ALLOWED_ORIGINS`, where `http://localhost:*` matches
   any local port, answers preflight for `Authorization`, `Content-Type`,
   `X-Firebase-AppCheck`, `X-Homeward-Gemini-Key`, and `X-A2A-Extensions`,
   refuses preflight from other origins, exposes `x-request-id`, and caches
   preflight for an hour.
4. Error mapping: an unhandled error becomes the `internal` envelope.

Then, for `/a2a` and `/api/*`:

5. Firebase ID token verification with `firebase_admin_sdk`, from
   `Authorization: Bearer`; anonymous accounts accepted, revocation not checked.
6. App Check token verification from `X-Firebase-AppCheck`, without replay
   protection because tokens live a day; skipped when
   `HOMEWARD_APP_CHECK_ENFORCED` is `false`.
7. Gemini key extraction into the request context, for `/a2a` only.
8. Rate limiting per UID, for `/a2a` only.

Failures in these steps answer with HTTP 401 or 429 and the error shape of the
route: the envelope for `/api/*`, a JSON-RPC error without an ID for `/a2a`.
`retryAfterSeconds` is rounded up.

## Gemini Key Handling

- Read from `X-Homeward-Gemini-Key` on each request.
- Held only in the request context for the lifetime of the request.
- Passed to the Gemini client per call; the client has no key of its own.
- Never logged, persisted, included in errors, or sent anywhere except Gemini.
- Never accepted in a query string.
- Phase 2 voice receives it in the first WebSocket frame.

## Server Secrets

The server holds no keys of its own since the reset (D129). A key it needs
later reaches it as an environment variable, like the rest of its
configuration (D115):

- On Cloud Run, `--set-secrets` maps the variable onto the `latest` version of
  its Secret Manager secret when an instance starts. Neither the image nor the
  deploy command holds a value.
- The service account may access each secret it needs, not every secret in the
  project.
- Locally the variables come from `.env`; see Local Development.
- Read into `ServerConfig` at startup; never logged, included in errors, or sent
  anywhere except the provider it belongs to.
- A secret joins `make deploy-server` once the server reads it; deploying with a
  secret that does not exist fails.
- Rotation adds a version, redeploys, then destroys the old version. A disabled
  version still counts as active for billing.

## Rate Limits

Keys are the buyer's, so limits protect server compute and Firestore rather
than Gemini spend.

| Limit | Default |
| --- | --- |
| Turns per UID | 30 per 10 minutes |
| Concurrent turns per session | 1 |
| Sessions per UID | 50 |

Limits are to be counted in Firestore with fixed windows so they hold across
instances. Today the turn limit is counted in memory with the same fixed
window, which holds while one instance serves every turn, and the session
limit is not built.

## Error Codes

| Code | Meaning |
| --- | --- |
| `unauthenticated` | Missing or invalid Firebase ID token |
| `app_check_failed` | Missing or invalid App Check token |
| `gemini_key_missing` | Key header absent |
| `gemini_key_invalid` | Gemini rejected the key |
| `gemini_quota_exhausted` | Gemini returned a quota error on every model it could try; includes the next reset, midnight Pacific |
| `gemini_credits_depleted` | The project behind the key has run out of prepaid credits |
| `gemini_unavailable` | Every configured model is overloaded, stalled, or returned a server error |
| `rate_limited` | Homeward limit reached |
| `turn_in_progress` | Another turn is running in this session |
| `session_not_found` | Unknown or foreign session |
| `validation_failed` | Model output could not be corrected |
| `internal` | Anything else |

## Sessions And Turns

- A session is created by `/api/sessions` and used as the A2A `contextId`.
- A turn takes a lease on the session in a Firestore transaction with a
  five-minute expiry, which outlasts the request timeout, released on
  completion.
- A session keeps every turn: the input, the text, the A2UI messages forwarded,
  and how it ended. `docs/FIRESTORE.md` has the documents.
- Tasks are held in memory for streaming and in Firestore for `tasks/get`
  resumption for 10 minutes. Tasks still live in memory, which holds only while
  one instance serves the plan.
- Instances are stateless between requests. Any instance can serve any turn.

## Configuration

| Key | Purpose |
| --- | --- |
| `HOMEWARD_TURN_MODELS` | Turn model IDs in preference order |
| `HOMEWARD_THINKING_LEVEL` | Gemini thinking level |
| `HOMEWARD_HEADERS_DEADLINE` | Deadline for Gemini response headers, in seconds |
| `HOMEWARD_FIRST_STEP_DEADLINE` | Deadline for the first Gemini step, in seconds |
| `HOMEWARD_MODEL_COOLDOWN` | How long an overloaded model is skipped, in seconds |
| `HOMEWARD_MAX_CORRECTIONS` | Validation correction rounds |
| `HOMEWARD_ALLOWED_ORIGINS` | CORS origins |
| `HOMEWARD_APP_CHECK_ENFORCED` | Enforce App Check, off for local development |
| `HOMEWARD_PUBLIC_URL` | Base URL clients call, used for the agent card's `url` |
| `HOMEWARD_PROMPTS_DIR` | Prompt files; `/app/prompts` in the image |
| `HOMEWARD_MARKETS_DIR` | Sample market packs, rates, living costs, and exchange rates; `markets` from the repository root locally, `/app/markets` in the image |
| `HOMEWARD_SESSION_STORE` | `firestore` or `memory`; Firestore by default on Cloud Run and with the emulator |
| `GOOGLE_CLOUD_PROJECT` | Firebase project |

Google APIs are reached as the Cloud Run service account through Application
Default Credentials, never with a key. Keys the server holds are under Server
Secrets.

## Observability

- One JSON object per line on stdout, in the shape Cloud Logging parses:
  `severity`, `message`, `time`, `logger`, `requestId`, and structured fields.
- Traces link through `logging.googleapis.com/trace` and `spanId`, read from
  `traceparent` or `X-Cloud-Trace-Context`. The trace link needs
  `GOOGLE_CLOUD_PROJECT`, set at deploy time because Cloud Run does not set it.
- Every response carries `x-request-id`.
- Every request logs method, path, status, and duration.
- Planned fields as features land: UID hash, session ID, turn ID, tool names and
  durations, validation failures, token usage, model latency.
- No prompt text, buyer messages, profile values, or model output in logs.
  Those live only in the buyer's Firestore documents.
- Unhandled errors are logged at `SEVERE` with the Error Reporting event type
  and stack trace, and the client receives only the `internal` error envelope.
- `HOMEWARD_LOG_FORMAT` is `json` in the image and `text` by default locally.

## Deployment

- The server is cross-compiled, not compiled inside Docker, because the pub
  workspace includes the Flutter app and a plain Dart image cannot resolve it.
  `make server-build` runs `dart compile exe --target-os linux --target-arch x64`
  against the committed lockfile.
- `server/Dockerfile` copies that binary, `server/prompts/`, and, since C5,
  `markets/` onto `gcr.io/distroless/cc-debian12:nonroot`: glibc and CA
  certificates, no shell, user 65532. The image was about 31 MB before
  `markets/` joined it.
- The root `.dockerignore` admits only what the image copies into the build
  context: the server binary, the prompts, and `markets/`. A folder the
  Dockerfile copies must be admitted there too, or the build stops at that
  copy, as it did from C5 until 2026-10-05.
- The server loads the prompts and the sample markets and homes once at
  startup.
- The server exits on SIGTERM within Cloud Run's grace period: it stops
  accepting connections, lets in-flight requests finish, and releases every
  signal watcher so the process can end.
- Cloud Run `europe-north1`, concurrency 40, request timeout 300 s, minimum
  instances 0, maximum 2, to stay within the free allowance; maximum 1 while
  tasks live in memory; cold starts are accepted.
- Artifact Registry Docker repository `homeward` in `europe-north1`, with a
  cleanup policy keeping the three most recent images and deleting the rest.
- Cloud Run runs as `homeward-server@homeward-genui.iam.gserviceaccount.com`
  with Cloud Datastore User, Firebase Authentication Viewer, Firebase App Check
  Token Verifier, and Logs Writer, plus Secret Manager Secret Accessor on each
  server secret.
- A server secret, once one is needed, is created once from the developer's
  `.env` with automatic replication, which is billed as one location, and the
  service account is given Secret Manager Secret Accessor on it.
- Cloud Run deploys with `--no-invoker-iam-check`. With the check on, Cloud Run
  answers 401 to any `Authorization` bearer token that is not a Google identity
  token, including Firebase ID tokens, before the request reaches the server.
- Clients call the Cloud Run URL directly. Firebase Hosting has no rewrites to
  the server: they buffer whole responses and never return after about 60
  seconds.
- Firebase Hosting sends `Cross-Origin-Opener-Policy: same-origin` and
  `Cross-Origin-Embedder-Policy: require-corp` on the web app for multi-threaded
  Wasm rendering.
- `make deploy-server` refuses a dirty working tree, tags the image with the
  commit, pushes it, and deploys the service with the flags above.
  `make deploy-web` builds the Wasm web app and deploys Hosting with the
  headers and a single-page fallback from the root `firebase.json`.
  `firebase deploy --only firestore` sends the rules and the one index. All
  three run only when explicitly asked.

## Local Development

- `make server-dev` runs `server/tool/dev.dart` with the VM service and
  `hotreloader`: saved changes in `server` and `common` reload in place. New
  routes need a restart. App Check is not enforced. The entry point reads `.env`
  and `.firebaserc` itself, so it runs the same from make, an IDE, or a
  terminal, and it serves `GET /dev/config`, the developer's Gemini keys for the
  app, to `localhost` only (D117). Production never mounts it.
- `make dev-server` starts that server in the background when nothing answers
  on port 8080, logging to `.dart_tool/homeward/server.log`, and forwards the
  port to attached Android devices with `adb reverse`. `make dev-server-stop`
  stops a server it started.
- `make emulator` runs the Firestore emulator on port 8081. With
  `FIRESTORE_EMULATOR_HOST` set, the server and its tests keep sessions there;
  without it, sessions stay in memory. Application Default Credentials from
  `gcloud auth application-default login` cannot reach Firestore (S6), so the
  emulator is the only local store.
- `make server-image-run` builds and runs the production image on port 8080.
- `make app`, `make app-web`, and `make app-macos` start the local server when it
  is not running, run the app on `DEVICE` (Chrome, macOS, or an Android device
  id), and stop the server they started when the app exits.
- The Gemini key is entered in the app like in production, unless the local
  server hands the app the development keys.
- A developer's keys live in `.env` at the root, copied from `.env.example` and
  ignored by git. The Makefile loads it and exports its variables to every
  target, one `NAME=value` per line without quotes; a variable given on the
  make command line wins.

| Variable | Read by |
| --- | --- |
| `HOMEWARD_EVAL_GEMINI_KEY`, `HOMEWARD_EVAL_GEMINI_MOON_KEY` | `make probe` and the local server's `/dev/config` for the app's development runs, never a turn. Two keys from two Google accounts, two free quotas: each moves to the next key when a turn fails with `gemini_quota_exhausted` |

The local server is the only thing that hands a key to the app, and only the two
Gemini keys; `docs/REQUIREMENTS_APP.md` has the details.
