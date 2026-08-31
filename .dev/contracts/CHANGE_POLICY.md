# Change Policy v1

An agent may automatically modify documentation, tests, application code within the declared task scope, repository scripts, and non-sensitive examples. It may create a checkpoint and evidence record for every run.

Human approval is required for production configuration, protected workflow permissions, deployment targets, secret names, database migrations, public API or schema contracts, authentication or authorization behavior, and changes outside the declared scope.

The following are prohibited: committing secrets or personal data, weakening or bypassing CI gates, deleting evidence to hide a failure, changing a task to make a failed check appear successful, and claiming deployment or runtime success without verification.

An ADR under `docs/DECISIONS/` is required for architecture, public API, data model, security boundary, deployment topology, or compatibility-contract changes.
