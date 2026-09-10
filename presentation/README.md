# ORCA — Quarto RevealJS deck

A Quarto RevealJS port of `../ORCA__AI-powered_survey_coding.pptx`, carrying the
same 26 slides, images, and speaker notes.

```
_quarto.yml         project + all RevealJS config
presentation/
├── orca.qmd        the slides
├── ksr-orca.scss   the KS&R/ORCA theme (palette, type scale, layout classes)
├── images/         media extracted from the pptx, renamed
└── README.md
```

## Working on it

The repo root is a Quarto project, so both commands work with no arguments:

```bash
quarto preview   # live reload; writes nothing
quarto render    # writes presentation/orca.html + orca_files/
```

`_quarto.yml` holds everything about how the deck *behaves* — canvas size,
theme, transitions, fonts — and `orca.qmd` holds the content. Two settings
there are load-bearing and commented as such: `center: false` (the theme lays
slides out top-down; turning it on breaks every composition) and
`auto-stretch: false` (reveal must not resize the hand-placed figures).
Its `project.render` list is restricted to the deck so the loose working notes
at the repo root aren't rendered.

Press `S` in the deck for the speaker view (notes, timer, next slide), `O` for
the slide overview, `F` for fullscreen, and `M` for the slide menu.

## Where the design came from

Nothing here was invented. The pptx has no theme to speak of — it's the stock
Office theme, and all 26 slides are hand-placed text boxes on `slideLayout1`
— so the design system was read back out of the slide XML and written down as
tokens in `ksr-orca.scss`.

The canvas is the pptx canvas: 18288000 × 10287000 EMU is 20in × 11.25in, which
at 96 dpi is **1920 × 1080** with a **100px** margin. The deck renders at that
size, so one CSS pixel here is one pixel there and every size in the theme is
the deck's own measurement (PowerPoint points converted at pt × 4/3).

**Palette** — the ten colours the slides actually use:

| Token | Hex | Role |
| --- | --- | --- |
| `$navy` | `#142645` | primary dark ground, dark text |
| `$navy-mid` | `#2C4A6B` | hairlines and chips on navy |
| `$slate` | `#3A4A63` | lede body on light grounds |
| `$slate-muted` | `#5A6B85` | eyebrows, captions, small text on light |
| `$blue-muted` | `#7D93B8` | eyebrows, captions, small text on navy |
| `$blue-light` | `#97C6F2` | accent — numerals, emphasis, headlines on navy |
| `$blue-pale` | `#C3D5EA` | body text on navy |
| `$cream` | `#F0EBE5` | warm ground |
| `$cream-dark` | `#D8D0C6` | hairlines, image frames on cream |
| `$white` | `#FFFFFF` | light ground |

The three grounds rotate through the deck as `.navy`, `.cream`, and `.paper`.

**Type** — KS&R's brand book (`../ksr_resources/KS&R_Brand-Book_10_15.pdf`,
pp. 62–63) specifies **Tobias Light** for extended headlines and **Söhne Buch**
for sans, with −10 tracking on headlines. Both are licensed fonts. The pptx
already anticipated that: every text run names the licensed face as its `latin`
typeface and declares **Source Serif 4** / **Archivo** as the East-Asian and
complex-script fallbacks. Those two are the pair used here — they were the
deck's own intended substitutes, and both are on Google Fonts. The brand book's
headline tracking is applied as `letter-spacing: -0.01em`.

Google Fonts is loaded over the network via `include-in-header` in
`_quarto.yml`. To present offline, download the two families and serve them
locally instead.

## Authoring slides

A content slide is an eyebrow, a headline, and a layout:

```markdown
## Three ways cross-team builds fall apart {.cream}

::: {.eyebrow}
A FAMILIAR FAILURE MODE
:::

:::: {.cols-3 .mt-lg}
::: col
[01]{.num}
[No clear division of labor]{.sub}

One person quietly ends up carrying the whole project.
:::
::::

::: notes
Speaker notes go here.
:::
```

The eyebrow is authored *after* the `##` even though it renders above it —
pandoc always emits the heading first, so the theme hoists the eyebrow with
flex `order`. Nest fenced divs with **decreasing** colon counts
(`:::::` → `::::` → `:::`) so pandoc can't mismatch a closing fence.

### Grounds and slide variants

| Class | Effect |
| --- | --- |
| `.navy` `.cream` `.paper` | the slide's ground, with its matching text palette |
| `.statement` | one big centred serif line — the deck's interstitials |
| `.chapter` | chapter divider: label, big title, hairline, tool chips |
| `.headline-right` | sets the headline flush right (slide 6) |

### Layout

`.cols-2` `.cols-3` `.cols-4` for equal grids; `.split` with `.split-even`,
`.split-wide`, or `.split-narrow` for unequal halves, plus `.ruled` for a
hairline between them. `.versus` is two panels with a glyph between,
`.chain` three. `.row` is a flex row (`.tight`, `.exchange`, `.hexrow`),
`.middle-stack` a vertically centred column. `.fill` eats the leftover height
so whatever follows lands on the bottom margin. Spacing helpers: `.mt-sm`
`.mt-md` `.mt-lg` `.mt-a` (push to bottom), and `::: hrule` for a hairline.

### Text roles

`.eyebrow` `.headline` `.lede` `.sub` `.num` `.cap` `.note` `.kicker` `.next`
`.who` `.display` `.tagline` `.tenant` `.step` `.label` `.glyph`, plus `.pkg`
for R package names. Components: `.chip`, `.tag`, `.bar` (`.solid`, `.cream`),
`.card` (`.cream`, `.navy`, `.centered`, `.plain`) with `::: foot` to pin a
caption to a card's bottom, and `.frame` (`.crop`) for framed screenshots.

`.shot` is a slide-level class for the four "what is ORCA" walkthrough slides:
a narrow left column (eyebrow + `.headline`, and the kicker on step 4) beside a
`.frame` screenshot that fills the full height of the slide. Those slides carry
an empty `##` — the headline lives inside the column — and the `.frame` there
drops its border and is placed absolutely so the image can size against the
column rather than a hand-set width.

Screenshot annotations on those slides are `.hl` spans written *inside* the
`.frame` span, positioned in percentages of the image (the frame shrink-wraps
to the image, so percentages map to the screenshot itself). `data-label` prints
a chip above the ring; `.chip-right` aligns that chip to the ring's right edge
and `.below` drops it under the ring — both are there to keep a label off the
app's own text. Rings and chips fade in ~0.4s after the slide lands, off the
slide's `.present` class (no fragments, so the click count is unchanged):

```markdown
[![](images/orca-01-upload-data.png)[]{.hl data-label="Pick columns, filter rows"
  style="left:8.6%; top:74.4%; width:82.5%; height:23.6%;"}]{.frame}
```

`.eyebrow`, `.next`, `.kicker`, `.speaker`, and `.foot` **must** be fenced divs
rather than spans — each depends on being a direct flex child, and pandoc wraps
a bare span in a `<p>` that would become the flex child instead. Everything
else works either way.

### Absolute placement

Two slides are bleed collages that no flow layout reproduces honestly. `::: bleed`
opens a layer covering the whole 1920 × 1080 slide, margins included, and
`.pin` children carry the pptx's own coordinates:

```markdown
::: bleed
![](images/mural-wireframes.png){.pin style="left:100px; top:248px; width:816px;"}
:::
```

## Notes on the port

- **The eyebrow on slide 2** reads `We've all been been on this team.` in the
  pptx — the duplication is an artifact of the bold run being split across
  three text runs. Corrected here to `We've all **been** on this team.`
- **Slide 17's `⇄`** was replaced with `↔`. Neither Archivo nor Source Serif 4
  carries arrows, and `U+21C4` is missing from many Linux symbol fonts, so it
  rendered as a tofu box; `U+2194` is covered everywhere and reads the same.
- **Slide 21's `{bslib}` hex** has no caption in the pptx, only the logo. It is
  labelled `{bslib}` here rather than left bare; the three sibling cards
  (ORCAstra, ORCAdb, ORCAwatch) are likewise empty below their titles in the
  original and are left that way.
- **Speaker notes are verbatim**, including the `Feedback:` lines from the
  workshop review — see `../ORCA_Talk_Structure_Feedback.md`.
- **`images/ksr-logo-navy.png` is unused.** In the pptx it's a small KS&R
  wordmark laid on top of slide 12's brand-book cover image, which already
  carries the same mark. It's kept in case you want it back.
- Three known-brittle things in the theme are commented at length where they
  live, because each one silently breaks the layout rather than erroring:
  reveal.js writes `display: block` *inline* on the visible slide (so the flex
  container needs `!important`), Quarto treats a markdown `---` as a **slide
  break** (so hairlines are `::: hrule` divs), and pandoc's `<p>` wrappers are
  removed with `display: contents` inside pure-layout containers.

## Rendering to PDF or PNG

Needs Quarto's headless Chrome, plus the shared libraries it links against on
this Debian base — both installed by `.devcontainer/post-create.sh`.
