# Homeward

A story-driven home-buying and relocation advisor, built as an A2UI vertical
sample for Flutter's GenUI initiative.

Tell Homeward why you are moving and what your days look like. It turns the
story into what matters to you, checks the homes or areas you are weighing
against it on a map (commutes, schools, parks, evenings, noise), and walks
you into the deal: what you can borrow, what it costs, and the rules that
apply where you are buying.

Gemini composes every screen from Homeward's catalog of building blocks. Open
map data measures the places, and shared Dart code computes every amount, so
the model never writes a figure you rely on.

## Run It

You need your own free Gemini API key; the app asks for it on first launch.

```sh
make get
make server-dev   # the agent server on localhost:8080
make app-web      # the app in Chrome, in a second terminal
```

`make check` runs everything a change must pass.

## Repository

| Folder | Holds |
| --- | --- |
| `app` | The Flutter app: journey pages, the catalog of components Gemini composes from, and the design system |
| `server` | The Dart server: the agent loop, research tools on open data, validation of every A2UI message |
| `common` | Pure Dart shared by both: domain models, finance math, the catalog contract, wire types |
| `markets` | Curated lending and tax rules for the markets Homeward verifies |
| `tool` | Developer CLIs: catalog generation, pack checks, the eval runner, the live probe |
| `docs` | How Homeward works and why, starting with [PRODUCT](docs/PRODUCT.md) and [ARCHITECTURE](docs/ARCHITECTURE.md) |

Contributors and coding agents start with [AGENTS.md](AGENTS.md).
