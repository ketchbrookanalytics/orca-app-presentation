# ORCA App Presentation

Presentation for Posit Conf 2026, titled "ORCA: a collaboratively-built AI-powered Shiny app built on Posit Team".

## Abstract

ORCA is KS&R's internal Shiny application for AI-assisted coding of open-ended survey responses. Designed in concert with Ketchbrook Analytics, ORCA combines an intuitive front-end for job submission, response review, and code editing with a modular backend built on the Posit ecosystem. The system integrates a {golem}-based Shiny app, a plumber API for asynchronous processing, pins for versioned metadata, and scheduled batch workflows for logging and delivery. This talk presents how thoughtful UI/UX design and Posit-based infrastructure work together to operationalize AI in a transparent, reproducible research environment.

## Installation

### Option 1: Local Quarto

In order to render the slides, you will need to have [Quarto](https://quarto.org) installed.

### Option 2: VSCode Devcontainer

If you prefer to use [VSCode Devcontainers](https://code.visualstudio.com/docs/devcontainers/containers) (as opposed to installing Quarto on your machine), you will need to have [Docker](https://www.docker.com/products/docker-desktop/) and [VSCode](https://code.visualstudio.com/) installed.

1. Ensure that Docker is running.
2. Open the newly cloned folder containing this repository in VSCode.
3. You should see a popup message in VSCode letting you know that this folder contains a Dev Container configuration file. Click "Reopen in Container".

If you don't see the popup, you can also reopen in container via the VSCode Command Palette:
- Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac) to open the Command Palette.
- Search for "Dev Containers: Reopen in Container" and select it.

## Developing the Slides

In order to view the slides, run `quarto preview presentation/orca.qmd` from a terminal. This will launch a *live* preview of the slides in your browser at `http://localhost:<port>/presentation/orca.html` -- when you edit and save [presentation/orca.qmd](presentation/orca.qmd), the slides will re-render.

## Publishing the Slides

Every push to `main` renders the deck and deploys it to GitHub Pages via [.github/workflows/publish.yml](.github/workflows/publish.yml). You can also trigger a re-deploy by hand from the repository's **Actions** tab ("Publish slides" -> "Run workflow").

This requires GitHub Pages to be enabled once, in **Settings -> Pages**, with **Source** set to **GitHub Actions**.
