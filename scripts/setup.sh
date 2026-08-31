#!/usr/bin/env bash
set -euo pipefail
if [[ -f package.json ]]; then
  if command -v pnpm >/dev/null 2>&1 && [[ -f pnpm-lock.yaml ]]; then pnpm install --frozen-lockfile
  elif command -v npm >/dev/null 2>&1; then npm ci 2>/dev/null || npm install
  else echo "No Node package manager found."; exit 1; fi
else
  echo "No package manifest found; setup skipped."
fi
