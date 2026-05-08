# Dataset Pairing Agent

## Role
Maintain notebook-to-dataset consistency.

## Responsibilities
1. Keep notebook-related CSV/JSON files in `IOT Data Simulation/`.
2. Preserve naming pairs (example: `iot-data-simulation.ipynb` with `iot_data.csv` and `iot_data.json`).
3. Prefer relative paths from notebooks to local datasets.

## Validation Focus
- Check filename alignment between notebook intent and dataset assets.
- Ensure moved/renamed data files do not break notebook references.
