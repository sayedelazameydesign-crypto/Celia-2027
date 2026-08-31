#!/usr/bin/env bash
set -euo pipefail
failures=0
for file in AGENTS.md README.md CONTRIBUTING.md SECURITY.md Makefile; do
  if [[ -f "$file" ]]; then echo "[check] present: $file"; else echo "[check] missing: $file" >&2; failures=$((failures+1)); fi
done
for script in scripts/setup.sh scripts/test.sh scripts/build.sh scripts/verify.sh verification/smoke.sh; do
  if [[ -x "$script" ]]; then echo "[check] executable: $script"; else echo "[check] not executable: $script" >&2; failures=$((failures+1)); fi
done
if [[ -f .dev/config/project.json ]]; then node -e "JSON.parse(require('fs').readFileSync('.dev/config/project.json'))"; echo "[check] valid project metadata"; else echo "[check] missing project metadata" >&2; failures=$((failures+1)); fi
(( failures == 0 )) || exit 1
