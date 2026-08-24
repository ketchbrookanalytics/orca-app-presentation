# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repository is

A conference talk, not an application. It holds the slides for "ORCA: a collaboratively-built AI-powered Shiny app built on Posit Team" (posit::conf(2026)), presented by Michael Thomas (Ketchbrook Analytics, front-end/UX) and Keaton Wilson (KS&R, back-end/infrastructure).

There is no test suite or linter. The only artifact is a Quarto RevealJS deck, which CI publishes to GitHub Pages on every push to `main`.

## Commands

The repo root is a Quarto project, so both commands work with no arguments:

```bash
quarto preview   # live reload on save; writes nothing (port 4200, no browser auto-open)
quarto render    # writes presentation/orca.html + presentation/orca_files/ (both gitignored)
```

`_quarto.yml` restricts `project.render` to `presentation/orca.qmd`, so the loose working notes at the repo root are never rendered.

`.github/workflows/publish.yml` renders the deck and deploys it to GitHub Pages on every push to `main` (or on manual dispatch). It renders with `--output-dir _site`, then lifts `_site/presentation/` to the site root and copies `orca.html` to `index.html`, so the deck serves from `/`. Its Quarto version is pinned to the same one as `.devcontainer/Dockerfile` — bump both together.

Rendering to PDF/PNG needs Quarto's headless Chrome plus the shared libraries it links against on this Debian base — `.devcontainer/post-create.sh` installs both. In the devcontainer this is already done.

## Structure

```
.github/workflows/publish.yml          renders + deploys the deck to GitHub Pages
_quarto.yml                            project config + ALL RevealJS behaviour
presentation/orca.qmd                  the 26 slides (content + speaker notes)
presentation/ksr-orca.scss             the KS&R/ORCA theme
presentation/images/                   media extracted from the pptx, renamed
presentation/README.md                 the deck's own reference — read this first
ORCA__AI-powered_survey_coding.pptx    the original deck the .qmd was ported from
ksr_resources/                         KS&R brand book, ORCA repo READMEs, screenshots
outline.md, notes.md,                  talk-prep working documents
pitch-script.md,
ORCA_Talk_Structure_Feedback.md
```

The split is deliberate: `_quarto.yml` holds everything about how the deck *behaves* (canvas size, theme, transitions, fonts); `orca.qmd` holds only content; `ksr-orca.scss` holds all presentation.

**Read [presentation/README.md](presentation/README.md) before editing slides or the theme.** It documents the full class vocabulary (grounds, layout, text roles, components), the authoring patterns, where the design system came from, and the deliberate deviations from the pptx. Do not re-derive that from the source.

## Working on the deck

Design decisions are not free choices here — the palette, type scale, and every size in `ksr-orca.scss` were read out of the pptx's slide XML, and the deck renders at 1920×1080 specifically so one CSS pixel equals one pptx pixel. New sizes should be derived from the pptx (PowerPoint points × 4/3) or from existing tokens, not invented.

Four things break the layout silently rather than erroring, and are commented at length where they live:

- `center: false` and `auto-stretch: false` in `_quarto.yml` are load-bearing. The theme lays slides out top-down and places every figure by hand; enabling either breaks every slide's composition.
- reveal.js writes `display: block` *inline* on the visible slide, so the flex container rule needs `!important`.
- Quarto treats a markdown `---` as a **slide break**, so hairlines are `::: hrule` divs.
- Pandoc wraps bare spans in `<p>`, which would become the flex child instead of the intended element. `.eyebrow`, `.next`, `.kicker`, `.speaker`, and `.foot` must therefore be fenced divs, not spans.

Slide layouts are hand-built from nested fenced divs with **decreasing** colon counts (`:::::` → `::::` → `:::`) so pandoc can't mismatch a closing fence. `_quarto.yml` sets `editor: source` because the visual editor reflows them.

Speaker notes in `orca.qmd` are verbatim from the pptx, including the `Feedback:` lines carried over from the workshop review. Treat them as content to be revised deliberately, not cleaned up.

## Content sources

When slide content is in question, the hierarchy is: `ORCA__AI-powered_survey_coding.pptx` is what was built; `outline.md` is the intended narrative arc (with inline TODOs and answered queries); `ORCA_Talk_Structure_Feedback.md` is coaching feedback on that structure (notably: the old Chapter 3 was reframed away from an "AI best practices" tangent); `notes.md` records the presenters' own framing debate; `pitch-script.md` is the submitted video abstract.

`ksr_resources/` carries the primary sources: the KS&R brand book PDF (type and palette specs, pp. 62–63), the KSR PowerPoint template, READMEs for the four ORCA repos (`orca`, `orcastra`, `orcadb`, `orcawatch`) for architecture facts, and Mural screenshots.
