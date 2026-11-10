# Homeward Design System

Bright, quiet, sure of its numbers (D203). Money decisions are stressful; the
interface answers with one large figure, says in colour whether it is within
reach, and keeps everything else out of the way. The feel is a modern
finance app, Robinhood's mobile app the reference the owner named, with
Homeward's own green and orange.

**Rule:** styling goes through tokens in `app/lib/ui/core/themes` (`AppColors`,
`AppTextStyles`, `AppSpacing`, `AppRadii`, `AppTheme`) and `App*` primitives.
Catalog items and features never inline hex values, `TextStyle`, or ad-hoc
decorations. A missing value is added to the tokens, not to a feature.
Colours and text styles are read from the theme, `AppColors.of(context)` and
`AppTextStyles.of(context)`, never held as constants, so every screen and
every block follows light and dark.

Generated UI must look native. Because every catalog item is built from the
same primitives, a surface the model composed and a screen a developer built
are visually indistinguishable.

The values below were the starting proposal; the design pass of milestone M2
settled them.

## Colour (`AppColors`)

| Token | Light | Dark | Use |
| --- | --- | --- | --- |
| `background` | `#FFFFFF` | `#000000` | Page |
| `surface` | `#FFFFFF` | `#000000` | Blocks sit on the page itself |
| `surfaceMuted` | `#F3F4F5` | `#16181A` | Cards, tiles, chips, fields, the ask bar |
| `border` | `#E8EAEC` | `#26292C` | Hairlines between blocks and under the strip |
| `borderStrong` | `#D3D6DA` | `#3A3E42` | Dividers in tables |
| `text` | `#0B0D0E` | `#F5F6F7` | Primary text and figures |
| `textSecondary` | `#0B0D0E` @ 73% | `#F5F6F7` @ 78% | Supporting copy |
| `textTertiary` | `#0B0D0E` @ 62% | `#F5F6F7` @ 64% | Captions, units |
| `brand` | `#00C46A` | `#1FD67A` | The one button of a screen, chart lines, within reach, the strip, selected options |
| `onBrand` | `#04140B` | `#04140B` | Text and icons on `brand` |
| `alert` | `#FF6A3D` | `#FF7A45` | Over the limit, short on cash, a warning chip |
| `onAlert` | `#1F0A03` | `#1F0A03` | Text on `alert` |
| `accent` | `#007A3D` | `#1FD67A` | Green as text and icons: eyebrows, links, text buttons |
| `onAccent` | `#FFFFFF` | `#04140B` | |
| `accentSoft` | `#00C46A` @ 14% | `#1FD67A` @ 16% | The demo line, a wash on a shown block |
| `onPhoto` | `#FFFFFF` | `#FFFFFF` | Credits and page dots on a photo's dark scrim |
| `info` | `#2563EB` | `#6EA8FF` | Series 2, informational notes |
| `positive` | `#007A3D` | `#1FD67A` | Pass, as text |
| `warning` | `#C93F0B` | `#FF8A50` | Warn, as text |
| `danger` | `#D92D20` | `#FF6B5E` | Fail, limit lines |

The vivid fills, `brand` and `alert`, never carry white or grey text: their
text is `onBrand` or `onAlert`, near-black, so a chip or button reads at
8:1 or more. Green or orange as text uses `accent`, `positive`, or `warning`,
each at 4.5:1 or more on the page and on `surfaceMuted`. The greys clear AA
on both: `textTertiary` is the lightest, at about 5:1 in light.

The app follows the device's light or dark setting (`ThemeMode.system`)
until the buyer picks Light or Dark under Appearance in the app bar, a
choice kept on the device; Match the device returns to following it. Dark is
true black, as on an OLED phone, with the greens lifted.

## Typography (`AppTextStyles`)

One face, Inter, for headings, text, and figures, set tight at the large
sizes, every figure in tabular numerals so columns and animated values never
jitter (D203).

| Style | Font | Size / weight | Use |
| --- | --- | --- | --- |
| `display` | Inter | 32 / 600, −0.9 | Page titles, the onboarding |
| `title` | Inter | 19 / 600, −0.35 | Block titles, questions |
| `lead` | Inter | 19 / 500, −0.3 | Gemini's reply on the last screen of a turn, at 22 |
| `body` | Inter | 15 / 400 | Text, descriptions |
| `label` | Inter | 13 / 600 | Field labels, chips, table headers |
| `caption` | Inter | 12 / 400 | Sources, units, dates |
| `figureLarge` | Inter | 36 / 600, −1.1, tabular | The figure that answers |
| `figure` | Inter | 17 / 600, −0.3, tabular | Tiles and breakdown amounts |
| `code` | Roboto Mono | 12 / 400 | A2UI messages and data models in the wire inspector |

The faces ship as assets under `app/assets/fonts`, each beside its OFL
licence, the files `google_fonts` pins by checksum, and `allowRuntimeFetching`
is off, so a recording never waits on a font server and never flashes a
fallback face.

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
- `AppRadii`: `sm` 8, `md` 12, `lg` 16, `xl` 22, `pill` 999.
- Blocks on the plan have no card: each sits on the page, its eyebrow above
  it, set apart from the next by 48 of space and a hairline (D203).
- Cards (`AppCard`), for an inline ask, the working card, and a starter:
  `surfaceMuted`, radius `lg`, no border, no shadow. The gallery frames an
  example in an outlined card, `surface` with a hairline.
- A `Button` Gemini composes from the basic components is drawn quiet,
  `surfaceMuted` with `text`, with the shape and height of the app's own
  buttons (D182).
- Fields: `surfaceMuted` fill, no border, a 1.5 px `brand` ring on focus,
  radius `sm`, height 48. The ask bar is a pill of `surfaceMuted` with a
  round `brand` send button.
- Primary button: `brand` fill, pill, height 48, `onBrand` label. A screen
  has one.
- Chips and options: pills of `surfaceMuted`; selected, `brand` with
  `onBrand`.

## Motion

Durations and the curve are tokens in `AppMotion`; `AppMotion.of` returns zero
whenever the device asks for stillness, so every animation below is off under
reduced motion.

- Surfaces fade in and rise 8 dp over 200 ms as they arrive, through
  `AppSurfaceEntry` around each surface in the transcript.
- A screen slides 5% from the side it comes from and fades in over 320 ms;
  a block whose content changes resizes over 200 ms (D169).
- When a turn finishes, its first screen opens. Tapping a part of the strip
  opens its latest block.
- The strip's bars fill with `brand` over 320 ms as each part gets its first
  block.

## Charts

A chart, when a component needs one, is Homeward's own `CustomPainter` inside
a `RepaintBoundary`, handed its colours by the widget that reads the theme,
never a chart package: in spike S4, `fl_chart` redrawn on
every frame of a drag cut a throttled JS build to about 23 fps, and a
`CustomPainter` with the same series held about 57. Every chart exposes a
summary of what it draws as its semantics label.

## Map

The map draws OpenStreetMap's tiles through one primitive, `AppMapTiles`,
under a colour filter from the theme, `AppMapTint`, so the map sits on the
page like a card and the pins and routes read first (D163). In light, most
of the colour is taken out and the whole lifted a little. In dark, the
lightness is turned over with blue weighed heaviest, which leaves water
darkest, land a dark grey, and labels light. `AppMapAttribution` keeps
"© OpenStreetMap contributors" on the map, bottom right.

A place is a `text` dot with a pill beside it in `surface`; the starting
point is the same in `accent`. A route is an `accent` line cased in
`surface`. Pills are laid out after they are measured, each on the first
side of its dot that is free, so two places near each other do not cover one
another, and none sits under the zoom buttons. Like a chart, a map exposes
what it shows as its semantics label.

## Primitives (`app/lib/ui/core/ui`)

Tokens: `AppColors`, `AppTextStyles`, `AppSpacing`, `AppRadii`, `AppSizes`,
`AppMotion`, `AppMapTint`, `AppTheme`.

Map: `AppMapTiles`, `AppMapAttribution`.

Layout and text: `AppPage`, `AppCard`, `AppBulletList`, `AppSurfaceEntry`.

Loading: `AppShimmer` and `AppSkeleton`, a skeleton of each thing's own
shape that shimmers while a turn works, and stands still with reduced
motion (D207).

Input: `AppButton`, `AppTextField`, `AppSelectField`, `AppPressable`,
`AppOptionTile`, `AppOptionPills`.

Figures and status: `AppFigureRow`, `AppStatusLine`, `AppBlockTitle`,
`AppStatusChip`, `AppStatTiles`, `AppMeter`, `AppStackedBar`, `AppDetails`,
`AppSourceNote`.

Feedback: `AppMessageOverlay`, `AppToast`, `AppLoadingIndicator`.

A primitive that only a removed component used was removed with it (D129) and
comes back with the next component that needs it. A two-pane screen is a `Row`
of the step screen and one pane, Under the hood; a sheet is `showModalBottomSheet` behind a named
helper, as in `showHistorySheet`.

## Messages

Transient messages are toasts through the message bus, mounted once in
`MaterialApp.builder`, as in Purrtrait. Features never build a message surface
and nothing calls `ScaffoldMessenger`.

## A2UI Theme

A2UI v1.0 has no surface theme. The renderer's native theme decides
appearance: `a2ui_flutter`'s basic components are Material widgets and take
`AppTheme`.

## Map First

One screen, the map (D206, D207), and nothing on it narrates the work.

1. Before the first message: the map of Europe under a white veil, a `brand`
   home mark, Where are you moving?, one line, a field, and the three
   stories as chips that start at once.
2. While the first answer comes: the map flies to the city the words name,
   and the city's name stands over it in the display style above a `brand`
   pulse. No status words.
3. Then the map: a price pin for every home that fits, `brand` with
   `onBrand`, showing what it costs a month (`21.6k kr`, `€1.9k`); a kept
   home's pin in `text` with a heart, the open one in `accent`. Homes over
   the budget are 9 px grey dots, and homes a must-have or the travel limit
   left out are 12 px `textSecondary` dots. Pins drop west to east, then the
   homes over budget sweep to grey. The places of the week are `text`
   circles with their names, and the routes of the homes in view draw in
   `accent`.
4. On the map, top left of it: the count of homes left in a large figure,
   counting as it changes, with the stages under it: in the city, in
   budget, near the place they go most, with the must-haves.
5. The panel, a white card with `xl` corners: Gemini's line in `lead`, any
   question Gemini asks in an outlined card, then the story in four slots
   (D208), Who, Money, Week, and Must-haves, each a hairline card with its
   icon, name, and status (n missing in `alert`, n assumed in
   `textTertiary`). Its chips: stated on `surfaceMuted`, assumed outlined in
   `textTertiary` and marked assumed, missing outlined in `alert` with a
   `+`, a place to add outlined in `border` with a `+` in `accent`, and the
   highest price the rules allow on `accentSoft`. Gemini's must-haves are
   pills that say how many homes each would keep (`accent` when on). Then
   the travel limit as a slider, and the homes left as rows: photo, a month
   in `figure`, address, the why in `accent` with a spark, and the rooms,
   size, and minutes in `caption`.
6. A chip opens a bottom sheet with one control and Update the map: a
   stepper for adults, a slider with − and + for an amount, or pills for
   days a week and the way they go, with Remove. While the map updates, a
   2 px bar runs across the top of the panel and the rows dim; nothing
   else moves.
7. While a turn works, skeletons hold each place and shimmer: the slots,
   the line, the pills, and the rows. With reduced motion they stand still.

Show what Gemini made, in the menu, draws a dashed `brand` outline round
each part Gemini produced, labelled with what it did: the chips, Read from
your words by Gemini; the line, Written by Gemini; the must-haves, Composed
by Gemini · A2UI; and a dashed underline under each why. Everything else,
the map, the figures, and the order, is the app's own.

Nothing ripples (D204): `AppPressable` scales a tile or pill to 97% as it is
pressed and darkens it 4% under a pointer; tiles are `AppOptionTile`,
pills `AppOptionPills`, on `surfaceMuted`, or `brand` with `onBrand` when
chosen. A field's label sits above it in `label`.

## Block Anatomy

Every block has one anatomy (D201):

1. On the plan, the block opens with its part's icon and name, You,
   Budget, Homes, or Week, in `accent` capitals.
2. `AppBlockTitle`: the title in the title style, and an `AppStatusChip`
   with the verdict: `brand` with `onBrand` when it passes, `alert` with
   `onAlert` when it warns or fails, `surfaceMuted` otherwise.
3. The figure that answers, in `figureLarge`, with one line of what it is.
4. A picture of it: `AppMeter` for a value against a limit, with a mark at
   the limit and `danger` past it; `AppStackedBar` for a sum of parts; or the
   block's chart.
5. `AppStatTiles` for the key figures, two to four across.
6. `AppDetails`, a toggle to the full breakdown in `AppFigureRow`s.
7. `AppSourceNote`: sources, the estimate label, and what a figure rests on,
   in the caption style beside an info icon.

## Demo Header

Every screen sits under one line, This is a demo project by Moonwise to
showcase A2UI apps (D199), on `accentSoft` in the caption style.
`AppDemoHeader` wraps the router in `MaterialApp.builder`, so no screen draws
it and none can leave it out.
