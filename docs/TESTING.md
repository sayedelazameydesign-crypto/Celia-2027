# Testing

Testing is layered. Fast static checks should run before unit tests; build checks should run before deployment; post-deployment verification must run against the deployed target.

| Layer | Command | Purpose |
| --- | --- | --- |
| Lint | `make lint` | Style and static quality checks |
| Type check | `make typecheck` | Compile-time contract checks |
| Unit/integration | `make test` | Behavioral regression checks |
| Build | `make build` | Release artifact validation |
| Verification | `make verify` | Health and smoke evidence after build or deployment |

When a layer is not configured yet, the wrapper prints an explicit skip message. A future application must replace skips with real checks and document required services, fixtures, and test data handling.
