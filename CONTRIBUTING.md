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
- For blockchain-related contributions, continue using the source files and generated outputs inside `IOT Data Simulation/`.
- For Tableau dashboard edits, use `assets/tableau_kaizen_logistics_tracking_events.csv`. This file is the Tableau-specific event-level dataset and is separate from the blockchain source CSV and the official Week 6 cleaned output.
- Do not overwrite `assets/cleaned_iot_data.csv` only for Tableau experimentation. If dashboard-specific fields are needed, update the Tableau event-level CSV and document the change.

## Dependency lockfiles

- If you use a dependency manager that produces a lockfile (for example `uv.lock` from UV), commit that lockfile alongside dependency changes so other contributors and CI can reproduce installs.
- If using `.venv` + `requirements.txt`, update `requirements.txt` with `pip freeze > requirements.txt` and commit it.
