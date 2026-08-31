# AGENTS.md

## Project
Celia 2027 is an intentionally minimal repository prepared as an AI-assisted development environment. Add application code under a clear project-specific directory and document architectural decisions in `docs/`.

## Before changing code
1. Read `README.md`, `docs/ARCHITECTURE.md`, and the relevant documentation in `docs/`.
2. For architecture or API-contract changes, create or update an ADR under `docs/DECISIONS/`.
3. Inspect the existing repository state and run `make check` plus the available checks.
4. Make the smallest focused change that solves the task.
5. Never expose credentials, tokens, personal data, or production configuration.

## Standard interface
Use the repository commands rather than inventing ad-hoc commands:

```text
make setup      # install dependencies when a supported package manifest exists
make check      # validate repository contracts and executable wrappers
make lint       # lint when configured
make typecheck  # type-check when configured
make test       # run available tests
make build      # build when configured
make verify     # run deterministic verification checks
```

Commands are designed to succeed with a clear skip message when the corresponding project tooling has not yet been added.

## Required report

After each change, report the summary, changed files, commands run, pass/fail/skip results, and anything that remains unverified.

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

## Application bootstrap
The approved runtime is Node.js 24+, TypeScript, React/Vite, and a separate Node API. Application boundaries are `apps/web`, `apps/api`, `packages/contracts`, and `packages/shared`. Do not add product features during bootstrap.
