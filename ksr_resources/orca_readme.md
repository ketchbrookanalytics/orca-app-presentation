# ORCA – KS\&R’s Shiny App for AI-Powered Open-End Response Coding

![Status](https://img.shields.io/badge/status-active-success)
![Built with](https://img.shields.io/badge/built_with-golem_%2B_Shiny-blue)
![Hosted on](https://img.shields.io/badge/hosted_on-Posit_Connect-green)

**ORCA** is KS\&R’s internal web application for **automated, AI-enhanced coding of open-end survey responses**. It’s designed for use by internal teams, offering an intuitive UI built in **Shiny (via the {golem} framework)** to interact with a robust backend pipeline powered by OpenAI.

ORCA is a central part of a tightly integrated AI-driven ecosystem for survey response classification, operating in tandem with backend services for asynchronous processing, audit logging, and batch orchestration.

---

## 🔧 Ecosystem & Architecture

ORCA is the *frontend UI layer* of a larger modular system:

| Layer         | What it does                                                                | Repository                                              |
| ------------- | --------------------------------------------------------------------------- | ------------------------------------------------------- |
| **ORCA**      | Shiny app for job submission, response preview, and code editing            | *this repo*                                             |
| **ORCAstra**  | Plumber API for submitting jobs, checking status, and accessing OpenAI      | [ksr\_ORCAstra](https://github.com/ksrinc/ksr_ORCAstra) |
| **ORCAdb**    | Generates and manages a versioned metadata store via `pins`                 | [ksr\_ORCAdb](https://github.com/ksrinc/ksr_ORCAdb)     |
| **ORCAwatch** | Scheduled Quarto job that automates batch processing, logging, and delivery | [ORCAwatch](https://github.com/ksrinc/ksr_ORCAwatch)    |

To understand how these parts work together, refer to the [project Mural board](https://app.mural.co/t/ksr0606/m/ksr0606/1742304207993/13ca4bf641b2a838d2edb48acc2600fa704e245d) for architecture diagrams and planning artifacts.

---

## 🚀 Features

* Submit open-end response data for AI coding
* Review and edit generated codes interactively
* Monitor job statuses and receive feedback on completed runs
* Full integration with KS\&R’s OpenAI-based backend
* Audit logs and dataset outputs generated via ORCAwatch

---

## 🧑‍💻 Getting Started – Developer Setup

### 1. Clone and Initialize

```bash
git clone https://github.com/ksrinc/ksr_ORCA.git
```

Use `{renv}` to install dependencies and isolate the environment:

```r
renv::restore()
```

### 2. Run the App

```r
golem::run_dev()
```

---

## 🔐 Environment Configuration

ORCA relies on several **secrets** and **API keys**, managed via the `.Renviron` file.

### Required Environment Variables

```dotenv
# OpenAI API key (project-specific)
OPENAI_API_KEY=sk-...

# GitHub PAT (for access to ksRAI)
GITHUB_PAT=ghp_...

# ORCAstra API base URL
ORCASTRA_ENDPOINT=https://posit.ksr.com/content/xxx

# Other Connect configuration
CONNECT_API_KEY=...
CONNECT_SERVER=...
PIN_NAME=...

# Development mode toggle (used by backend)
DEV_MODE=TRUE
```

Use `usethis::edit_r_environ()` to open and edit your `.Renviron` file.

> ⚠️ **Important:** Never commit `.Renviron` files to Git. Always add them to `.gitignore`.

---

## 📊 Runtime Flow

1. User uploads open-end response data via the Shiny UI
2. App sends job to **ORCAstra** for processing
3. **ORCAstra** communicates with the OpenAI API
4. When completed, **ORCAwatch** retrieves and cleans results
5. Outputs (csv/xlsx/sav) are saved to the network share
6. Submitters receive notification and job metadata is pinned

---

## 📁 Logging & Output

* Audit logs live in: `/mnt/Shiny/ORCA_dev/ORCA_logs`
* Output files (in dev mode): `/mnt/Shiny/ORCA_dev/`
* Output files (in prod): wherever a user specifies (if accessible) - typically on the Z share
* Logs include timestamps, errors (if any), and job metadata

---

## 🗓️ Roadmap

* [x] Golem-based Shiny scaffolding
* [x] ORCAstra integration (API endpoints)
* [x] Job submission UI
* [ ] Full DS\&I testing
* [ ] Updates and bug fixes
* [ ] Team onboarding and training
* [ ] Ongoing maintenance and upgrades

See [open issues](https://github.com/ksrinc/ksr_ORCA/issues) for active development tasks.

---

## 🧠 Additional Resources

* [ksRAI](https://github.com/ksrinc/ksRAI): Internal R package for AI tooling and wrangling
* [ORCAstra](https://github.com/ksrinc/ksr_ORCAstra): Backend API service
* [ORCAwatch](https://github.com/ksrinc/orcawatch): Recurring job scheduler & batch processor
* [ORCAdb](https://github.com/ksrinc/ksr_ORCAdb): Data infrastructure for job tracking

---

## 🙋 Questions & Support

| Role                   | Contact                                           |
| ---------------------- | ------------------------------------------------- |
| Developer Lead         | [kwilson@ksrinc.com](mailto:kwilson@ksrinc.com)   |
| Maintainer / Oversight | [bcortese@ksrinc.com](mailto:bcortese@ksrinc.com) |

---

## 📜 License

© 2025 [Knowledge Systems & Research](https://www.ksrinc.com)
Proprietary and confidential – internal use only.
Unauthorized distribution strictly prohibited.

---

## 🙏 Acknowledgments

* [{golem}](https://engineering-shiny.org/golem.html) for scalable Shiny architecture
* [Shiny](https://shiny.posit.co/) & [bslib](https://rstudio.github.io/bslib/) for UI
* [awesome-readme](https://github.com/matiassingers/awesome-readme) for inspiration
* [Posit Connect](https://posit.co/products/platform/connect/) for deployment
* [OpenAI](https://openai.com/) for powering our classification engine
* [Ketchbrook Analytics](https://www.ketchbrookanalytics.com/) for development of initial UI buildout
