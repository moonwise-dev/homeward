# Homeward Spikes

Each spike answers one question from `docs/ROADMAP.md` with evidence, ends in a
decision, and lists what the decision changed. Probe code lives outside the
repository; the findings here are what remains.

## S5 — `a2ui_core` On The Server

**Answered 2026-09-16.**

### Question

Is `a2ui_core` pure Dart and usable on the server for A2UI message models and
validation, or does Homeward own its v0.9 models?

### Method

- Read `a2ui_core` 0.1.1 and how `genui` 0.10.3 uses it.
- A console probe outside the workspace exercised message parsing, component
  schema validation, and a server-side `MessageProcessor`, run under JIT, AOT,
  and a Linux x64 cross-compile.

### Findings

| Area | Result |
| --- | --- |
| Dependencies | `collection`, `json_schema_builder`, `meta`, `preact_signals`. No Flutter. |
| Relation to genui | `genui` 0.10.3 depends on `a2ui_core ^0.1.0` and exposes every `CatalogItem` to it as a `ComponentApi` whose schema is the item's `dataSchema`. |
| Compilation | JIT and AOT output identical; cross-compiles to Linux x64. |
| Message parsing | `A2uiMessage.fromJson` enforces `version: v0.9` and exactly one message body with `A2uiValidationError`. Wrong field types and missing required fields throw a raw `TypeError` instead. |
| Client actions | `A2uiClientAction` has `toJson` only. The server needs its own parsing. |
| Component validation | None in `a2ui_core`. `genui` validates each component with `json_schema_builder` inside the Flutter package, so the server cannot import it. |
| Schema checks | A `ComponentApi` schema built from `CommonSchemas.dataBinding` rejects a literal where a binding is required, and with `additionalProperties: false` rejects unknown properties and reports missing required ones, each with a path. |
| Schema cost | About 40 µs per component under JIT, 12 µs AOT. |
| Shadow state | `MessageProcessor` runs on the server: builds surfaces, applies data model updates, resolves paths, rejects updates to unknown surfaces with `A2uiStateError`. It does not check component types against the catalog. |
| Capabilities shape | `getClientCapabilities` returns `{ "v0.9": { "supportedCatalogIds": [...] } }`, keyed by version. |
| Data model shape | `getClientDataModel` returns `{ "version": "v0.9", "surfaces": { ... } }`. |

### Decisions

- **D34:** `common` depends on `a2ui_core`, pinned exactly, for message classes,
  `ComponentApi`, `Catalog`, `CommonSchemas`, and `MessageProcessor`. Homeward
  components are declared once as `ComponentApi` classes; the app wraps each in
  a genui `CatalogItem`, and the server validates against the same schema.
  `common/a2ui` adds client action parsing, `TypeError` mapping, the allow-list,
  and tree structure checks.
- **D35:** The server replays each session's stored messages into a shadow
  `MessageProcessor` at the start of a turn and feeds every candidate message
  through it before forwarding.

### Consequences

- `docs/PROTOCOL.md`: capabilities and data model metadata use the version-keyed
  shapes; validation passes name the `a2ui_core` part each relies on; the
  bound-number rule is enforced by schema.
- `docs/CATALOG.md`: declarations are `ComponentApi` classes; app items are genui
  `CatalogItem`s built from them.
- `docs/ARCHITECTURE.md`: `common/a2ui` added; `a2ui_core` is the source of A2UI
  protocol types.
- `docs/AGENT.md`: the turn orchestrator validates through the shadow processor.
- Spike S1 must confirm `genui_a2a` sends the same capability and data model
  shapes.
