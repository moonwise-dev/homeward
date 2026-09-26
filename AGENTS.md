# Homeward Agent Guide

Read this file before changing the repository. It is the entry point for agents
and contributors; detailed product and implementation rules live in `docs/`.

## Project Overview

Homeward is a relocation agent built as an A2UI vertical sample for the
Flutter GenUI initiative. It works on a move the way a coding agent works on a
codebase: a buyer tells it a little, Gemini deduces what it can, looks up what
it can find out, asks one decision at a time, keeps a brief of what it learned,
and offers areas, homes, and research once it knows enough. The screen is
composed from Homeward's building blocks as the conversation goes, so two
buyers with different stories see different screens. Nothing is scripted.

The system is agent-driven and server-owned. A Dart server on Cloud Run runs
the composing agent and its tools; open map data and routing supply the facts.
The Flutter app renders A2UI surfaces from a catalog it trusts, maps included
through a Flutter renderer of the Maps Agentic UI Toolkit's catalog, and never
contains prompts.

On 2026-09-26 the project was cleaned down to its foundation (D129): the
earlier question-by-question case, the sample homes, the deal, and the evals
were removed. The product is being rebuilt from here in small chunks; see
`docs/ROADMAP.md`.

## Repository Shape

The repository is a Dart pub workspace. The root `pubspec.yaml` lists every
package, there is one `pubspec.lock`, and the root `analysis_options.yaml`
holds the shared analyzer, linter, and formatter settings that each package
includes.

- `app` - Flutter client for iOS, Android, and Web; macOS for development only.
- `server` - Dart `shelf` server on Cloud Run: A2A endpoint, agent loop, tools.
- `common` - pure Dart package shared by `app`, `server`, and `tool`: money,
  geo, catalog contract, wire types. It must never import Flutter.
- `tool` - Dart CLIs: catalog skill generation and checks, vendoring, the live
  probe, the local development server. Never deployed.
- `docs` - canonical product, architecture, protocol, catalog, agent, data,
  design, quality, and roadmap documents.

## Canonical Docs

- `docs/PRODUCT.md` - product direction, principles, and what the demo shows.
- `docs/ARCHITECTURE.md` - system shape, package boundaries, code rules.
- `docs/PROTOCOL.md` - A2UI v0.9 usage and the A2A subset on the wire.
- `docs/CATALOG.md` - the Homeward component catalog and client functions.
- `docs/AGENT.md` - agent loop, prompts, tools, voice door.
- `docs/REQUIREMENTS_APP.md` - client app screens and behavior.
- `docs/REQUIREMENTS_SERVER.md` - endpoints, auth, key handling, deployment.
- `docs/FIRESTORE.md` - collections, rules, and indexes.
- `docs/DESIGN.md` - design tokens and how generated UI stays on-brand.
- `docs/QUALITY.md` - code standards, tests, catalog checks.
- `docs/ROADMAP.md` - milestones, spikes, risks, decision log, open questions.
- `docs/SPIKES.md` - evidence and decisions from answered spikes.

If a product or implementation convention changes, update the canonical doc
first.

## Agent Operating Rules

- Gemini composes; tools measure; code computes. The composing model never
  writes a figure a buyer relies on: distances, times, counts, and amounts come
  from tools or shared code.
- Gemini decides what the screen shows and asks. The server checks that what it
  draws is valid, never which question comes next. When the model misbehaves,
  try a smaller catalog, a clearer prompt, or a better tool before a server
  rule that takes a decision away from it.
- Homeward works like a coding agent (D130): it deduces first, never asks what
  a tool can find out, asks one decision at a time with its recommendation,
  and keeps a brief of what it learned. No scenario or scripted flow goes in
  the product; the catalog holds building blocks, not screens.
- Work in small chunks, each one demoable, and say what each leaves out.
- Every fact carries its source kind: stated by the buyer, deduced from their
  words, measured, estimate, or quoted from a source. Estimates are labelled;
  a quote appears word for word in what it names.
- Every place a model names is checked against open map data before it is shown.
- Math lives once, in `common`, and is used by both server tools and client
  functions.
- Everything runs on free tiers: buyers' free Gemini keys, open map data,
  Google Cloud and Google Maps Platform within their free monthly allowances
  with quotas capped there, no paid store accounts. A feature that needs
  payment is not built.
- The Gemini API key belongs to the user. Never log, persist, or echo it. Keys
  the server holds live in Secret Manager and are never logged either.
- Every key reaches code as an environment variable. A developer's keys live in
  the git-ignored `.env`, copied from `.env.example`; never commit, print, or
  paste a value.
- Write no code comments. Names, small functions, and types carry the meaning.
- Prefer composition and small reusable units over copy and paste; prefer
  waiting for a second use over speculative abstraction.
- No new unit tests during the rebuild (D137). Existing tests for `common`
  money, the catalog contract, server validation passes, the agent loop, and
  the open-data clients keep running, and a test goes when the behaviour it
  covers changes. No widget tests; the UI is reviewed visually. Each chunk
  ends with `make check` green, a live probe, and a visual look.
- Do not deploy unless explicitly asked.
- Do not revert unrelated worktree changes.

## Agent Tooling

Claude Code picks these up from `.claude/settings.json` and `.mcp.json`, and
asks once to trust them:

- The `dart-flutter` plugin (`flutter/agent-plugins`): the Dart MCP server,
  which can analyze, run tests, launch the app, hot reload, read runtime errors
  and the widget tree, and read pinned package sources, plus the Flutter and
  Dart skills. Where a skill disagrees with this file, such as writing tests,
  this file wins.
- The `gemini-skills` plugin (`google-gemini/gemini-skills`): the Gemini API
  and Live API skills.
- The `firebase` plugin (`firebase/agent-skills`): the Firebase MCP server and
  the Firestore and rules skills. Deploying still waits for an explicit ask.
- The `chrome-devtools-mcp` plugin: screenshots, console, and network of the
  web app for the visual look at the end of a chunk.
- The Google Maps Platform Code Assist MCP server in `.mcp.json`: official Maps
  docs and samples, used from C5.

Project skills in `.claude/skills/`:

- `homeward-chunk` runs one chunk of `docs/ROADMAP.md` end to end, with the
  test stories used for probing and rehearsal.
- `homeward-block` adds a catalog block.
- `homeward-tool` adds an agent tool.

## Verification

Root `Makefile` targets:

```sh
make get
make hooks
make format
make analyze
make test
make check
```

Server:

```sh
make server-dev
make server-build
make server-image-run
```

App and local server, started together:

```sh
make app                # Chrome; make app DEVICE=macos or DEVICE=<android id>
```

`make check` runs codegen-check, format-check, analyze, test, and
catalog-check.

`make probe SERVER=http://localhost:8080 MESSAGE="…"` signs in anonymously,
creates a session, and streams one live turn against a running server,
printing text, surfaces, and timings. It reads Gemini keys from
`HOMEWARD_EVAL_GEMINI_KEY` and `HOMEWARD_EVAL_GEMINI_MOON_KEY`, moves to the
second when the first hits its quota, and never prints them.

The Makefile loads `.env` from the root and exports its variables to every
target. Copy `.env.example` to `.env` once per clone and fill in the keys you
use; `docs/REQUIREMENTS_SERVER.md` lists what reads each one. `make app`,
`make app-web`, `make app-macos`, and the VS Code launch "Homeward app" start
the local server when it is not running and run the app; the server hands the
app the development Gemini keys, so it skips the key screen. Run above `main()`
works the same when a server is already up.

`make hooks` is run once per clone; it points git at `tool/githooks`, whose
`pre-push` runs `make check`.

Always resolve dependencies from the root with `make get`. Running
`pub get` inside a package also resolves the whole workspace.

Generated files are committed and never edited by hand:

- `*.g.dart` and `*.freezed.dart`, from `make codegen`; `make codegen-check`
  fails when they are stale. `.vscode/settings.json` nests them under their
  source file and hides build caches, so folders show what people write
- `app/lib/firebase_options.dart`, `app/firebase.json`,
  `app/android/app/google-services.json`, and both
  `GoogleService-Info.plist` files, from `flutterfire configure`
- `common/lib/money/generated/*`, from `make iso-4217`
- `common/lib/a2ui/generated/*`, from `make a2ui-schemas`, pinned to an A2UI spec
  commit
- `common/lib/catalog/generated/*`, `server/prompts/generated/*`, and
  `docs/generated/*`, from `make catalog`
