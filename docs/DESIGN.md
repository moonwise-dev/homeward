# Homeward Design System

Calm, trustworthy, editorial. Money decisions are stressful; the interface
should feel like a patient advisor's notebook, not a trading terminal.

**Rule:** styling goes through tokens in `app/lib/ui/core/themes` (`AppColors`,
`AppTextStyles`, `AppSpacing`, `AppRadii`, `AppTheme`) and `App*` primitives.
Catalog items and features never inline hex values, `TextStyle`, or ad-hoc
decorations. A missing value is added to the tokens, not to a feature.

Generated UI must look native. Because every catalog item is built from the
same primitives, a surface the model composed and a screen a developer built
are visually indistinguishable.

The values below were the starting proposal; the design pass of milestone M2
settled them.

## Colour (`AppColors`)

| Token | Light | Use |
| --- | --- | --- |
| `background` | `#F6F4EF` | Page |
| `surface` | `#FFFFFF` | Cards and sheets |
| `surfaceMuted` | `#EFECE5` | Table stripes, input fills |
| `border` | `#DDD8CD` | Card and field borders |
| `borderStrong` | `#C5BFB1` | Focus-adjacent, dividers in tables |
| `text` | `#17212B` | Primary text and figures |
| `textSecondary` | `#17212B` @ 77% | Supporting copy |
| `textTertiary` | `#17212B` @ 63% | Captions, units |
| `accent` | `#1D5C4D` | Primary actions, curated badge, series 1 |
| `onAccent` | `#FFFFFF` | |
| `accentSoft` | `#1D5C4D` @ 10% | Selected states |
| `info` | `#2B5C8A` | Series 2, informational notes |
| `positive` | `#2E7D5B` | Pass |
| `warning` | `#A86B12` | Warn, uncovered badge, stress marker |
| `danger` | `#B3261E` | Fail, limit lines |

Every grey clears WCAG AA against the page, a card and the muted fill: `text`
at 15.6:1, `textSecondary` at 7.2:1, `textTertiary` at 4.6:1. Captions carry
sentences a buyer has to read — what a refund depends on, what sets a limit —
so the lightest grey is held to the same bar as the rest.

Dark tokens come after the recording; the light set above is what ships.

## Typography (`AppTextStyles`)

Headings in a warm serif, everything else in a neutral sans, every figure in
tabular numerals so columns and animated values never jitter.

| Style | Font | Size / weight | Use |
| --- | --- | --- | --- |
| `display` | Fraunces | 28 / 600 | Page titles |
| `title` | Fraunces | 20 / 600 | Card titles |
| `body` | Inter | 15 / 400 | Chat text, descriptions |
| `label` | Inter | 13 / 500 | Field labels, table headers |
| `caption` | Inter | 12 / 400 | Sources, units, dates |
| `figureLarge` | Inter | 32 / 600, tabular | Headline amounts |
| `figure` | Inter | 17 / 500, tabular | Table and breakdown amounts |
| `code` | Roboto Mono | 12 / 400 | A2UI messages and data models in the wire inspector |

The five faces ship as assets under `app/assets/fonts`, vendored by `make fonts`
against the checksums `google_fonts` pins, and `allowRuntimeFetching` is off, so
a recording never waits on a font server and never flashes a fallback face.
`tool/test/fonts` fails if a file is missing or no longer matches.

A surface the model draws reaches type through Material rather than through
`AppTextStyles`, so every slot of the `TextTheme` maps onto a style above and a
slot left unset would render in the platform's own face.

| A2UI `Text` variant | Material slot | Style |
| --- | --- | --- |
| `h1` | `headlineLarge` | `display` |
| `h2`, `h3`, `h4` | `headlineMedium`, `headlineSmall`, `titleLarge` | `title` |
| `h5` | `titleMedium` | `body` at 600 |
| `caption` | `bodySmall` | `caption` |
| `body` | `bodyMedium` | `body` |

## Space And Shape

- `AppSpacing`: 4, 8, 12, 16, 24, 32, 48.
- `AppRadii`: `sm` 8, `md` 12, `lg` 16, `pill` 999.
- Cards: `surface`, 1 px `border`, radius `md`, no shadow.
- Sheets: the page background with a drag handle; a pane beside the journey is
  separated by a divider rather than a shadow.
- Fields: `surface` fill, 1 px `border`, radius `sm`, height 48.
- Primary button: `accent` fill, pill, height 48, `onAccent` label.

## Motion

Durations and the curve are tokens in `AppMotion`; `AppMotion.of` returns zero
whenever the device asks for stillness, so every animation below is off under
reduced motion.

- Surfaces fade in and rise 8 dp over 200 ms as they arrive, through
  `AppSurfaceEntry` around each surface in the transcript.

## Charts

A chart, when a component needs one, is Homeward's own `CustomPainter` inside
a `RepaintBoundary`, never a chart package: in spike S4, `fl_chart` redrawn on
every frame of a drag cut a throttled JS build to about 23 fps, and a
`CustomPainter` with the same series held about 57. Every chart exposes a
summary of what it draws as its semantics label.

## Primitives (`app/lib/ui/core/ui`)

Tokens: `AppColors`, `AppTextStyles`, `AppSpacing`, `AppRadii`, `AppSizes`,
`AppMotion`, `AppTheme`.

Layout and text: `AppPage`, `AppCard`, `AppBulletList`, `AppChatBubble`,
`AppSurfaceEntry`, `AppReveal`.

Input: `AppButton`, `AppTextField`, `AppSelectField`.

Figures and status: `AppFigureRow`, `AppStatusLine`.

Feedback: `AppMessageOverlay`, `AppToast`, `AppLoadingIndicator`.

A primitive that only a removed component used was removed with it (D129) and
comes back with the next component that needs it. A two-pane screen is a `Row`
of the journey and one pane; a sheet is `showModalBottomSheet` behind a named
helper, as in `showHistorySheet`.

## Messages

Transient messages are toasts through the message bus, mounted once in
`MaterialApp.builder`, as in Purrtrait. Features never build a message surface
and nothing calls `ScaffoldMessenger`.

## A2UI Theme

A2UI v0.9 `createSurface.theme` is not used. The renderer's native theme
decides appearance, which is also the direction of A2UI v1.0.
