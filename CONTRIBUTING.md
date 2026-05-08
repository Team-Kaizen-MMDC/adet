# Contributing

## Branching strategy

This repository uses a lightweight GitFlow-style model:

1. `main` - stable branch.
2. `develop` - integration branch for upcoming changes.
3. `feature/<short-name>` - new notebook/data work based on `develop`.
4. `bugfix/<short-name>` - fixes based on `develop`.
5. `hotfix/<short-name>` - urgent production fixes based on `main`, then merged back to both `main` and `develop`.

## Contribution flow

1. Create your branch from the correct base branch.
2. Keep commits focused and descriptive.
3. Open a pull request into `develop` (or into `main` for hotfixes).
4. After approval, squash-merge unless preserving granular history is required.

## Notebook and data updates

- When a notebook is changed, verify it executes successfully with `jupyter nbconvert --execute`.
- Keep paired CSV/JSON assets in `IOT Data Simulation/` synchronized with notebook logic.

## Dependency lockfiles

- If you use a dependency manager that produces a lockfile (for example `uv.lock` from UV), commit that lockfile alongside dependency changes so other contributors and CI can reproduce installs.
- If using `.venv` + `requirements.txt`, update `requirements.txt` with `pip freeze > requirements.txt` and commit it.
