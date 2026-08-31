# Celia 2027

Celia 2027 is a starter repository for disciplined, AI-assisted software development. It provides a small operating layer for agents and developers: explicit instructions, repeatable commands, CI gates, security checks, staging verification, and a manual production boundary.

## Quick start

```bash
make setup
make test
make build
make verify
```

The commands are intentionally safe for an empty or documentation-only repository. As application code is added, update the scripts and documentation to reflect the real toolchain.

## Repository map

| Path | Purpose |
| --- | --- |
| `AGENTS.md` | Operating rules for AI agents and contributors |
| `scripts/` | Stable command-line interface for setup, testing, building, verification, and deployment |
| `.github/workflows/` | CI, security, staging, and production gates |
| `verification/` | Deterministic post-build and post-deployment checks |
| `docs/` | Architecture, development, deployment, and operations contracts |
| `.dev/` | Reserved space for agent prompts, checks, configuration, and reusable development workflows |

## Deployment policy

A successful deployment command is not proof that the application works. Any real deployment must be followed by health checks, API checks, smoke tests, and preserved evidence. Production remains a manually approved operation.

## Current status

This repository contains the development operating layer only. No application runtime or deployment provider has been selected yet. Provider-specific credentials must be stored in GitHub Environments or an external secret manager, never in this repository.
