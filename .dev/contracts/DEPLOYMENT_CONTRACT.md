# Deployment Contract v1

Staging and production are separate environments. Staging is the first deployment target and must be verified before production. Secrets belong in protected GitHub Environments or an external secret manager, never in tracked files.

Deployment verification must check the configured health endpoint and applicable API, database, UI, and smoke paths. Roll back when health checks fail, a critical smoke test fails, error rates materially regress, or the deployed commit cannot be identified. Production requires explicit manual approval.
