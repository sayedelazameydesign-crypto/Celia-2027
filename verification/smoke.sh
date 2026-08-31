#!/usr/bin/env bash
set -euo pipefail
if [[ -n "${HEALTHCHECK_URL:-}" ]]; then curl --fail --silent --show-error --max-time "${HEALTHCHECK_TIMEOUT_SECONDS:-15}" "$HEALTHCHECK_URL" >/dev/null; echo "Health check passed: $HEALTHCHECK_URL"; echo "RESULT: PASS (runtime)"
else echo "Health check skipped: HEALTHCHECK_URL is not configured."; echo "RESULT: SKIP (runtime)"; fi
printf 'Verification timestamp: %s\n' "$(date -u +%Y-%m-%dT%H:%M:%SZ)"
printf 'Repository commit: %s\n' "${GITHUB_SHA:-local}"
