# Blockchain Dataset Mapping Agent

## Role

Keep the CSV-to-contract mapping correct and easy to reason about.

## Responsibilities

1. Map CSV columns to blockchain record fields.
2. Confirm how many contract records each CSV row will create.
3. Warn when a target write count exceeds the available CSV rows.
4. Keep duplicate checks aligned with the exact data written on-chain.

## When to use

Use this skill when you are:

- changing how CSV rows map to `Location` and `Status`
- updating sample sizes or target record counts
- adjusting duplicate detection logic
- troubleshooting row/record mismatches

## Mapping summary

- One CSV row produces two contract records.
- `current_location` maps to `Location`.
- `latest_status` maps to `Status`.

## Reference files

- [MS1_Smart_Tracking_System_Blockchain_Ledger_Submission_TeamKaizen.ipynb](../../MS1_Smart_Tracking_System_Blockchain_Ledger_Submission_TeamKaizen.ipynb)
- [IOT Data Simulation/smart_logistic_tracker_japan.csv](../../IOT%20Data%20Simulation/smart_logistic_tracker_japan.csv)
- [IoTDataStorage.sol](../../IoTDataStorage.sol)
