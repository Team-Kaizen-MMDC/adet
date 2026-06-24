# Improvement Log

This document summarizes the major improvements made to the **Kaizen Logistics Smart Package Monitoring & Tracking** workflow. The repository now covers the full path from IoT data simulation, smart contract deployment, blockchain ledger storage, data retrieval and processing, Week 7 sensor visualization, and Milestone 2 Tableau dashboard preparation.

## Major workflow improvements

- Rebuilt the logistics dataset from the ground up for the **Kaizen Logistics Japan** scenario.
- Standardized the project story around a mock logistics company operating across Japan.
- Created realistic package identifiers such as `PKG001`, `PKG002`, and so on.
- Added structured tracking numbers using the `KZJP` logistics format.
- Used a two-week order date range to support timeline filtering and dashboard analysis.
- Added estimated delivery dates for all packages, including delivered, in-transit, and not-delivered shipments.
- Added delivery exception reasons for packages that are delayed, in transit, or not delivered.
- Standardized status values for cleaner analysis:
  - `Delivered`
  - `In Transit`
  - `Not Delivered`
- Added realistic origin, current, and delivery location fields with city, prefecture, latitude, and longitude values.
- Improved IoT condition fields for package monitoring, including temperature, temperature issue labels, perishable flags, RFID verification, RFID success percentage, and RFID failure percentage.

## Data simulation improvements

- Added the updated Kaizen Logistics source dataset:
  - `IOT Data Simulation/smart_logistics_tracker_japan_kaizenlogistics.csv`
  - `IOT Data Simulation/smart_logistics_tracker_japan_kaizenlogistics.json`
  - `IOT Data Simulation/smart_logistics_tracker_japan_kaizenlogistics.ipynb`
- Generated 100 unique package records for the Japan logistics scenario.
- Made package records more dashboard-friendly by using consistent labels, readable dates, numeric temperature values, and reliable package-level identifiers.
- Preserved coordinate precision for Tableau mapping and route tracking.
- Added delivery and RFID fields that support operational storytelling, including exception monitoring and tracking reliability analysis.

## Smart contract and blockchain improvements

- Updated the Solidity contract and ABI files in the `contracts/` folder:
  - `contracts/IoTDataStorage.sol`
  - `contracts/abi.json`
- Stored one blockchain record per package row using the contract structure:
  - `timestamp`
  - `package_id`
  - `data_type`
  - `data_value`
- Used `PackageRecord` as the data type and stored the full package row as a JSON string in `data_value`.
- Confirmed that 100 package records can be stored and retrieved from Ganache through Web3.py.
- Added blockchain transaction logging for traceability.
- Added validation logic to compare the decoded blockchain ledger records against the source CSV.
- Confirmed that all 100 CSV records matched the retrieved blockchain ledger records.

## Milestone 1 notebook improvements

- Updated the Milestone 1 notebook to work with the new Kaizen Logistics source CSV.
- Connected Python to Ganache using the local RPC server.
- Loaded the deployed smart contract using the updated ABI.
- Stored all 100 package records as blockchain transactions.
- Retrieved all stored blockchain records.
- Decoded JSON package records into a structured DataFrame.
- Preserved the original CSV column order during decoding and export.
- Added a worksheet-friendly preview of a retrieved blockchain record.
- Exported blockchain outputs to the `IOT Data Simulation/` folder:
  - `kaizenlogistics_blockchain_ledger_retrieved.csv`
  - `kaizenlogistics_blockchain_ledger_retrieved.json`
  - `kaizenlogistics_blockchain_transactions.csv`

## Week 6 data retrieval and processing improvements

- Updated the Week 6 notebook to use the retrieved blockchain ledger output.
- Cleaned and structured the blockchain-retrieved package records for analysis.
- Removed blockchain-only helper columns that are not needed for visualization.
- Preserved useful package, shipment, location, temperature, RFID, and delivery status fields.
- Standardized decimal formatting for non-coordinate numeric fields.
- Preserved latitude and longitude precision for map-based visualizations.
- Exported the final Week 6 cleaned output to:
  - `assets/cleaned_iot_data.csv`

## Week 7 visualization improvements

- Updated the Week 7 line plot notebook to use `assets/cleaned_iot_data.csv`.
- Focused the visualizations on IoT sensor readings relevant to logistics monitoring.
- Created clean line plots for package temperature behavior over time.
- Improved chart titles, labels, date formatting, and visual readability.
- Added context so the Week 7 notebook supports the later Tableau dashboard story.

## Tableau dashboard improvements

- Added a Tableau-specific event-level dataset for interactive route and sensor monitoring:
  - `tableau_kaizen_logistics_tracking_events.csv`
- Expanded the Tableau dataset from package-level rows into tracking-event rows.
- Added route/path helper fields such as `event_order`, `map_path_id`, and `map_path_order`.
- Added event-level fields for route tracking, tooltips, temperature monitoring, and dashboard filters.
- Designed the Tableau dashboard story around four dashboard pages:
  1. **Kaizen Logistics Smart Package Monitoring & Tracking Dashboard**
  2. **Executive Overview**
  3. **Sensor Monitoring**
  4. **Exception Monitoring**
- Added a Tableau Public dashboard link to the README.
- Updated the Tableau storytelling documentation to match the final Kaizen Logistics dataset and dashboard structure.

## Documentation improvements

- Updated `README.md` to reflect the latest project scope, folder structure, major files, workflow, notebooks, datasets, and Tableau dashboard link.
- Updated `DEVELOPER_GUIDE.md` to reflect the current Kaizen Logistics blockchain workflow, Week 6 cleaning workflow, Week 7 visualization workflow, and Tableau dashboard preparation steps.
- Updated `docs/IMPROVEMENTS.md` to document the full set of changes from simulation to Tableau.
- Updated `docs/tableau_storytelling_iot_sensors.md` to replace the earlier draft storyboard with the final dashboard narrative and Tableau implementation guide.

## Current recommended outputs

The main files to verify before submission are:

```text
IOT Data Simulation/smart_logistics_tracker_japan_kaizenlogistics.csv
IOT Data Simulation/smart_logistics_tracker_japan_kaizenlogistics.json
IOT Data Simulation/MS1_Smart_Tracking_System_Blockchain_Ledger_Submission_TeamKaizen.ipynb
IOT Data Simulation/kaizenlogistics_blockchain_ledger_retrieved.csv
IOT Data Simulation/kaizenlogistics_blockchain_ledger_retrieved.json
IOT Data Simulation/kaizenlogistics_blockchain_transactions.csv
assets/cleaned_iot_data.csv
week_6_HomeworkDataRetrievalandProcessing.ipynb
week7_LinePlotofIoTSensorReadingsOverTime.ipynb
tableau_kaizen_logistics_tracking_events.csv
contracts/IoTDataStorage.sol
contracts/abi.json
README.md
DEVELOPER_GUIDE.md
docs/IMPROVEMENTS.md
docs/tableau_storytelling_iot_sensors.md
```

## Current project status

The project now has a complete end-to-end workflow:

```text
Kaizen Logistics data simulation
→ Solidity smart contract deployment
→ Ganache blockchain storage
→ Web3.py ledger retrieval
→ CSV-to-ledger validation
→ Week 6 cleaned dataset export
→ Week 7 line plot visualization
→ Tableau dashboard-ready event dataset
→ Tableau Public dashboard story
```
