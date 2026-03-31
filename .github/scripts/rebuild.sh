#!/usr/bin/env bash
set -euo pipefail

# Rebuild script for ublue/os-bluefin-docs (projectbluefin/documentation)
# Runs on existing source tree (no clone). Installs deps, runs pre-build steps, builds.

# --- Node version ---
# Docusaurus requires >=20.0. v1 uses system node (which satisfies this).
export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
if [ -f "$NVM_DIR/nvm.sh" ]; then
    . "$NVM_DIR/nvm.sh"
    nvm install 20
    nvm use 20
fi

node --version

# --- Package manager + dependencies ---
# Uses npm. --legacy-peer-deps required for React 19 peer dep conflicts.
npm install --legacy-peer-deps

# --- Build ---
npm run build

echo "[DONE] Build complete."
