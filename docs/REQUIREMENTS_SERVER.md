# Homeward Server Requirements

## Scope

A Dart `shelf` server on Cloud Run. It owns the agent loop, tools, rule packs,
validation, plan state, and the board. It holds no Gemini key of its own.

## Routes

| Method | Path | Auth | Purpose |
| --- | --- | --- | --- |
| GET | `/.well-known/agent-card.json` | none | A2A agent card |
| POST | `/a2a` | Firebase ID token, App Check, Gemini key | A2A JSON-RPC: `message/stream`, `tasks/get`, `tasks/cancel` |
| POST | `/api/keys/verify` | Firebase ID token, App Check, Gemini key | Checks the key can use the configured turn model |
| POST | `/api/sessions` | Firebase ID token, App Check | Creates a session and an empty plan |
| DELETE | `/api/sessions/:id` | Firebase ID token, App Check | Deletes session, turns, plan |
| DELETE | `/api/me` | Firebase ID token, App Check | Deletes every session of the caller |
| POST | `/internal/cleanup` | Cloud Scheduler OIDC | Deletes plans inactive for 90 days |
| GET | `/health` | none | Liveness; not `/healthz`, which Cloud Run may reserve |
| GET | `/live` | Phase 2 | Voice WebSocket door |

`/api/*` routes use the envelope `{ "ok": true, "data": {} }` and
`{ "ok": false, "error": { "code": "", "message": "" } }`. `/a2a` uses JSON-RPC
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

## Rate Limits

Keys are the buyer's, so limits protect server compute and Firestore rather
than Gemini spend.

| Limit | Default |
| --- | --- |
| Turns per UID | 30 per 10 minutes |
| Concurrent turns per session | 1 |
| Sessions per UID | 50 |

Limits are counted in Firestore with fixed windows so they hold across
instances. In M1 the turn limit is counted in memory with the same fixed
window, and the session limit joins with Firestore in M2.

## Error Codes

| Code | Meaning |
| --- | --- |
| `unauthenticated` | Missing or invalid Firebase ID token |
| `app_check_failed` | Missing or invalid App Check token |
| `gemini_key_missing` | Key header absent |
| `gemini_key_invalid` | Gemini rejected the key |
| `gemini_quota_exhausted` | Gemini returned a quota error; includes the next reset, midnight Pacific |
| `gemini_unavailable` | Every configured model is overloaded, stalled, or returned a server error |
| `rate_limited` | Homeward limit reached |
| `turn_in_progress` | Another turn is running in this session |
| `session_not_found` | Unknown or foreign session |
| `validation_failed` | Model output could not be corrected |
| `internal` | Anything else |

## Sessions And Turns

- A session is created by `/api/sessions` and used as the A2A `contextId`.
- A turn takes a lease on the session in a Firestore transaction with a
  two-minute expiry, released on completion.
- Tasks are held in memory for streaming and in Firestore for `tasks/get`
  resumption for 10 minutes. In M1 both sessions and tasks live in memory,
  which holds only while one instance serves the plan.
- Instances are stateless between requests. Any instance can serve any turn.

## Board Compiler

`server/lib/agent/board_compiler.dart` turns the plan record and resolved
rules into the `board` surface with fixed layout rules. It uses no model. It
runs after every plan change and on session open when the board is missing.

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
| `HOMEWARD_MARKETS_DIR` | Rule packs, rates, living costs, and places; `/app/markets` in the image |
| `GOOGLE_CLOUD_PROJECT` | Firebase project |

No secrets are required in production. Credentials come from the Cloud Run
service account through Application Default Credentials.

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
- `server/Dockerfile` copies that binary, `server/prompts/`, and `markets/` onto
  `gcr.io/distroless/cc-debian12:nonroot`: glibc and CA certificates, no shell,
  user 65532. The image is about 31 MB.
- The root `.dockerignore` admits only the server binary, the prompts, and the
  markets into the build context.
- The server loads markets and prompts once at startup and refuses to start if
  a market file fails to parse.
- The server exits on SIGTERM within Cloud Run's grace period: it stops
  accepting connections, lets in-flight requests finish, and releases every
  signal watcher so the process can end.
- Cloud Run `europe-north1`, concurrency 40, request timeout 300 s, minimum
  instances 0, maximum 2, to stay within the free allowance; maximum 1 while
  sessions and tasks live in memory in M1; cold starts are
  accepted.
- Artifact Registry Docker repository `homeward` in `europe-north1`, with a
  cleanup policy keeping the three most recent images and deleting the rest.
- Cloud Run runs as `homeward-server@homeward-genui.iam.gserviceaccount.com`
  with Cloud Datastore User, Firebase Authentication Viewer, Firebase App Check
  Token Verifier, and Logs Writer.
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
  headers and a single-page fallback from the root `firebase.json`. Both run
  only when explicitly asked.

## Local Development

- `make server-dev` runs `server/tool/dev.dart` with the VM service and
  `hotreloader`: saved changes in `server` and `common` reload in place. New
  routes need a restart. Firebase emulators for Auth and Firestore join when
  those features land, with App Check not enforced.
- `make server-image-run` builds and runs the production image on port 8080.
- `make app-dev` runs the app against the local server.
- The Gemini key is entered in the app like in production.
