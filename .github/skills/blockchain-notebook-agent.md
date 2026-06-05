# Blockchain Notebook Agent

## Role

Help run and edit the blockchain notebook safely.

## Responsibilities

1. Load CSV data with clear error handling.
2. Keep `.env` values externalized.
3. Respect `MAX_ENTRIES`, `TARGET_CONTRACT_RECORDS`, and duplicate checks.
4. Show a small sample of records before writes.

## When to use

Use this skill when you are:

- updating the notebook cells
- changing `.env` values for Ganache or contract settings
- checking how many records will be written
- adding sample display or validation logic

## Common files

- [MS1_Smart_Tracking_System_Blockchain_Ledger_Submission_TeamKaizen.ipynb](../../MS1_Smart_Tracking_System_Blockchain_Ledger_Submission_TeamKaizen.ipynb)
- [README.md](../../README.md)
- [.env](../../.env)
- [abi.json](../../contracts/abi.json)

## Handy checks

```bash
source .venv/bin/activate
python3 -m pip install jupyter pandas numpy matplotlib
```

```bash
jupyter nbconvert --to notebook --execute "MS1_Smart_Tracking_System_Blockchain_Ledger_Submission_TeamKaizen.ipynb" --ExecutePreprocessor.timeout=600
```
