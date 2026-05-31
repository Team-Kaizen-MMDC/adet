# Blockchain Reset Agent

## Role

Help reset the blockchain test environment when the contract is full or the data needs a clean rerun.

## Responsibilities

1. Explain when a reset is required.
2. Guide Ganache restart and contract redeploy steps.
3. Verify `.env` values after redeploy.
4. Warn when a contract has no reset function.

## When to use

Use this skill when you are:

- trying to purge old blockchain test data
- hitting `Storage limit reached`
- seeing `Not authorized`
- changing to a new contract address
- preparing a fresh validation run

## Reset flow

1. Stop Ganache.
2. Start Ganache again.
3. Redeploy the smart contract.
4. Update `CONTRACT_ADDRESS` in `.env`.
5. Rerun the notebook from the first cell.

## Reference files

- [IoTDataStorage.sol](../../contracts/IoTDataStorage.sol)
- [MS1_Smart_Tracking_System_Blockchain_Ledger_Submission_TeamKaizen.ipynb](../../MS1_Smart_Tracking_System_Blockchain_Ledger_Submission_TeamKaizen.ipynb)
- [.env](../../.env)

## Quick reminders

- The current contract does not include a delete or reset function.
- Exact duplicate records are skipped in the notebook, but the chain still needs a fresh deploy to clear stored data.
