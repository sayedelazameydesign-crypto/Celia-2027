#!/usr/bin/env bash
set -euo pipefail
if [[ -n "${HEALTHCHECK_URL:-}" ]]; then
  command -v curl >/dev/null 2>&1 || { echo "curl is required for HEALTHCHECK_URL verification." >&2; exit 1; }
  curl --fail --silent --show-error --max-time "${HEALTHCHECK_TIMEOUT_SECONDS:-15}" "$HEALTHCHECK_URL" >/dev/null
  echo "Health check passed: $HEALTHCHECK_URL"
else
  echo "Health check skipped: HEALTHCHECK_URL is not configured."
fi
printf 'Verification timestamp: %s\n' "$(date -u +%Y-%m-%dT%H:%M:%SZ)"
printf 'Repository commit: %s\n' "${GITHUB_SHA:-local}"
