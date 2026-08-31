#!/usr/bin/env bash
set -euo pipefail
if [[ "${DEPLOY_TARGET:-}" != "staging" && "${DEPLOY_TARGET:-}" != "production" ]]; then
  echo "Set DEPLOY_TARGET=staging or DEPLOY_TARGET=production explicitly." >&2
  exit 2
fi
if [[ "$DEPLOY_TARGET" == "production" && "${PRODUCTION_APPROVED:-false}" != "true" ]]; then
  echo "Production deployment is blocked until PRODUCTION_APPROVED=true is provided by an approved manual job." >&2
  exit 1
fi
echo "Deployment adapter not configured. Add provider-specific commands here after selecting a target."
