# Homeward Quality

## Gate

`make check` must pass before any change is considered done:

1. `make codegen-check`: build_runner in `app`, `common`, and `server` changes
   no generated file, so the committed `*.g.dart` and `*.freezed.dart` match
   their sources.
2. `dart format --set-exit-if-changed` across `app`, `server`, `common`, `tool`.
3. `flutter analyze` / `dart analyze` with zero issues.
4. `make test`.
5. `make catalog-check`.

## Static Analysis

All packages share the Purrtrait analysis setup: `flutter_lints` or `lints`,
`strict-casts`, `strict-inference`, `strict-raw-types`, single quotes, const
constructors, super parameters, generated files excluded. Additionally:

- `avoid_dynamic_calls`
- `unawaited_futures`
- `prefer_final_locals`
- `always_declare_return_types`
- `exhaustive_cases`

## Code Standards

- No comments, including doc comments.
- One public type per file.
- Small functions with a single responsibility.
- Sealed classes and exhaustive switches for closed sets.
- No `dynamic`; no `late` without a lifecycle hook that guarantees assignment.
- No duplication across packages: shared vocabulary goes to `common`, shared
  visuals go to `app/lib/ui/core`.

## Tests

Tests exist where a wrong answer misleads a buyer or breaks the protocol.
There are no widget tests and no golden image tests.

During the rebuild no new unit tests are written (D137). The tests below keep
running in `make check`, and a test goes when the behaviour it covers changes.
Each chunk ends with `make check` green, a live `make probe` with a few test
stories, and a visual look at the result.

### `common`

| Area | What is pinned |
| --- | --- |
| `money` | Every rounding mode and step against a hand table, 10 000 random cases against exact big integer arithmetic, currency parsing, currency mismatch errors, JSON; run on the VM and in Chrome because web integers are 53-bit |
| `catalog` | The catalog lists each component once; every declared example validates against its schema; bound properties refuse literals and unknown properties; the catalog document composes the basic components and functions |
| `wire` | A2A models round-trip the frames recorded in spike S1, including explicit `null` fields; the client turns text, A2UI, cancel, and JSON-RPC error events into turn events |

### `server`

| Area | What is pinned |
| --- | --- |
| Stream parser | Prose and fenced blocks split correctly across arbitrary delta boundaries |
| Validation passes | One fixture per rule in `docs/PROTOCOL.md`, valid and invalid; JSON slips mended before rejection |
| Turn loop | Tool calls answered in order with their seeds on the surface, measuring steps streamed, the tool round cap and its note, actions handed to the model with their context and surface data, words-only replies left alone, correction rounds with and without an enforced schema, the retry notice, model fallback, quota errors, starting over on a refused or missing history, session ownership and leases |
| Prompts | The instructions join in order and end with the turn context; hand-written prompts state no rule values and name only tools and components that exist |
| Open-data clients | Geocoding inside the city first, one Overpass query for many points, answers kept and reused, refusals reported, road and transit routes read into minutes, metres, and a path |
| A2A | JSON-RPC dispatch and SSE framing against recorded frame fixtures; the app's `HomewardClient` from `common/wire` reads a scripted turn and its failures through the real app handler; an unexpected error ends a turn with `internal` |
| Key verification | Model lookup request, invalid key, unknown model, and deadline to typed errors; the route's statuses and envelope |
| Gemini client | Recorded streams and error bodies to typed events and errors, request JSON, headers and first-step deadlines, fallback only before output, circuits, no key in any error, the next midnight Pacific across daylight saving changes |
| Session documents | A session with its turns survives the round trip through the documents Firestore holds |
| Firestore sessions | Against the emulator: a plan outlives the server, a later turn joins the ones kept, the plans list order and owner, and the lease that one turn at a time takes |

The Firestore tests skip unless `FIRESTORE_EMULATOR_HOST` is set, so `make check`
passes without the emulator; run `make emulator` beside them to cover the store
the recording depends on.

Gemini is never called in `make test`. The Interactions client is exercised
against the streams and error bodies recorded in spike S2 under
`server/test/fixtures/interactions/`: text, function call, function result
continuation, stall after `interaction.created`, in-stream high-demand error,
invalid key, unknown model, invalid tool, deleted previous interaction, and from
spike S3 the free-tier request cap, the search grounding quota, and HTTP 500
high demand. Model lookups for key verification use the responses recorded
under `server/test/fixtures/models/`.
Model selection is tested with a fake clock and a fake transport.

### `app`

- Every catalog example is pumped through the gallery repository and the real
  `Surface` widget at phone width and fails on any exception; the gallery must
  show every component. There are no examples since the reset (D129), so this
  guards the first component that returns.
- The `genui_a2a` compatibility test. A turn the server streamed, a short
  story surface of basic components, is recorded in
  `app/test/fixtures/recorded_turn.sse` by
  `server/test/a2a/recorded_turn_test.dart`, which fails when the wire changes
  and rewrites the file when run with `RECORD=1`. The app test serves that
  recording from a local HTTP fake and replays it through `genui_a2a`'s
  `A2uiAgentConnector` into a `SurfaceController` holding the Homeward catalog,
  proving any A2A client built on the Flutter team's connector renders
  Homeward's turns: the capabilities go out with the catalog id, the text
  arrives, the A2UI messages arrive in order, and every component is in the
  catalog.
- The wire log the inspector reads: what the device recomputed since the last
  frame, the counters a panel opened mid-plan subtracts from, the size and
  surface a frame carries, the ring buffer, and the stream a watcher sees.
  Frame sizes and the gaps between them are pinned where they are formatted.
- Plans and key repositories: the server's list merged with this run's plans,
  newest first, and the development keys used while no key is saved.
- The theme: every text slot a surface can reach draws in a Homeward face.

## Catalog Check

`tool/bin/catalog_check.dart`, part of `make check`:

- Generated catalog JSON, prompt skill, and reference doc are up to date.
- Every component example passes the server's `TurnValidator` against its own
  data model: envelope, ownership, allow-list, schema, structure, and paths.
- Every declared component has an app catalog item and the reverse.

## Agent Evals

Removed with the reset (D129): the case set scored whether Gemini followed the
case's script, which is what the reset undid. Evals return with the rebuild,
driving `TurnOrchestrator` in process with the real prompts and catalog (D93)
and scoring what matters when Gemini composes freely: every message valid,
every figure from a tool, every place checked, and different stories getting
structurally different screens. They never score which question came when.

Until then `make probe` runs one live turn against a running server; see
`AGENTS.md`.

## Pre-Push Hook

There is no hosted CI while the repository has no remote (D53).

- `make hooks` sets `core.hooksPath` to `tool/githooks` once per clone.
- `tool/githooks/pre-push` runs `make check`.
- Hosted CI running the same targets is added when the repository is hosted.
