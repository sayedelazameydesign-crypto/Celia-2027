# Architecture

The repository separates agent guidance, deterministic command wrappers, CI gates, deployment adapters, and post-deployment verification. Provider-specific implementation should be added only after the runtime, hosting target, data stores, and secret boundaries are documented.

The intended flow is `AGENTS.md` → task plan → `scripts/` and `Makefile` → CI → staging → verification → manually approved production. The initial repository is runtime-neutral so it does not make unsupported assumptions about the future application.
