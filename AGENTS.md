# AGENTS.md

## Project
Celia 2027 is an intentionally minimal repository prepared as an AI-assisted development environment. Add application code under a clear project-specific directory and document architectural decisions in `docs/`.

## Before changing code
1. Read `README.md` and the relevant documentation in `docs/`.
2. Inspect the existing repository state and run the available checks.
3. Make the smallest focused change that solves the task.
4. Never expose credentials, tokens, personal data, or production configuration.

## Standard interface
Use the repository commands rather than inventing ad-hoc commands:

```text
make setup      # install dependencies when a supported package manifest exists
make lint       # lint when configured
make typecheck  # type-check when configured
make test       # run available tests
make build      # build when configured
make verify     # run deterministic verification checks
```

Commands are designed to succeed with a clear skip message when the corresponding project tooling has not yet been added.

## Delivery gates
The required order is:

```text
code -> test -> build -> staging -> verify -> production
```

Production deployment must be manual, require explicit approval, and must never be triggered by an unreviewed pull request.

## Failure policy
If a check or verification gate fails, stop. Do not claim success. Record the command, failure, and evidence in the task or pull request.

## Change boundaries
Do not modify workflow permissions, deployment targets, secret names, or security policy to bypass a failure. Ask for clarification when a change could affect production, authentication, billing, data retention, or external integrations.
