#!/usr/bin/env bash
# Idempotent update command for Cursor Cloud agents.
# Runs from the repository root on every VM boot after the latest checkout.
set -euo pipefail

echo "[computerinfo] Running environment install…"

# --- Node.js dependencies (when a package manifest exists) ---
if [[ -f package-lock.json ]]; then
  npm ci
elif [[ -f pnpm-lock.yaml ]]; then
  corepack enable
  pnpm install --frozen-lockfile
elif [[ -f yarn.lock ]]; then
  corepack enable
  yarn install --frozen-lockfile
elif [[ -f package.json ]]; then
  npm install
fi

# --- Python dependencies (when a requirements / project file exists) ---
if [[ -f requirements.txt ]]; then
  python3 -m pip install --user -r requirements.txt
elif [[ -f pyproject.toml ]]; then
  python3 -m pip install --user -e .
fi

# --- Sanity checks (fail fast if core runtimes are missing) ---
command -v node >/dev/null
command -v npm >/dev/null
command -v python3 >/dev/null
command -v git >/dev/null

echo "[computerinfo] node $(node -v) | npm $(npm -v) | $(python3 --version) | $(git --version)"
echo "[computerinfo] Environment install complete."
