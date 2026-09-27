---
name: homeward-chunk
description: Run one Homeward rebuild chunk (C1 to C13 in docs/ROADMAP.md) end to end - docs first, build, make check, a live probe with test stories, and a visual look. Use when starting, continuing, or finishing a chunk, or when the user says "next chunk".
---

# Homeward Chunk

A chunk is one visible change, demoable on its own, that says what it leaves
out (D137). Work through these steps in order.

## 1. Scope

- Read the chunk in `docs/ROADMAP.md` ("The Rebuild") and every decision it
  cites in the decision log.
- State in two or three lines what the chunk adds and what it leaves out.
- If a real decision is open, ask with concrete options and a recommendation
  before building. Do not widen the chunk.

## 2. Docs first

Update the canonical doc the chunk changes before any code: `docs/AGENT.md`,
`docs/CATALOG.md`, `docs/PROTOCOL.md`, `docs/REQUIREMENTS_APP.md`,
`docs/REQUIREMENTS_SERVER.md`, `docs/FIRESTORE.md`, or `docs/DESIGN.md`.

## 3. Build

- Follow `AGENTS.md`:
  - no code comments;
  - math in `common`;
  - figures from tools;
  - reuse before new code.
- Never add a server rule that picks the next question, withholds a tool, or
  draws for the model (D129). When Gemini misbehaves, try a smaller catalog,
  a clearer prompt, or a better tool first.
- Nothing scripted: no stories, stages, or flows in code or prompts (D130).
- Adding a catalog block: use the `homeward-block` skill.
- Adding an agent tool: use the `homeward-tool` skill.
- The Dart MCP server can read the pinned sources of genui and `a2ui_core`
  from the pub cache (`read_package_uris`, `rip_grep_packages`). Read them
  rather than guess.

## 4. Tests

No new unit tests (D137). When an existing test breaks because behaviour
changed on purpose, update or delete that test and say so. Never weaken a test
to hide a bug.

## 5. Check

Run `make check`: codegen-check, format-check, analyze, test, and
catalog-check. `make format` fixes formatting. After changing a catalog
declaration, run `make catalog`.

## 6. Live probe

- Start the local server in the background with `make dev-server`.
- Stop it afterwards with `make dev-server-stop`.
- Run two or three stories from `test_stories.md` in this folder:
  ```
  make probe MESSAGE="…"
  ```
  - Pick stories that exercise the chunk.
  - They are inputs only, never part of the product.
- The probe reads `HOMEWARD_EVAL_GEMINI_KEY` and
  `HOMEWARD_EVAL_GEMINI_MOON_KEY` from `.env`. Never print, cat, or echo keys
  or `.env`, and redact `AIza…` and `csk-…` in any log you show.
- Note for each run:
  - model rounds, corrections, and rejections;
  - time to first text and in total;
  - what Gemini drew and asked.

## 7. Visual look

- With the server up, serve the web app in the background from `app/`:
  ```
  flutter run -d web-server --web-port 8090
  ```
- In the Chrome DevTools MCP:
  - open `http://localhost:8090`, or `/gallery/<Block>` for a block on its
    own, which needs no server; the canvas does not scroll under automation,
    so resize the page tall instead;
  - take a screenshot;
  - read the console messages;
  - for a turn, read the network request that streams SSE.
- Flutter web draws to a canvas. Screenshots and the console work; clicking
  needs the semantics tree, so type into the field or use the probe for turns.
- The Dart MCP server can also launch the app, hot reload, and read runtime
  errors and the widget tree.

## 8. Report

- Say what changed, with the probe numbers and screenshots.
- Say what the chunk leaves out, and which chunk comes next.
- Mark the chunk done in `docs/ROADMAP.md`, adding "— done" to its heading or
  bullet.
- Commit only when the user asks.
