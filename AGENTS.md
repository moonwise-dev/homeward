# Homeward Agent Guide

Read this file before changing the repository. It is the entry point for agents
and contributors; detailed product and implementation rules live in `docs/`.

## Project Overview

Homeward is a home-buying finance agent built as an A2UI vertical sample for
the Flutter GenUI initiative. A buyer says where they want to buy and who they
are; the agent works out which rules apply to that buyer in that place, and
builds the exact interface the situation needs — an affordability form, a
stress test, a purchase-cost breakdown, the obstacles a foreign buyer faces —
instead of walking everyone through the same calculator.

The system is agent-driven and server-owned. A Dart server on Cloud Run runs the
agent, the tools, and the rule packs. The Flutter app renders A2UI surfaces from
a catalog it trusts, recomputes what-if figures locally through shared finance
code, and never contains market rules or prompts.

## Repository Shape

The repository is a Dart pub workspace. The root `pubspec.yaml` lists every
package, there is one `pubspec.lock`, and the root `analysis_options.yaml`
holds the shared analyzer, linter, and formatter settings that each package
includes.

- `app` - Flutter client for iOS, Android, and Web; macOS for development only.
- `server` - Dart `shelf` server on Cloud Run: A2A endpoint, agent loop, tools.
- `common` - pure Dart package shared by `app`, `server`, and `tool`: domain
  models, finance math, market rule pack schema, catalog contract, wire types.
  It must never import Flutter.
- `markets` - curated market rule packs and reference-rate snapshots. Data, not
  code.
- `tool` - Dart CLIs: pack validation, catalog skill generation, rate snapshot
  refresh, eval runner. Never deployed.
- `docs` - canonical product, architecture, protocol, catalog, agent, market,
  data, design, quality, and roadmap documents.

## Canonical Docs

- `docs/PRODUCT.md` - product behavior, personas, coverage tiers, hero flow.
- `docs/ARCHITECTURE.md` - system shape, package boundaries, code rules.
- `docs/PROTOCOL.md` - A2UI v0.9 usage and the A2A subset on the wire.
- `docs/CATALOG.md` - the Homeward component catalog and client functions.
- `docs/AGENT.md` - agent loop, prompts, tools, uncovered markets, voice door.
- `docs/MARKETS.md` - rule pack schema, curation, sources, reference rates.
- `docs/REQUIREMENTS_APP.md` - client app screens and behavior.
- `docs/REQUIREMENTS_SERVER.md` - endpoints, auth, key handling, deployment.
- `docs/FIRESTORE.md` - collections, rules, and indexes.
- `docs/DESIGN.md` - design tokens and how generated UI stays on-brand.
- `docs/QUALITY.md` - code standards, tests, pack checks, agent evals.
- `docs/ROADMAP.md` - milestones, spikes, risks, decision log, open questions.
- `docs/SPIKES.md` - evidence and decisions from answered spikes.

If a product or implementation convention changes, update the canonical doc
first.

## Agent Operating Rules

- The model lays out; code does numbers. No figure a buyer relies on is ever
  authored by the model.
- Market rules live in rule packs, never in prompts, widgets, or tool bodies.
- Finance math lives once, in `common`, and is used by both server tools and
  client functions.
- Every rule carries a source and a review date. Homeward states rules only for
  curated markets and says plainly when a market is not covered.
- Everything runs on free tiers: buyers' free Gemini keys, Google Cloud within its
  free allowances, no paid store accounts. A feature that needs payment is not
  built.
- The Gemini API key belongs to the user. Never log, persist, or echo it.
- Write no code comments. Names, small functions, and types carry the meaning.
- Prefer composition and small reusable units over copy and paste; prefer
  waiting for a second use over speculative abstraction.
- Tests exist for `common` math, rule packs, catalog contract, server
  validation passes, and agent evals. No widget tests.
- Do not deploy unless explicitly asked.
- Do not revert unrelated worktree changes.

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

`make check` runs format-check, analyze, test, and markets-check.
`catalog-check` and `eval` join as their milestones land; `make eval` needs
`HOMEWARD_EVAL_GEMINI_KEY` and is never part of `check`.

`make hooks` is run once per clone; it points git at `tool/githooks`, whose
`pre-push` runs `make check`.

Always resolve dependencies from the root with `make get`. Running
`pub get` inside a package also resolves the whole workspace.

Generated files are committed and never edited by hand:

- `*.g.dart` and `*.freezed.dart`, from `make codegen`
- `app/lib/firebase_options.dart`, `app/firebase.json`,
  `app/android/app/google-services.json`, and both
  `GoogleService-Info.plist` files, from `flutterfire configure`
- `common/lib/money/generated/*`, from `make iso-4217`
- `common/lib/a2ui/generated/*`, from `make a2ui-schemas`, pinned to an A2UI spec
  commit
- `common/lib/geo/generated/*` and `server/lib/markets/generated/*`, from
  `make territories`, pinned to a CLDR release
- `common/lib/catalog/generated/*`
- `server/prompts/generated/*`
