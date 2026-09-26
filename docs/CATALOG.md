# Homeward Catalog

The catalog is the complete vocabulary the agent can draw with. It is declared
once in `common/lib/catalog`, implemented in `app/lib/catalog`, validated in
`server/lib/agent`, and described to the model by a generated skill.

Catalog ID: `https://moonwise.se/homeward/catalogs/v1/catalog.json`

Since the reset (D129) the catalog holds the agent-visible basic components
only. Homeward's own blocks come back one at a time, each with the step of
`docs/ROADMAP.md` that needs it.

## Design Principles

1. **Few blocks, each expressive.** A small catalog keeps the prompt short and
   Gemini reliable without server rules steering it. A block earns its place
   when basic components cannot show what a buyer's story needs, such as a
   map of their week or a home with the reasons it fits.
2. **Blocks carry the design, Gemini carries the layout.** A block draws one
   thing well with Homeward's tokens; Gemini decides which blocks a buyer's
   screen needs and how they sit together.
3. **Figures are bound, never literal.** A figure a buyer relies on comes from
   a tool or from `common`, reaches the surface through the data model, and is
   bound by path. The schema marks such properties as bound, and the server
   refuses a literal.
4. **Every fact shows its source.** A block that shows a fact shows whether it
   was measured, estimated, said by the buyer, or quoted.
5. **One widget, two places.** The widget behind each item renders the same in
   the journey and in the gallery.

## Basic Components

Agent-visible basic components:

`Text`, `Row`, `Column`, `Card`, `Divider`, `List`, `Tabs`, `Icon`, `Button`,
`CheckBox`, `ChoicePicker`, `TextField`, `DateTimeInput`.

Not agent-visible: `Image`, `Video`, `AudioPlayer`, `Modal`, `Slider`.

Buttons send actions the model names itself (`docs/PROTOCOL.md`).

## Declaring A Component

In `common/lib/catalog/components/`, each component is one declaration: a
`CatalogComponent`, which implements `ComponentApi` from `a2ui_core`, the same
interface genui uses internally for its catalog items. It carries:

- Name.
- Properties built with `json_schema_builder`, `CommonSchemas`, and
  `CatalogSchemas`. The schema adds the v0.9 envelope (`id`, `component`,
  `weight`, `accessibility`) and sets `additionalProperties: false`.
- Bound properties, which accept only `{ "path" }`, never a literal.
- Agent visibility.
- One or more example component trees with a data model.
- A usage note for the model.

It is listed in `homewardComponents` in `common/lib/catalog/homeward_catalog.dart`.

`homewardCatalogDocument()` builds the catalog document from these
declarations and the vendored A2UI v0.9 basic catalog: the agent-visible basic
components, every basic function, and the Homeward components and functions,
with `anyComponent` and `anyFunction` rebuilt over all of them. `a2ui_core`'s
`CommonSchemas` mark shared types with a `REF:` description instead of a
`$ref`; the document turns each into a `$ref` to the vendored common types, as
`a2ui_core` does for inline catalogs, so Homeward and basic components validate
against the same definitions. The server validates against it.

Beside the components, `common/lib/catalog` declares:

- `data_model/`: the slices the server seeds from tool results and the fields
  components may bind, with value shapes and meanings. None yet.
- `functions/`: client functions, `CatalogFunction`s with a pure `evaluate`
  over JSON-shaped arguments, which the app wraps as genui `ClientFunction`s
  and the server can reuse. They serve basic components, such as a check that
  keeps a button disabled. None yet.
- `InlineSurfaces` in `common/lib/wire`: the surface ID pattern and the
  per-turn limit.

From the same declarations `make catalog` generates:

- `common/lib/catalog/generated/catalog.json`, the catalog document.
- `server/prompts/generated/catalog_skill.md`, the model-facing skill: how to
  write messages, binding, actions, the component examples, and then the
  catalog document and the common types as compact JSON Schema, exactly what
  validation enforces (D69).
- `docs/generated/catalog_reference.md`, a human reference.

`make catalog-check` fails if generated files are stale, if any component
example is rejected by the server's `TurnValidator`, or if an item in
`app/lib/catalog/<component>/` built with `catalogItemFor(const X(), …)` has no
declaration, or a declaration has no item.

## Implementing A Component

In `app/lib/catalog/<component>/<component>_item.dart`, a catalog item:

1. Is a genui `CatalogItem` whose `name` and `dataSchema` come from the
   `common` declaration, built with `catalogItemFor`.
2. Reads its bindings through typed readers over genui's `DataContext`.
3. Calls `common` for any figure it computes.
4. Builds its view, `<component>_view.dart`, from `app/lib/ui/core` widgets,
   passing typed values and callbacks.

The plain widget has no genui imports and is what the gallery renders. It is
added to `homewardGenuiCatalog()` in `app/lib/catalog/homeward_catalog.dart`.

The helpers the removed components used, `catalogItemFor` and the binding
readers, are in git history at `6faa8ab` and come back with the first
component.

### Binding Rules

Measured in spike S4:

- A slice binding subscribes once per widget state with
  `DataContext.subscribe(DataPath('/slice'))` and disposes the listenable. An
  update to a field inside the slice notifies it, even though the map object
  is the same instance mutated in place.
- Widget rebuilds coalesce to one per frame. Client function executions do not:
  every data model write re-runs every function bound to it. Client functions
  therefore stay scalar and cheap; series for charts are computed inside the
  component, where rebuilds coalesce.
- Everything written to the data model is JSON-shaped: `Map<String, dynamic>`
  and `List<dynamic>` as produced by `jsonDecode`, never typed Dart literals.
  `a2ui_core` stores maps as given, so writing a `Map<String, Object?>` into a
  map typed `Map<String, Object>` throws.
- genui's basic `Slider` creates a new check stream on every build and writes
  bare numbers, which is why it is not agent-visible.
