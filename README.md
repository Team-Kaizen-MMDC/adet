# ADET Smart Logistics Tracking Project

![Project Version](https://img.shields.io/badge/version-0.2.0-blue)
![Python Version](https://img.shields.io/badge/python-3.10%2B-3776AB?logo=python&logoColor=white)
![Notebook Version](https://img.shields.io/badge/notebooks-Jupyter-F37626?logo=jupyter&logoColor=white)
![Blockchain](https://img.shields.io/badge/blockchain-Ganache%20%2B%20Solidity-7A0000)
![Dashboard](https://img.shields.io/badge/dashboard-Tableau%20Public-E97627?logo=tableau&logoColor=white)

This repository contains the **Kaizen Logistics Smart Package Monitoring & Tracking** project for MO-IT148 Application Development and Emerging Technologies. The project simulates IoT-enabled logistics data, stores package records on a local blockchain through Ganache and Solidity, retrieves and processes the blockchain ledger in Python, and builds dashboard-ready outputs for Tableau visualization.

## Project scenario

**Kaizen Logistics** is a mock logistics company operating across Japan. The project demonstrates how IoT sensor readings and blockchain-backed records can support package tracking, delivery monitoring, temperature condition tracking, RFID reliability checks, and exception detection.

The end-to-end workflow is:

```text
IoT logistics data simulation
→ Smart contract deployment
→ Blockchain ledger storage
→ Python/Web3.py data retrieval
→ Data cleaning and validation
→ Week 7 line plot visualization
→ Tableau dashboard storytelling
```

## Tableau dashboard

The Tableau dashboard is published here:

[Kaizen Logistics Smart Package Monitoring & Tracking Dashboard](https://public.tableau.com/views/MO-IT148Milestone2SmartTrackingSystemDashboardSubmissionS3101TeamKaizen/MAINDASHBOARD?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

Recommended dashboard flow:

1. **Kaizen Logistics Smart Package Monitoring & Tracking Dashboard**
2. **Kaizen Logistics Prefecture Operations & Temperature Insights**
3. **Kaizen Logistics IoT Sensor Reliability & Exception Monitoring**

## Project layout

```text
adet/
├── archive/
├── assets/
│   ├── cleaned_iot_data.csv
│   └── tableau_kaizen_logistics_tracking_events.csv
├── contracts/
│   ├── IoTDataStorage.sol
│   └── abi.json
├── docs/
│   ├── IMPROVEMENTS.md
│   └── tableau_storytelling_iot_sensors.md
├── IOT Data Simulation/
│   ├── smart_logistics_tracker_japan_kaizenlogistics.ipynb
│   ├── smart_logistics_tracker_japan_kaizenlogistics.csv
│   ├── smart_logistics_tracker_japan_kaizenlogistics.json
│   ├── MS1_Smart_Tracking_System_Blockchain_Ledger_Submission_TeamKaizen.ipynb
│   ├── kaizenlogistics_blockchain_ledger_retrieved.csv
│   ├── kaizenlogistics_blockchain_ledger_retrieved.json
│   └── kaizenlogistics_blockchain_transactions.csv
├── DEVELOPER_GUIDE.md
├── README.md
├── week_6_HomeworkDataRetrievalandProcessing.ipynb
└── week7_LinePlotofIoTSensorReadingsOverTime.ipynb
```

The Tableau-specific CSV is stored in the `assets/` folder and is separate from the official Week 6 cleaned dataset.

## Main files

| File | Purpose |
|---|---|
| `IOT Data Simulation/smart_logistics_tracker_japan_kaizenlogistics.ipynb` | Generates the updated Kaizen Logistics Japan dataset. |
| `IOT Data Simulation/smart_logistics_tracker_japan_kaizenlogistics.csv` | Source CSV with 100 package records used for blockchain storage. |
| `IOT Data Simulation/smart_logistics_tracker_japan_kaizenlogistics.json` | JSON copy of the simulated package records. |
| `contracts/IoTDataStorage.sol` | Solidity smart contract used in Remix and Ganache. |
| `contracts/abi.json` | ABI exported from Remix for Web3.py integration. |
| `IOT Data Simulation/MS1_Smart_Tracking_System_Blockchain_Ledger_Submission_TeamKaizen.ipynb` | Stores 100 package records on the blockchain, retrieves them, validates the ledger, and exports blockchain outputs. |
| `IOT Data Simulation/kaizenlogistics_blockchain_ledger_retrieved.csv` | Retrieved and decoded blockchain ledger records. |
| `IOT Data Simulation/kaizenlogistics_blockchain_ledger_retrieved.json` | JSON export of retrieved blockchain ledger records. |
| `IOT Data Simulation/kaizenlogistics_blockchain_transactions.csv` | Transaction hash log for blockchain writes. |
| `week_6_HomeworkDataRetrievalandProcessing.ipynb` | Cleans and processes the retrieved blockchain records for visualization. |
| `assets/cleaned_iot_data.csv` | Final Week 6 cleaned dataset used by Week 7. |
| `week7_LinePlotofIoTSensorReadingsOverTime.ipynb` | Creates IoT sensor line plots using the cleaned Week 6 output. |
| `assets/tableau_kaizen_logistics_tracking_events.csv` | Tableau-specific event-level dataset for route tracking, filters, KPI calculations, tooltips, and the final three-page Tableau dashboard. |
| `docs/IMPROVEMENTS.md` | Summary of major project improvements. |
| `docs/tableau_storytelling_iot_sensors.md` | Tableau dashboard story, layout, color scheme, and talking points. |
| `DEVELOPER_GUIDE.md` | Technical setup and troubleshooting guide. |

## Data fields

The updated Kaizen Logistics dataset includes package, route, IoT, and RFID tracking fields such as:

```text
package_id
tracking_number
timestamp
Origin Location
Origin City
Origin Prefecture
Origin Latitude
Origin Longitude
Order Date
Current Location
Current Latitude
Current Longitude
Estimated Delivery Date
Delivery Exception Reason
Status
Perishable
Temperature
Temperature Issue
Delivery Longitude
Delivery Latitude
Delivery City
Delivery Prefecture
Route Distance KM
Estimated Transit Hours
RFID #
RFID Verified
RFID Failure %
RFID Failure Label
RFID Success %
RFID Success Label
```

The Tableau-specific event dataset expands package-level records into multiple tracking events per package, allowing Tableau to draw route paths and show event-level tooltips.

## Getting started

Create or activate a Python environment, then install the main dependencies:

```bash
python -m pip install jupyter pandas numpy matplotlib seaborn web3 python-dotenv
```

If using Conda:

```bash
conda activate <environment-name>
python -m pip install jupyter pandas numpy matplotlib seaborn web3 python-dotenv
```

## Ganache, Remix, and Solidity workflow

1. Open Ganache and start a local blockchain workspace.
2. Confirm the RPC server. Common values are:

```text
http://127.0.0.1:7545
http://127.0.0.1:8545
```

3. Open Remix IDE.
4. Create or open `IoTDataStorage.sol`.
5. Use the latest code from `contracts/IoTDataStorage.sol`.
6. Compile with Solidity `0.8.0` or compatible `0.8.x` version.
7. Deploy using **External HTTP Provider** connected to Ganache.
8. Copy the deployed contract address into the Milestone 1 notebook.
9. Confirm that `contracts/abi.json` matches the deployed contract.

## Blockchain storage format

The smart contract stores one blockchain record per package row using:

```text
timestamp
package_id
data_type
data_value
```

For this project:

- `package_id` contains values such as `PKG001`.
- `data_type` is stored as `PackageRecord`.
- `data_value` stores the full package row as a JSON string.

This approach preserves the full CSV row while still following the simple smart contract format used in the coursework.

## Running the notebooks

Run notebooks from the repository root when possible so relative paths work correctly.

Suggested order:

1. Generate or verify the source dataset:

```text
IOT Data Simulation/smart_logistics_tracker_japan_kaizenlogistics.ipynb
```

2. Run the Milestone 1 blockchain ledger notebook:

```text
IOT Data Simulation/MS1_Smart_Tracking_System_Blockchain_Ledger_Submission_TeamKaizen.ipynb
```

3. Run the Week 6 data retrieval and processing notebook:

```text
week_6_HomeworkDataRetrievalandProcessing.ipynb
```

4. Run the Week 7 line plot notebook:

```text
week7_LinePlotofIoTSensorReadingsOverTime.ipynb
```

## Expected outputs

Milestone 1 blockchain outputs:

```text
IOT Data Simulation/kaizenlogistics_blockchain_ledger_retrieved.csv
IOT Data Simulation/kaizenlogistics_blockchain_ledger_retrieved.json
IOT Data Simulation/kaizenlogistics_blockchain_transactions.csv
```

Week 6 cleaned output:

```text
assets/cleaned_iot_data.csv
```

Tableau visualization dataset:

```text
assets/tableau_kaizen_logistics_tracking_events.csv
```

## Tableau dashboard notes

The Tableau dashboard uses the event-level CSV to support:

- Japan route/path mapping
- event-level tracking points
- package-level filters
- event status and final delivery status filters
- perishable package filters
- temperature condition charts
- prefecture-level comparison
- RFID reliability analysis
- package-level operational risk monitoring
- customized tooltips, KPI explanations, and navigation buttons

Recommended main dashboard title:

```text
Kaizen Logistics Smart Package Monitoring & Tracking Dashboard
```

Recommended main map title:

```text
Japan Smart Shipment Route Map
```

## Tableau dashboard pages

The final Tableau story is organized into three dashboard pages:

1. **Kaizen Logistics Smart Package Monitoring & Tracking Dashboard** - command-center view with route mapping, core KPIs, journey-stage temperature conditions, and overall temperature distribution.
2. **Kaizen Logistics Prefecture Operations & Temperature Insights** - regional view showing delivered prefectures, average prefecture temperature, danger-zone package count, Top 10 package volume by prefecture, Top 10 average temperature by prefecture, and Top 10 package density by prefecture.
3. **Kaizen Logistics IoT Sensor Reliability & Exception Monitoring** - sensor-risk view showing in-transit and not-delivered packages, average RFID success, RFID at-risk packages, RFID trend over time, temperature trend by journey stage and delivery status, operational review packages, and RFID reliability distribution.

Top 10 views are used in the Prefecture Insights page to keep regional comparison readable and focused on the most active delivery prefectures. Tooltip notes disclose that values may change based on selected filters and should be interpreted within the current dashboard selection.

## Documentation

Additional project documentation:

- [Developer Guide](DEVELOPER_GUIDE.md)
- [Improvement Log](docs/IMPROVEMENTS.md)
- [Tableau Storytelling Guide](docs/tableau_storytelling_iot_sensors.md)

## Contributing

### Branching strategy

This repository uses a lightweight GitFlow-style model:

1. `main` - stable branch.
2. `develop` - integration branch for upcoming changes.
3. `feature/<short-name>` - new notebook, data, dashboard, or documentation work based on `develop`.
4. `bugfix/<short-name>` - fixes based on `develop`.
5. `hotfix/<short-name>` - urgent fixes based on `main`, then merged back to both `main` and `develop`.

### Contribution flow

1. Create a new branch from the correct base branch.
2. Keep commits focused and descriptive.
3. Verify changed notebooks before opening a pull request.
4. Keep paired CSV/JSON outputs synchronized with notebook logic.
5. Do not commit local-only files such as `.env`, notebook checkpoints, or temporary exports.
6. Update documentation when folder paths, notebook names, contract logic, dataset structure, or dashboard links change.

## Rights

All rights reserved.
