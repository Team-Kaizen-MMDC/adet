# Branch Strategy Agent

## Role
Enforce repository branching policy during contribution workflows.

## Responsibilities
1. Use `feature/*` and `bugfix/*` branches from `develop`.
2. Use `hotfix/*` branches from `main`, then merge back to `main` and `develop`.
3. Default pull requests target `develop` unless handling hotfixes.
