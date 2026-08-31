# CI Contract v1

GitHub Actions is an independent gate, not an extension of agent judgment. Pull requests must pass the required CI checks, have review approval, and contain verification notes. Agents cannot override a failed check or merge a pull request by declaring success.

Branch protection should require the `quality` and `security` checks, prohibit force-pushes to `main`, and require a pull request. Repository administrators should configure these rules in GitHub after the application checks are selected.
