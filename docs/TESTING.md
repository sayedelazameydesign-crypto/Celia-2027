# Testing

The bootstrap now executes real checks. `make check` validates repository contracts and metadata; `make test` runs ESLint, TypeScript, and Vitest through the root scripts; `make build` compiles the shared packages and API and produces the Vite frontend; and `make verify` starts the built API and checks `GET /health`. A missing required application tool is `BLOCKED`, not `PASS`.
