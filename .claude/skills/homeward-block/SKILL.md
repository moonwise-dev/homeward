---
name: homeward-block
description: Add or change a Homeward catalog block end to end - the declaration in common, the generated catalog and skill, the Flutter item and view, the gallery, and the catalog check. Use when a chunk adds a component such as Fact, GoogleMap, weekly travel, or a home block.
---

# Homeward Block

The catalog holds building blocks, not screens (`docs/CATALOG.md`). A block
earns its place only when the basic components cannot show what a buyer's
story needs.

## 1. Before building

- Check that the block is in "Planned Blocks" in `docs/CATALOG.md`, and that
  its chunk is the current one.
- Update `docs/CATALOG.md` first: properties, bindings, and the usage note.
- Keep it small and general. One block draws one thing well. Gemini decides
  where it goes and what sits beside it.

## 2. Declare it in `common`

- **The declaration.** Create
  `common/lib/catalog/components/<component>.dart`, a `CatalogComponent`,
  which implements `ComponentApi` from `a2ui_core`. It carries:
  - the name;
  - its family: understanding, money, homes, place and travel, or trust;
  - properties built with `json_schema_builder`, `CommonSchemas`, and
    `CatalogSchemas` (`common/lib/catalog/catalog_schemas.dart`);
  - bound properties, which accept only `{ "path" }` for any figure a buyer
    relies on;
  - agent visibility;
  - one or more example component trees, each with a data model;
  - a one-line description for the model. The skill's index shows it, and
    Gemini reads the schema and examples through `component_docs` (D143).
- **List it** in `homewardComponents` in
  `common/lib/catalog/homeward_catalog.dart`.
- **Tool seeds.** If the block binds what a tool seeds, declare the slice as a
  `DataSlice` in `common/lib/catalog/data_model/` and list it in
  `dataModelSlices`.
- **Client functions.** If a basic component needs a check or a derived value,
  add a `CatalogFunction` in `common/lib/catalog/functions/` with a pure
  `evaluate`, and list it in `homewardFunctions`.
- **Toolkit components** (`GoogleMap`, `PlaceDetailsCompact`):
  - keep the Maps Agentic UI Toolkit's schema exactly;
  - vendor it at a pinned commit, the way `make a2ui-schemas` vendors the
    basic catalog;
  - check literal coordinates in validation rather than changing the schema
    (D133).

## 3. Generate

Run `make catalog`. It regenerates three files:
- `common/lib/catalog/generated/catalog.json`;
- `server/prompts/generated/catalog_skill.md`;
- `docs/generated/catalog_reference.md`.

Never edit them by hand.

## 4. Implement it in the app

- **The first block of the rebuild** restores two helpers from `6faa8ab`:
  - `app/lib/catalog/catalog_item_for.dart`;
  - the binding readers in `app/lib/catalog/bindings/`.

  Restore them with `git show 6faa8ab:<path>`, taking only what the block
  uses.
- **The item.** `app/lib/catalog/<component>/<component>_item.dart` is a genui
  `CatalogItem` built with `catalogItemFor(const <Component>(), …)`, so its
  name and schema come from the declaration. It reads bindings through typed
  readers over `DataContext`, and calls `common` for any figure it computes.
- **The view.** `app/lib/catalog/<component>/<component>_view.dart` is a plain
  widget with no genui imports, built from `app/lib/ui/core` and the design
  tokens in `docs/DESIGN.md`. The gallery renders this widget.
- **Register it** in `homewardGenuiCatalog()` in
  `app/lib/catalog/homeward_catalog.dart`.
- **Binding rules** (spike S4, `docs/CATALOG.md`):
  - subscribe to a slice once per widget state, and dispose it;
  - everything written to the data model is JSON-shaped;
  - client functions stay scalar and cheap.

## 5. Check and look

- `make catalog-check` fails when:
  - an example is rejected by the server's validator;
  - an item has no declaration;
  - a declaration has no item.
- Then run `make check`.
- Serve the web app and open `/gallery/<Block>` in the Chrome DevTools MCP
  to screenshot the block, its examples, and its parameters (see
  `homeward-chunk`, step 7).
- No widget or golden tests (D137).
