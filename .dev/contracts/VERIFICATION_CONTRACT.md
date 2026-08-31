# Verification Contract v1

The canonical order is `check -> lint -> typecheck -> test -> build -> runtime verification`. The repository wrappers may skip a layer only when the relevant application tooling is not present, and must print that skip explicitly.

A task is not complete without recorded evidence for every applicable gate. Runtime verification is required whenever `HEALTHCHECK_URL` or an application runtime is configured. A failed gate blocks completion.
