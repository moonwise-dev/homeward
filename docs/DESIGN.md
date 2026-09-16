# Homeward Design System

Calm, trustworthy, editorial. Money decisions are stressful; the interface
should feel like a patient advisor's notebook, not a trading terminal.

**Rule:** styling goes through tokens in `app/lib/ui` (`AppColors`,
`AppTextStyles`, `AppSpacing`, `AppRadii`, `AppTheme`) and `App*` primitives.
Catalog items and features never inline hex values, `TextStyle`, or ad-hoc
decorations. A missing value is added to the tokens, not to a feature.

Generated UI must look native. Because every catalog item is built from the
same primitives, a surface the model composed and a screen a developer built
are visually indistinguishable.

The values below are the starting proposal and are finalised in the design pass
of milestone M2.

## Colour (`AppColors`)

| Token | Light | Use |
| --- | --- | --- |
| `background` | `#F6F4EF` | Page |
| `surface` | `#FFFFFF` | Cards, sheets, board |
| `surfaceMuted` | `#EFECE5` | Table stripes, input fills |
| `border` | `#DDD8CD` | Card and field borders |
| `borderStrong` | `#C5BFB1` | Focus-adjacent, dividers in tables |
| `text` | `#17212B` | Primary text and figures |
| `textSecondary` | `#17212B` @ 68% | Supporting copy |
| `textTertiary` | `#17212B` @ 45% | Captions, units |
| `accent` | `#1D5C4D` | Primary actions, curated badge, series 1 |
| `onAccent` | `#FFFFFF` | |
| `accentSoft` | `#1D5C4D` @ 10% | Selected states |
| `info` | `#2B5C8A` | Series 2, informational notes |
| `positive` | `#2E7D5B` | Pass |
| `warning` | `#A86B12` | Warn, uncovered badge, stress marker |
| `danger` | `#B3261E` | Fail, limit lines |

Dark tokens are defined alongside from the start and shipped after the
recording.

## Typography (`AppTextStyles`)

Headings in a warm serif, everything else in a neutral sans, every figure in
tabular numerals so columns and animated values never jitter.

| Style | Font | Size / weight | Use |
| --- | --- | --- | --- |
| `display` | Fraunces | 28 / 600 | Plan title, board heading |
| `title` | Fraunces | 20 / 600 | Card titles |
| `body` | Inter | 15 / 400 | Chat text, descriptions |
| `label` | Inter | 13 / 500 | Field labels, table headers |
| `caption` | Inter | 12 / 400 | Sources, units, dates |
| `figureLarge` | Inter | 32 / 600, tabular | Headline amounts |
| `figure` | Inter | 17 / 500, tabular | Table and breakdown amounts |

Fonts ship through `google_fonts` with bundled fallbacks for offline web.

## Space And Shape

- `AppSpacing`: 4, 8, 12, 16, 24, 32, 48.
- `AppRadii`: `sm` 8, `md` 12, `lg` 16, `pill` 999.
- Cards: `surface`, 1 px `border`, radius `md`, no shadow.
- Sheets and the wide board pane: `surface`, radius `lg` on the leading edge,
  one soft shadow.
- Fields: `surface` fill, 1 px `border`, radius `sm`, height 48.
- Primary button: `accent` fill, pill, height 48, `onAccent` label.

## Motion

- Figures animate between values over 180 ms with an ease-out curve through
  `AppAnimatedFigure`. This is what makes instant what-if visible on video.
- Charts interpolate series over 180 ms.
- Surfaces fade and rise 8 dp over 200 ms as they stream in.
- Reduced motion settings disable all of the above.

## Figures

- All money formatting goes through `AppFormats.money(Money, locale)`.
- Rates show two decimals, percentages of price show one.
- Units and currency codes use `textTertiary`.

## Coverage And Sources

- `AppCoverageBadge`: curated is an `accent` outline with a check; uncovered is
  a `warning` outline with the words "not covered yet".
- Tapping any badge or source dot opens `AppSourcesSheet`: rule, value, source
  publisher and title, link, retrieved or reviewed date.

## Status

| Status | Colour | Icon | Word |
| --- | --- | --- | --- |
| Pass | `positive` | check | Within limit |
| Warn | `warning` | alert | Close to limit |
| Fail | `danger` | cross | Over limit |
| Blocker | `danger` | block | Blocker |
| Effort | `warning` | clock | Takes time |
| Info | `info` | info | Good to know |

Colour is never the only signal.

## Charts

- `fl_chart` wrapped by `AppLineChart` and `AppStackedBar` so catalog items pass
  typed series, never chart library objects.
- Series 1 `accent`, series 2 `info`, limit lines `danger` dashed, markers
  `warning`.
- Axis labels in `caption`, gridlines in `border`.
- Every chart exposes a text summary for semantics.

## Primitives (`app/lib/ui`)

`AppTheme`, `AppScaffold`, `AppTwoPane`, `AppSheet`, `AppCard`, `AppButton`,
`AppMoneyField`, `AppAmountSlider`, `AppChoiceChips`, `AppSegmented`,
`AppAnimatedFigure`, `AppFigureRow`, `AppTable`, `AppChecklistRow`,
`AppStatusTag`, `AppCoverageBadge`, `AppSourcesSheet`, `AppLineChart`,
`AppStackedBar`, `AppTimeline`, `AppEmptyState`, `AppDisclaimer`,
`AppMessageOverlay`, `AppToast`, `AppLoadingIndicator`.

## Messages

Transient messages are toasts through the message bus, mounted once in
`MaterialApp.builder`, as in Purrtrait. Features never build a message surface
and nothing calls `ScaffoldMessenger`.

## A2UI Theme

A2UI v0.9 `createSurface.theme` is not used. The renderer's native theme
decides appearance, which is also the direction of A2UI v1.0.
