<!-- README.md is generated from README.Rmd. Please edit that file -->

# ORCAstra – KS&R’s Backend API for AI-Driven Open-End Coding Workflows

<!-- badges: start -->
![Static Badge](https://img.shields.io/badge/Status-Beta-blue)
![Static Badge](https://img.shields.io/badge/Hosted_on-Posit_Connect-green)
<!-- badges: end -->

**ORCAstra** is the Plumber-based backend service supporting ORCA (Open-end Response Coding by AI), KS&R’s internal AI-powered app for classifying and coding open-end survey responses. Built in R using modern best practices for API development, ORCAstra handles asynchronous job submissions, tracks status, and interfaces with the OpenAI API in a robust, scalable way.

## Architecture

ORCAstra sits between the ORCA Shiny frontend and the OpenAI API. It manages:

- Async processing of batch open-end responses
- Job queuing and status endpoints
- Cost estimation for OpenAI API use
- Secure environment-variable-based authentication
- Persistent storage of response metadata and results (when integrated) via `pins`
and a recurrent job scheduler [ORCAwatch](https://github.com/ksrinc/ksr_ORCAwatch) on Connect

It is built using:
- [`plumber`](https://www.rplumber.io/)
- [`pins`](https://pins.rstudio.com/) for potential result caching
- Hosted and deployed via **Posit Connect**

## Installation & Deployment

ORCAstra is deployed internally to Posit Connect and **not** intended to be installed locally by end users. Developers looking to contribute or run the API locally can follow these steps:

```r
# Clone repo
git clone https://github.com/ksrinc/orcastra

# Run Plumber locally
r <- plumber::plumb("entrypoint.R")
r$run(port = 8000)
```

For deployment to Posit Connect, ensure:
- Appropriate OpenAI and internal KS&R environment keys via Connect's mechanisms for environmental variable storage
- You've coordinated with IT appropriately
- `renv::restore()` has been run
- Your manifest.json is updated - 

## API Overview

The API exposes several endpoints, including:

- `POST /initiate` — Submit a batch of open-end responses for classification
- `GET /check_status` — Retrieve the status and output of a submitted job
- `POST /get_results` — Get results for a completed job
- `GET /end_run` — Terminate an in-process run
- `GET /check_price` — check the estimated price of a given run, using tools from [ksRAI](https://github.com/ksrinc/ksRAI)
- `GET /get_orca_data` — grab latest metadata from the backend pins storage data [ORCAdb](https://github.com/ksrinc/ksr_ORCAdb)

## Environment Configuration

Ensure your `.Renviron` includes:

```
OPENAI_AI_KEY=sk-...
GITHUB_PAT=...
# for DEVELOPMENT only - turn off in production
RUN_PLUMBER=TRUE
CONNECT_API_KEY=...
CONNECT_SERVER=...
PIN_NAME=...
```

## Questions

For questions or issues, please contact:

- [Keaton Wilson](mailto:kwilson@ksrinc.com)
- [Paul Scott](mailto:pscott@ksrinc.com)
- [Ben Cortese](mailto:bcortese@ksrinc.com)

## Roadmap

- [x] Initial setup
- [x] Endpoint and routing development
- [x] Testing locally
- [x] Staging deployement + testing
- [ ] Integration with other backend ORCA Components
- [ ] Long-term maintenance

See [issues](https://github.com/ksrinc/orcastra/issues) for current dev tasks.

## License

Copyright (C) [Knowledge Systems and Research](https://www.ksrinc.com)

All rights reserved.  
Unauthorized copying of this file, via any medium, is strictly prohibited.  
Proprietary and confidential.  
Written by [Keaton Wilson](mailto:kwilson@ksrinc.com), 2025-04-24

## Acknowledgments

- [`plumber`](https://www.rplumber.io/)
- [`renv`](https://rstudio.github.io/renv/)
- [`Posit Connect`](https://posit.co/products/platform/connect/)

