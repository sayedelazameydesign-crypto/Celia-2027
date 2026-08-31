#!/usr/bin/env bash
set -euo pipefail
mode="${1:-all}"
run_if_script() { local name="$1"; shift; if [[ -f package.json ]] && node -e "const p=require('./package.json'); process.exit(p.scripts&&p.scripts['$name']?0:1)" 2>/dev/null; then "$@"; else echo "[$name] skipped: no configured package script."; fi; }
case "$mode" in
  lint) run_if_script lint npm run lint ;;
  typecheck) run_if_script typecheck npm run typecheck ;;
  test) run_if_script test npm test ;;
  all) run_if_script lint npm run lint; run_if_script typecheck npm run typecheck; run_if_script test npm test ;;
  *) echo "Usage: $0 [lint|typecheck|test|all]" >&2; exit 2 ;;
esac
