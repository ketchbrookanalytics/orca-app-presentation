FROM mcr.microsoft.com/devcontainers/base:bookworm

# Define the version of Quarto to install
ARG QUARTO_VERSION=1.9.38

# Install the system dependencies for Quarto & chrome-headless-shell
RUN apt-get update && apt-get install -y --no-install-recommends -y \
  libglib2.0-0 \
  libnss3 \
  libatk1.0-0 \
  libatk-bridge2.0-0 \
  libcups2 \
  libdrm2 \
  libgbm1 \
  libxkbcommon0 \
  libxcomposite1 \
  libxdamage1 \
  libxfixes3 \
  libxrandr2 \
  libxext6 \
  libx11-6 \
  libxcb1 \
  libpango-1.0-0 \
  libcairo2 \
  libasound2 \
  fonts-liberation \
  && rm -rf /var/lib/apt/lists/*

# Install Quarto CLI
# Also install Chrome Headless Shell headless browser so that Claude Code can
# render the presentation to an static 2D file (e.g., PDF) and spot-check the
# presentation.
ARG TARGETARCH
RUN wget -q "https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-${TARGETARCH}.deb" \
  && dpkg -i "quarto-${QUARTO_VERSION}-linux-${TARGETARCH}.deb" \
  && rm "quarto-${QUARTO_VERSION}-linux-${TARGETARCH}.deb" \
  && quarto install chrome-headless-shell --no-prompt