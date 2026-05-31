# Improvement Log

This document summarizes the main improvements made to the blockchain notebook workflow.

## Notebook improvements

- Externalized the contract address into `.env`.
- Externalized the Ganache RPC URL into `.env`.
- Externalized the CSV path, ABI path, preview row count, gas limit, and write delay into `.env`.
- Added an exact duplicate check before each write.
- Added a toggle to intentionally allow duplicate writes for testing.
- Added target record control so test runs can be limited without editing code.
- Added record count, capacity, and remaining-slot visibility.
- Added basic CSV load error handling.
- Added sample-row preview output at the start of the notebook.

## Contract and chain behavior

- The notebook now checks the current on-chain record count before writing.
- The notebook stops before the contract limit would be exceeded.
- The notebook handles the owner account more safely by verifying the unlocked Ganache account.
- The notebook warns when the contract is full or near capacity.

## Documentation improvements

- Added a junior-friendly [developer guide](../DEVELOPER_GUIDE.md).
- Added Mermaid flowcharts for the notebook run path and reset path.
- Added project-specific GitHub skill docs under [`.github/skills/`](../.github/skills/).
- Added [/.env.example](../.env.example) for easy local setup.
- Updated the README with configuration and workflow notes.

## Current toggle

- `ENABLE_DUPLICATE_WRITES=false` by default.
- Set it to `true` in `.env` if you want the notebook to store exact duplicates during testing.
