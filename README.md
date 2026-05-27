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

If you are new to Remix and Ganache, use this section as the main runbook. The notebook will only work after a smart contract has been deployed to the same Ganache network that the notebook connects to.

**Prerequisites**

- Python 3.10+ and a working terminal on macOS
- Ganache (GUI or CLI) running a local Ethereum JSON-RPC node
- Deployed smart contract on the Ganache network (you need the contract address and ABI)
- A Solidity contract that matches the notebook ABI in `abi.json` and exposes `storeData`, `getTotalRecords`, `getRecord`, and the `DataStored` event

**Quick setup**

1. Create and activate a virtualenv in the repository root:

```bash
python3 -m venv .venv
source .venv/bin/activate
```

2. Install dependencies:

```bash
pip install -r requirements.txt
```

**Using a `.env` file**

- Copy `.env.example` to `.env` and edit the values:

```bash
cp .env.example .env
# edit .env and set CONTRACT_ADDRESS and GANACHE_URL
```

- The repository includes a `config.py` helper which reads these values and exposes `GANACHE_URL` and `CONTRACT_ADDRESS`. Notebooks can import `config` and use `config.GANACHE_URL` or `config.get_checksummed_address(web3)`.

## Beginner Workflow: Remix + Ganache + Notebook

Follow these steps in order.

1. Start Ganache.

- Open Ganache GUI, or start Ganache CLI.
- Make sure it uses the same port as your notebook configuration.
- This repository currently uses `http://127.0.0.1:7545` in `.env`.

2. Open Remix.

- Go to https://remix.ethereum.org/.
- Load or paste the Solidity contract that matches this notebook.
- If you already have a compiled ABI, you can also compare it with `abi.json` in this repo.

3. Compile the smart contract in Remix.

- Select the Solidity compiler tab.
- Compile the contract successfully before deploying.
- If compilation fails, fix those errors first.

4. Connect Remix to Ganache.

- Open the Deploy & Run Transactions tab.
- Set the environment to Web3 Provider or Injected Provider, depending on your setup.
- Point Remix at the same Ganache RPC URL you plan to use in the notebook.

5. Deploy the contract.

- Click Deploy.
- Wait for the transaction to confirm.
- The address you need is the deployed contract address shown after deployment.

6. Copy the deployed contract address into `.env`.

- Do not copy an account address from the Ganache Accounts list.
- The notebook needs the address of the deployed contract, not a wallet address.
- Update `CONTRACT_ADDRESS` in `.env` with the deployed contract address.

7. Confirm the Ganache port and contract address match.

- If the notebook connects to `7545`, the contract must be deployed on that same Ganache session.
- If you restart Ganache, the old contract address usually becomes invalid for the new session.

8. Run the notebook.

- Open either notebook in Jupyter or VS Code.
- Run the first cell.
- If the contract is deployed correctly, the notebook should print the Ganache connection message and the smart contract load message.

**Important distinction**

- Ganache Accounts tab shows wallet addresses.
- The notebook needs a deployed contract address.
- If you use an account address in `CONTRACT_ADDRESS`, the notebook will fail because there is no contract bytecode at that address.

**Ganache / RPC port note**

- The two notebooks use different default RPC ports in their cells:
  - `smart_tracking_system_blockchain_ledger_MS1_Draft.ipynb` uses `http://127.0.0.1:7545`
  - `Milestone_Smart_Tracking_System_Blockchain_Ledger_Submission.ipynb` uses `http://127.0.0.1:8545`
- Ensure Ganache is started on the port the notebook expects, or edit the top cell in the notebook to set the correct `GANACHE_URL`.

**ABI & contract address**

- Deploy your contract to Ganache (Remix/Hardhat/Truffle). Copy the contract `address` and `ABI`.
- In each notebook replace the `contract_address` value and paste the `abi = [...]` block where indicated.
- Make sure the deployed contract address matches the same Ganache network and RPC port you are connected to. If the address comes from a different Ganache session or chain, contract calls will fail.

**Default account / transactions**

- Notebooks assume `web3.eth.accounts[0]` is available and unlocked (Ganache provides unlocked accounts by default).
- If `web3.eth.accounts` is empty, verify your Ganache connection and RPC settings.

**Run notebooks (headless)**
Run the notebooks end-to-end (headless) after confirming Ganache and ABI/address are set:

```bash
jupyter nbconvert --to notebook --execute "Milestone_Smart_Tracking_System_Blockchain_Ledger_Submission.ipynb" --ExecutePreprocessor.timeout=600
jupyter nbconvert --to notebook --execute "smart_tracking_system_blockchain_ledger_MS1_Draft.ipynb" --ExecutePreprocessor.timeout=600
```

**Run interactively**

```bash
jupyter notebook
# then open the notebook in the browser and run cells manually
```

**Troubleshooting / tips**

- If a transaction fails with out-of-gas, increase the `gas` value in the `.transact()` call.
- If `web3` version errors occur, try `pip install "web3>=6.0"` or pin a known-good version like `web3==6.3.1`.
- Ensure `contract.functions.getTotalRecords()` calls occur after transactions are mined — notebooks already call `wait_for_transaction_receipt` in most examples.
- If you see `No contract bytecode found at ...`, the address in `.env` is not a deployed contract on the active Ganache network.

If you want, I can also edit both notebooks to add a single top-level configuration cell (`GANACHE_URL`, `CONTRACT_ADDRESS`, `ABI`) so they are easier to run. Let me know and I'll make that change.

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
