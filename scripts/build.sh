#!/usr/bin/env bash
set -euo pipefail
if [[ -f package.json ]] && node -e "const p=require('./package.json'); process.exit(p.scripts&&p.scripts.build?0:1)" 2>/dev/null; then npm run build
else echo "[build] skipped: no configured package build script."; fi
