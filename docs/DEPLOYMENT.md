# Deployment

Deployment is intentionally provider-neutral. Configure a staging adapter first, then add a health endpoint and smoke tests. Production must use a protected GitHub Environment with required reviewers and a manually approved workflow. Never place deployment credentials in tracked files.
