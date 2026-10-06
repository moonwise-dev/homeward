---
name: homeward-tool
description: Add or change a Homeward agent tool on the server - an AgentTool that measures through the open-data clients, reports progress steps, seeds data model slices, and joins homewardTools. Use when a chunk adds a tool such as update_brief, find_place, measure_week, search_homes, or suggest_areas.
---

# Homeward Tool

Gemini composes; tools measure; code computes (`docs/AGENT.md`). A tool gives
Gemini facts and gives the screen data to bind. It never decides what Gemini
asks or draws.

## 1. Before building

- Check that the tool is in "Planned tools" in `docs/AGENT.md`, and that its
  chunk is the current one.
- Update `docs/AGENT.md` first: its name, what it measures, and what it seeds.
- If it seeds a slice, add that slice to `docs/CATALOG.md`.

## 2. The tool

Write `server/lib/tools/<tool_name>.dart` as a `final class` extending
`AgentTool` (`server/lib/tools/agent_tool.dart`).

- **`name`**: snake_case, the way Gemini calls it.
- **`description`**: written for the model. It says what the tool finds out
  and when it helps. Put guidance here rather than in a prompt rule.
- **`parameters`**: JSON Schema for the arguments, as small as it can be.
- **`run(arguments, steps)`**: returns
  `ToolResult(modelResult: …, seeds: …)`.
  - `modelResult` is what Gemini reads.
  - `seeds` are data model slices keyed by slice name. Each is declared as a
    `DataSlice` in `common/lib/catalog/data_model/` and listed in
    `dataModelSlices`, so bound paths validate.

## 3. Rules

- **Measure through `server/lib/research`:**
  - `Research` holds `nominatim`, `overpass`, and `routing`;
  - the clients are polite and cached (D112);
  - never call Gemini from a tool.
- **Report progress.** Wrap each lookup in
  `steps.track('<label>', () => …)`. The label is written by code, for the
  buyer, never by the model (D108).
- **Figures come from measurement or `common`.** A place the model names is
  resolved against open data before it is shown (D101). Coordinates, minutes,
  metres, counts, and amounts are never taken from the model's arguments.
- **Hand over the block.** A tool that seeds a slice answers with `draw`:
  the components that show its result, built with `block`, `boundTo`, and
  `sends` from `server/lib/tools/draw.dart`, so Gemini draws them without a
  round to read their docs (D167). Gemini still decides which to show.
- **Errors.** A tool that throws answers the model with an error and changes
  nothing. Do not add fallbacks that draw for the model.
- **Buyer data.** A tool that reads or writes buyer data, such as
  `update_brief`, goes through the session repository, and never logs the
  content.

## 4. Wire it

- Add the tool to `homewardTools` in `server/lib/tools/homeward_tools.dart`.
- `ToolBelt` is built in `server/lib/data/providers/providers.dart`. The first
  tool that needs `Research` or the session turns that const list into
  providers that inject them.
- If the slices changed, run `make catalog`.

## 5. Check

- Run `make check`. There are no new unit tests (D137); fix or delete an
  existing test only when the behaviour changed on purpose.
- Run a live probe with test stories that should make Gemini call the tool
  (see `homeward-chunk`, step 6).
- Confirm that the progress steps stream, the seeds validate, and the model
  uses the result without being told to.
