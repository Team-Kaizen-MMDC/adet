# ADET IoT Data Simulation

![Project Version](https://img.shields.io/badge/version-0.1.0-blue)
![Python Version](https://img.shields.io/badge/python-3.10%2B-3776AB?logo=python&logoColor=white)
![Notebook Version](https://img.shields.io/badge/notebooks-v1-F37626?logo=jupyter&logoColor=white)

IoT-focused simulation and analysis workspace using Jupyter notebooks and paired CSV/JSON datasets.

## Developer guide

If you are working on the blockchain notebook, start with [DEVELOPER_GUIDE.md](DEVELOPER_GUIDE.md). It explains the environment variables, notebook flow, duplicate handling, and how to reset the chain for a fresh test run.

## Project layout

- `IOT Data Simulation/` - notebooks and source data files used by simulations.
- `contracts/` - Solidity contract and ABI used by the blockchain notebook.
- `archive/` - older draft and milestone notebooks kept for reference.
- `.github/copilot-instructions.md` - Copilot session guidance specific to this repository.
- `.github/skills/` - project-specific agent skill docs for notebook execution, dataset mapping, and blockchain reset workflows.

## Getting started

```bash
source .venv/bin/activate
python3 -m pip install jupyter pandas numpy matplotlib
```

Before running the blockchain notebook, copy [/.env.example](.env.example) to [/.env](.env) and fill in the values for your local Ganache setup.

## Notebook configuration

The blockchain notebook reads these values from `.env` when they are available:

- `GANACHE_URL` - local Ganache RPC endpoint.
- `CONTRACT_ADDRESS` - deployed contract address.
- `CONTRACT_OWNER` - optional override for the sending account.
- `TARGET_CONTRACT_RECORDS` - how many on-chain records the notebook should try to write.
- `CSV_PATH` - notebook input CSV path.
- `ABI_PATH` - ABI file path used when loading the contract, now under `contracts/`.
- `SAMPLE_ROWS` - number of CSV rows shown in the preview.
- `WRITE_DELAY_SECONDS` - pause between contract writes.
- `WRITE_GAS_LIMIT` - gas limit for each write transaction.
- `ENABLE_DUPLICATE_WRITES` - set to `true` to write exact duplicates instead of skipping them.

The notebook stores two contract records per CSV row, one for `Location` and one for `Status`.

## Run notebooks

Run one notebook:

```bash
jupyter nbconvert --to notebook --execute "IOT Data Simulation/iot-data-simulation.ipynb" --ExecutePreprocessor.timeout=600
```

Run all notebooks:

```bash
for nb in "IOT Data Simulation"/*.ipynb; do
  jupyter nbconvert --to notebook --execute "$nb" --ExecutePreprocessor.timeout=600
done
```

For the blockchain notebook specifically, rerun the cells in order from the CSV load cell through the write cell.

## Data conventions

- Notebook and dataset names are intentionally paired (for example, `iot-data-simulation.ipynb` with `iot_data.csv` and `iot_data.json`).
- Keep datasets in `IOT Data Simulation/` and use relative paths from notebooks.

## Dependency manager alternatives

- Default: use a Python virtualenv (`.venv`) and a `requirements.txt` produced by `pip freeze`.

- UV (alternative package manager): this repo contains a `.gitignore` entry for `uv.lock`. If using UV, prefer committing `uv.lock` alongside dependency changes to ensure reproducible installs.

  Example workflows (consult your installed UV version's docs for exact commands):
  - Install UV (example): `pipx install uv` or `pip install uv`
  - Add a dependency: `uv add <package>`
  - Install from lockfile: `uv install` (creates/uses `uv.lock`)
  - After changes, update and commit `uv.lock`

  Note: UV commands may vary between versions. When adopting UV, update this README with the exact commands your team uses.

## Contributing

### Branching strategy

This repository uses a lightweight GitFlow-style model:

1. `main` - stable branch.
2. `develop` - integration branch for upcoming changes.
3. `feature/<short-name>` - new notebook/data work based on `develop`.
4. `bugfix/<short-name>` - fixes based on `develop`.
5. `hotfix/<short-name>` - urgent production fixes based on `main`, then merged back to both `main` and `develop`.

### Contribution flow

1. Create your branch from the correct base branch.
2. Keep commits focused and descriptive.
3. Open a pull request into `develop` (or into `main` for hotfixes).
4. After approval, squash-merge unless preserving granular history is required.

### Notebook and data updates

- When a notebook is changed, verify it executes successfully with `jupyter nbconvert --execute`.
- Keep paired CSV/JSON assets in `IOT Data Simulation/` synchronized with notebook logic.

## Improvement Log

See [docs/IMPROVEMENTS.md](docs/IMPROVEMENTS.md) for a compact record of the notebook, config, and docs improvements made so far.
