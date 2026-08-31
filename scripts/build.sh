#!/usr/bin/env bash
set -euo pipefail
if [[ -f package.json ]] && node -e "const p=require('./package.json'); process.exit(p.scripts&&p.scripts.build?0:1)" 2>/dev/null; then npm run build; echo "RESULT: PASS (build)"; else echo "[build] BLOCKED: no configured package build script."; echo "RESULT: BLOCKED (build)"; exit 1; fi
