# ORCA (Open-End Response Coding by AI) Pins Backend

<!-- badges: start -->

![Status](https://img.shields.io/badge/status-alpha-blue)
![License](https://img.shields.io/badge/license-Proprietary-red)

<!-- badges: end -->

## Overview

ORCAdb is a backend component of the [ORCA project](https://github.com/ksrinc/ksr_ORCA), designed to manage and store historical batch-run data for open-end response coding. Built using the [`pins`](https://pins.rstudio.com/) package and hosted on Posit Connect, it provides a lightweight but reproducible data layer accessible by multiple services including [ORCAstra](https://github.com/ksrinc/ksr_ORCAstra).

## Architecture

The ORCAdb backend is structured as follows:

```
/R/
├── 01_initialize_schema.R
├── 02_connect_board.R
├── 03_write_schema.R
├── 04_read_pin.R
```

Each script performs a sequential step in initializing and validating the backend storage:

1. **Initialize Schema**: Defines a standard schema for the batch record structure.
2. **Connect to Board**: Authenticates and connects to the Posit Connect board using environment variables.
3. **Write Schema**: Uploads the empty schema as a `pin` to initialize the backend.
4. **Read Pin**: Validates connectivity and data integrity by retrieving the stored schema or pin data.

## Development Setup

1. Clone the repository:

   ```bash
   git clone https://github.com/ksrinc/ksr_ORCAdb
   ```

2. Initialize the development environment:

   ```r
   # Install renv if needed
   install.packages("renv")

   # Restore dependencies
   renv::restore()
   ```

3. Create a `.Renviron` file in the project root:

   ```dotenv
   CONNECT_API_KEY=your_key_here
   CONNECT_SERVER=https://connect.ksrinc.com
   CONNECT_ACCOUNT=ksr_user
   ```

4. Run initialization:

   ```r
   source("R/01_initialize_schema.R")
   ```

## Contributing

This is an internal KS\&R project, but we welcome improvements from our team. Please:

* Branch from `main`
* Use descriptive commit messages
* Submit a PR and tag a reviewer

## Questions

For questions or issues, please contact:

* [Keaton Wilson](mailto:kwilson@ksrinc.com)
* [Paul Scott](mailto:pscott@ksrinc.com)
* [Ben Cortese](mailto:bcortese@ksrinc.com)

## Roadmap

* [x] Initial setup and pin board structure
* [x] Endpoint verification with ORCAstra
* [ ] Schema versioning for data compatibility
* [ ] Automatic validation pipelines
* [ ] Maintenance and modifications

See [issues](https://github.com/ksrinc/ksr_ORCAdb/issues) for current dev tasks.

## License

© Knowledge Systems and Research, 2025
All rights reserved.

Unauthorized copying of this repository, via any medium, is strictly prohibited.
Proprietary and confidential.

For use by authorized KS\&R personnel only.

## Acknowledgments

* [`plumber`](https://www.rplumber.io/)
