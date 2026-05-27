# ADET IoT Data Simulation

![Project Version](https://img.shields.io/badge/version-0.1.0-blue)
![Python Version](https://img.shields.io/badge/python-3.10%2B-3776AB?logo=python&logoColor=white)
![Notebook Version](https://img.shields.io/badge/notebooks-v1-F37626?logo=jupyter&logoColor=white)

IoT-focused simulation and analysis workspace using Jupyter notebooks and paired CSV/JSON datasets.

## Project layout

- `IOT Data Simulation/` - notebooks and source data files used by simulations.
- `.github/copilot-instructions.md` - Copilot session guidance specific to this repository.

## Getting started

```bash
# Create and activate a virtual environment (from repo root)
python3 -m venv .venv
source .venv/bin/activate

# Install core packages for running the notebooks
python3 -m pip install -r requirements.txt
```

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

## Data conventions

- Notebook and dataset names are intentionally paired (for example, `iot-data-simulation.ipynb` with `iot_data.csv` and `iot_data.json`).
- Keep datasets in `IOT Data Simulation/` and use relative paths from notebooks.

## Running the Smart-Contract Notebooks

If you are new to Remix and Ganache, use this section as the main runbook. The notebook only works after a smart contract has been deployed to the same Ganache network that the notebook connects to.

### What you need

- Python 3.10+ on macOS
- Ganache running locally on `http://127.0.0.1:7545`
- A deployed smart contract that matches the notebook ABI in `abi.json`
- The deployed contract address copied into `.env`

### Quick setup

1. Create and activate a virtual environment:

```bash
python3 -m venv .venv
source .venv/bin/activate
```

2. Install dependencies:

```bash
pip install -r requirements.txt
```

3. Copy the environment template:

```bash
cp .env.example .env
```

4. Edit `.env` and set `GANACHE_URL` and `CONTRACT_ADDRESS`.

### Remix + Ganache + Notebook workflow

1. Start Ganache and keep it running.

2. Open Remix at https://remix.ethereum.org/.

3. Open [contracts/SmartTrackingLedger.sol](contracts/SmartTrackingLedger.sol) in Remix.

4. Compile the contract.

5. Connect Remix to the same Ganache RPC URL shown in `.env`.

6. Deploy the contract.

7. Copy the deployed contract address from Remix and paste it into `.env` as `CONTRACT_ADDRESS`.

8. Run the notebook cell.

### What the notebook cell does

The first code cell in [Milestone_Smart_Tracking_System_Blockchain_Ledger_Submission.ipynb](Milestone_Smart_Tracking_System_Blockchain_Ledger_Submission.ipynb) does the following:

- loads the CSV dataset,
- connects to Ganache,
- checks that the contract exists at the address in `.env`,
- creates the contract object,
- stores five sample rows,
- and reads back the first record.

### What you should see

- `✅ Connected to Ganache successfully!`
- `✅ Smart contract loaded successfully!`
- a `Total Records:` value
- `Data Stored:` messages for each sample row

### Important distinction

- The Ganache **Accounts** tab shows wallet addresses.
- The notebook needs the address of the **deployed contract**.
- If you put an account address in `CONTRACT_ADDRESS`, the notebook will fail because there is no contract bytecode there.

### Troubleshooting

- If you see `No contract bytecode found at ...`, the address in `.env` is not a deployed contract on the active Ganache network.
- If the Remix deployment receipt has `status = 0`, the deployment failed and the resulting address is not usable in `.env`.
- Ganache in this workspace shows a block gas limit of `6721975`, so do not set Remix deployment gas above that value. Start with `6000000` or `6500000`.
- If Ganache shows accounts but the notebook cannot connect, check the RPC URL and port in `.env`.
- If `getTotalRecords()` fails, redeploy the matching contract in Remix and update `.env` with the new address.
- If you get gas estimation errors, make sure you deployed [contracts/SmartTrackingLedger.sol](contracts/SmartTrackingLedger.sol), not the sample `Storage` or `Owner` contract.

### Run notebooks headless

```bash
jupyter nbconvert --to notebook --execute "Milestone_Smart_Tracking_System_Blockchain_Ledger_Submission.ipynb" --ExecutePreprocessor.timeout=600
jupyter nbconvert --to notebook --execute "smart_tracking_system_blockchain_ledger_MS1_Draft.ipynb" --ExecutePreprocessor.timeout=600
```

### Run interactively

```bash
jupyter notebook
```

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
