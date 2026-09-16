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
| POST | `/internal/cleanup` | Cloud Scheduler OIDC | Deletes plans inactive for 90 days, expired researched packs |
| GET | `/healthz` | none | Liveness |
| GET | `/live` | Phase 2 | Voice WebSocket door |

`/api/*` routes use the envelope `{ "ok": true, "data": {} }` and
`{ "ok": false, "error": { "code": "", "message": "" } }`. `/a2a` uses JSON-RPC
errors with the same codes in `error.data.code`.

## Middleware Order

1. Request ID.
2. Redaction: removes `X-Homeward-Gemini-Key` and `Authorization` from anything
   that could be logged.
3. CORS: allows the Hosting origin and local development origins.
4. Firebase ID token verification with `firebase_admin_sdk`; anonymous accounts
   accepted.
5. App Check token verification.
6. Gemini key extraction into the request context for routes that need it.
7. Rate limiting per UID.
8. Error mapping.

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
| Research runs per UID | 10 per day |
| Concurrent turns per session | 1 |
| Sessions per UID | 50 |

Limits are counted in Firestore with fixed windows so they hold across
instances.

## Error Codes

| Code | Meaning |
| --- | --- |
| `unauthenticated` | Missing or invalid Firebase ID token |
| `app_check_failed` | Missing or invalid App Check token |
| `gemini_key_missing` | Key header absent |
| `gemini_key_invalid` | Gemini rejected the key |
| `gemini_quota_exhausted` | Gemini returned a quota error; includes retry-after |
| `gemini_unavailable` | Gemini returned a server error |
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
  resumption for 10 minutes.
- Instances are stateless between requests. Any instance can serve any turn.

## Board Compiler

`server/lib/agent/board_compiler.dart` turns the plan record and resolved
rules into the `board` surface with fixed layout rules. It uses no model. It
runs after every plan change and on session open when the board is missing.

## Configuration

| Key | Purpose |
| --- | --- |
| `HOMEWARD_TURN_MODEL` | Turn model ID |
| `HOMEWARD_RESEARCH_MODEL` | Research model ID |
| `HOMEWARD_MAX_CORRECTIONS` | Validation correction rounds |
| `HOMEWARD_ALLOWED_ORIGINS` | CORS origins |
| `HOMEWARD_APP_CHECK_ENFORCED` | Enforce App Check, off for local development |
| `GOOGLE_CLOUD_PROJECT` | Firebase project |

No secrets are required in production. Credentials come from the Cloud Run
service account through Application Default Credentials.

## Observability

- Structured JSON logs to Cloud Logging with request ID, UID hash, session ID,
  turn ID, tool names and durations, validation failures, token usage, model
  latency.
- No prompt text, buyer messages, profile values, or model output in logs.
  Those live only in the buyer's Firestore documents.
- Error Reporting on uncaught exceptions.

## Deployment

- `server/Dockerfile`: multi-stage, `dart compile exe`, runtime on a minimal
  base image, `markets/` copied in.
- Cloud Run `europe-north1`, concurrency 40, request timeout 300 s, minimum
  instances 0, maximum 10. Minimum 1 during recording sessions.
- Service account roles: Firestore user, Firebase Auth viewer, App Check token
  verifier, logging writer.
- Firebase Hosting rewrites `/a2a`, `/api/**`, and `/.well-known/**` to the
  Cloud Run service.
- `make deploy-server` and `make deploy-web` exist and run only when explicitly
  asked.

## Local Development

- `make server-dev` runs the server with hot restart against the Firebase
  emulators for Auth and Firestore, App Check not enforced.
- `make app-dev` runs the app against the local server.
- The Gemini key is entered in the app like in production.
