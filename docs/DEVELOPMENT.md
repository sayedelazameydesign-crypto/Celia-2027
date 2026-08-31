# Development

The application workspace uses Node.js 24+, npm workspaces, TypeScript, React/Vite, and a separate Node API. Run `npm install`, then `make test`, `make build`, and `make verify`. The API health endpoint is `GET /health` on port `4173` by default. Keep frontend, API, contracts, and shared utilities in their declared workspace boundaries.
