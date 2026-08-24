#!/usr/bin/env bash
# Runs once, after the container is created.
#
# Quarto ships its own headless Chrome (`quarto install chrome-headless-shell`),
# which it uses to render slides and figures to PDF or PNG. The bookworm base
# image is too minimal to run it, so install the shared libraries it links
# against. Without these, Chrome fails at startup with
# "error while loading shared libraries: libglib-2.0.so.0".
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

apt-get update -qq
apt-get install -y --no-install-recommends \
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

# Fetch the headless Chrome build itself, so `quarto render` can produce PDFs
# and screenshots without a first-run download.
quarto install chrome-headless-shell || true
