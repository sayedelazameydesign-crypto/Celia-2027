#!/usr/bin/env bash
set -euo pipefail
if [[ -n "${HEALTHCHECK_URL:-}" ]]; then ./verification/smoke.sh; exit 0; fi
if [[ ! -f apps/api/dist/server.js ]]; then echo '[runtime] BLOCKED: API build is missing.'; exit 1; fi
PORT="${PORT:-4173}" node apps/api/dist/server.js >/tmp/celia-api.log 2>&1 &
pid=$!
trap 'kill "$pid" 2>/dev/null || true' EXIT
for _ in {1..20}; do curl --silent --fail "http://127.0.0.1:${PORT}/health" >/tmp/celia-health.json && break || sleep 0.25; done
curl --silent --fail "http://127.0.0.1:${PORT}/health" >/tmp/celia-health.json
cat /tmp/celia-health.json
printf '\nRESULT: PASS (runtime)\nVerification timestamp: %s\nRepository commit: %s\n' "$(date -u +%Y-%m-%dT%H:%M:%SZ)" "${GITHUB_SHA:-local}"
