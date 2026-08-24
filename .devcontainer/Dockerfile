FROM mcr.microsoft.com/devcontainers/base:bookworm

# Define the version of Quarto to install
ARG QUARTO_VERSION=1.9.38

export DEBIAN_FRONTEND=noninteractive

# Install the system dependencies for Quarto & chrome-headless-shell
apt-get update && apt-get install -y --no-install-recommends -y \
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
  fonts-liberation

rm -rf /var/lib/apt/lists/*

# Install Quarto, along with Chrome Headless Shell - Quarto's purpose-built
# headless browser (Chrome for Testing) so that Claude Code can render and spot-
# check the presentation.
ARG TARGETARCH
RUN wget -q "https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-${TARGETARCH}.deb" \
  && dpkg -i "quarto-${QUARTO_VERSION}-linux-${TARGETARCH}.deb" \
  && rm "quarto-${QUARTO_VERSION}-linux-${TARGETARCH}.deb" \
  && quarto install chrome-headless-shell --no-prompt