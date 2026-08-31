# ADR 0001: Agent-ready repository independent of vendor

- **Status:** Accepted
- **Date:** 2026-08-31

## Context

The repository should support multiple coding agents without binding project behavior to a single vendor. Agents need stable instructions, commands, verification gates, and evidence requirements.

## Decision

Use plain repository files as the primary contract: `AGENTS.md`, `CLAUDE.md`, `Makefile`, shell wrappers, documentation, and GitHub Actions. Keep provider-specific integrations behind explicit adapters and protected secrets.

## Consequences

Any compatible agent that can read files and run Git commands can follow the same workflow. The repository remains runtime-neutral until an application stack is selected. Provider-specific automation will require additional configuration and review.
