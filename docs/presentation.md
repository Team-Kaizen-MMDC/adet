---
marp: true
theme: default
paginate: true
style: |
  :root {
    --brand:    #B00000;
    --maroon:   #7A0000;
    --light-bg: #F5F5F5;
    --mid-gray: #C9C9C9;
    --dark-txt: #1A1A1A;
    --white:    #FFFFFF;
  }

  section {
    background: var(--white);
    color: var(--dark-txt);
    font-family: 'Segoe UI', Arial, sans-serif;
    font-size: 22px;
    padding: 40px 56px;
  }

  section.title {
    background: linear-gradient(135deg, var(--maroon) 0%, var(--brand) 100%);
    color: var(--white);
    text-align: center;
    display: flex;
    flex-direction: column;
    justify-content: center;
  }
  section.title h1 { font-size: 52px; margin-bottom: 12px; }
  section.title h2 { font-size: 28px; font-weight: 400; opacity: 0.9; }
  section.title p  { font-size: 18px; opacity: 0.75; margin-top: 32px; }

  section.divider {
    background: var(--brand);
    color: var(--white);
    display: flex;
    flex-direction: column;
    justify-content: center;
  }
  section.divider h1 { font-size: 44px; }
  section.divider p  { font-size: 20px; opacity: 0.85; }

  section.notice {
    background: var(--light-bg);
    font-size: 17px;
    color: #444;
  }
  section.notice h1 { color: var(--brand); font-size: 32px; }

  h1 {
    color: var(--brand);
    font-size: 34px;
    border-bottom: 3px solid var(--brand);
    padding-bottom: 8px;
    margin-bottom: 20px;
  }

  .cols  { display: grid; grid-template-columns: 1fr 1fr;       gap: 28px; }
  .cols3 { display: grid; grid-template-columns: 1fr 1fr 1fr;   gap: 20px; }

  .box {
    background: var(--light-bg);
    border-left: 5px solid var(--brand);
    border-radius: 4px;
    padding: 14px 18px;
    margin-bottom: 14px;
  }
  .box-dark {
    background: var(--maroon);
    color: var(--white);
    border-radius: 6px;
    padding: 14px 20px;
    margin-bottom: 12px;
  }

  pre {
    background: #1e1e1e;
    color: #d4d4d4;
    border-radius: 6px;
    font-size: 15px;
    padding: 14px 18px;
  }

  .kpi .num { font-size: 48px; font-weight: 700; color: var(--brand); text-align: center; }
  .kpi .lbl { font-size: 16px; color: #555; margin-top: 4px; text-align: center; }

  table { width: 100%; border-collapse: collapse; font-size: 18px; }
  th { background: var(--brand); color: white; padding: 8px 12px; text-align: left; }
  td { padding: 6px 12px; border-bottom: 1px solid #e0e0e0; }
  tr:nth-child(even) td { background: #fafafa; }

  ul { line-height: 1.9; }
  li { margin-bottom: 4px; }
---

<!-- _class: title -->

# Smart Logistics Tracking System
## Kaizen Logistics — by Team Kaizen

**MO-IT148 Application Development and Emerging Technologies**
Terminal Assessment Presentation · July 13, 2026

*Abegail Imee Enriquez · Alvin Tubtub · Brian Jan Carlos*
*Juan Angelo Natividad · Maria Rose Kawano · Mariedel Apaitan*

---
<!-- _class: notice -->

# Proprietary Notice

All course materials, including lectures, class recordings, presentations,
handouts, assignments, and assessments, are the exclusive property of
**Mapua-Malayan Digital College** and are protected under
**Republic Act No. 8293** (Intellectual Property Code of the Philippines).

Unauthorized downloading, copying, reproduction, distribution, or uploading
of any part or whole of this material, in any form or medium, is strictly
prohibited. Such actions constitute copyright infringement under
Sections 172, 177, and 216 of the IP Code and may result in legal consequences.

For permissions or inquiries, please contact **MMDC-ISD** at
[isd@mmdc.mcl.edu.ph](mailto:isd@mmdc.mcl.edu.ph).

---

# Introduction

**Kaizen Logistics** is a simulated logistics company operating across Japan. This project demonstrates how **IoT + Blockchain + Data Visualization** can transform package tracking and operational decision-making.

<div class="cols" style="margin-top: 24px;">
<div class="box">

### 📡 IoT Sensors
Collect shipment data — location, temperature, RFID verification, and delivery status — for 100 package records across Japan.

</div>
<div class="box">

### ⛓️ Blockchain Ledger
Each package record is stored on a local **Ganache** blockchain via a Solidity smart contract, creating a tamper-resistant audit trail.

</div>
</div>
<div class="box">

### 📊 Tableau Dashboard
Retrieved blockchain records are cleaned, processed, and visualized in a 3-page Tableau dashboard for delivery monitoring, RFID risk analysis, and prefecture-level operations insights.

</div>

**End-to-end pipeline:** IoT Simulation → Smart Contract → Blockchain Storage → Web3.py Retrieval → Data Cleaning → Tableau Dashboard

---
<!-- _class: divider -->

# Milestone 1
## Blockchain Ledger Storage

Live Demo

---

# Milestone 1 — IoT Data Generation

<div class="cols">
<div>

### Dataset
- **100 unique package records** (PKG001–PKG100)
- **30 data columns** per record
- Simulated for Kaizen Logistics, Japan
- Source: `smart_logistics_tracker_japan_kaizenlogistics.csv`

### Key Field Groups

| Category | Fields |
|---|---|
| Identity | `package_id`, `tracking_number` |
| Location | Origin, Current, Delivery (city, prefecture, lat/lon) |
| Timing | `timestamp`, `Order Date`, `Estimated Delivery Date` |
| IoT | `Temperature`, `Temperature Issue`, `Perishable` |
| RFID | `RFID #`, `RFID Verified`, `RFID Success %` |
| Status | `Status`, `Delivery Exception Reason` |

</div>
<div>

### Sample Record — PKG033

```json
{
  "package_id":      "PKG033",
  "tracking_number": "KZJP2026000033",
  "timestamp":       "2026-05-04 11:51:30",
  "Origin Location": "Ichihara, Chiba",
  "Current Location":"Kofu, Yamanashi",
  "Status":          "Delivered",
  "Temperature":     25.6,
  "Temperature Issue":"Ambient",
  "Perishable":      "NO",
  "RFID #":          "RFID-KZ-0033",
  "RFID Verified":   "YES",
  "RFID Success %":  98.02,
  "Route Distance KM": 129.75
}
```

</div>
</div>

---

# Milestone 1 — Smart Contract

<div class="cols">
<div>

### `IoTDataStorage.sol`  ·  Solidity `^0.8.0`

```solidity
struct IoTData {
    uint256 timestamp;
    string  packageId;
    string  dataType;
    string  dataValue;   // full JSON row
}

uint256 public constant MAX_ENTRIES = 500;
IoTData[] public dataRecords;
address   public owner;

modifier onlyOwner() {
    require(msg.sender == owner,
            "Not authorized");
    _;
}
```

</div>
<div>

### Public Functions

| Function | Access | Purpose |
|---|---|---|
| `storeData(id, type, value)` | `onlyOwner` | Write one record |
| `getTotalRecords()` | `view` | Count stored records |
| `getRecord(index)` | `view` | Read one record |
| `MAX_ENTRIES()` | `view` | Returns 500 |
| `owner()` | `view` | Returns deployer address |

### Storage Format per Record
- **`packageId`** → `"PKG001"`
- **`dataType`** → `"PackageRecord"` (fixed)
- **`dataValue`** → full CSV row as JSON string

**Deployed address:**
`0xb714b620207A7905205F8302D0432Ca87ffd8F72`

</div>
</div>

---

# Milestone 1 — Web3.py Interaction

<div class="cols">
<div>

### Connect & Load Contract
```python
from web3 import Web3
from dotenv import load_dotenv
import os, json

load_dotenv()  # reads .env

web3 = Web3(Web3.HTTPProvider(
    os.getenv("GANACHE_URL")))

with open("contracts/abi.json") as f:
    abi = json.load(f)

contract = web3.eth.contract(
    address=web3.to_checksum_address(
        os.getenv("CONTRACT_ADDRESS")),
    abi=abi)
```

### Write — Store One Package
```python
contract.functions.storeData(
    "PKG001",
    "PackageRecord",
    json.dumps(row.to_dict())
).transact({
    "from": web3.eth.accounts[0],
    "gas":  3_000_000
})
```

</div>
<div>

### Read — Retrieve & Decode All Records
```python
total = contract.functions\
    .getTotalRecords().call()

for i in range(total):
    ts, pkg_id, dtype, dvalue = \
        contract.functions\
        .getRecord(i).call()
    record = json.loads(dvalue)
```

### Results

<div class="cols3" style="margin-top: 16px;">
<div class="kpi"><div class="num">100</div><div class="lbl">Records stored</div></div>
<div class="kpi"><div class="num">100</div><div class="lbl">Records retrieved</div></div>
<div class="kpi"><div class="num">✅</div><div class="lbl">CSV match</div></div>
</div>

<br>

```
CSV-to-ledger record match: True
All 100 CSV records match the
retrieved blockchain ledger records.
```

</div>
</div>

---
<!-- _class: divider -->

# Milestone 2
## Interactive Dashboard

---

# Milestone 2 — Dashboard Overview

<div class="cols">
<div>

### From Blockchain to Dashboard
1. Retrieve 100 records via `getRecord(index)`
2. Decode JSON `data_value` → DataFrame
3. **Week 6:** Clean, export `cleaned_iot_data.csv`
4. Build **event-level** dataset for route mapping
5. Publish **3-page Tableau story** on Tableau Public

### Event-Level Route Schema
Each package → multiple tracking events:

`Order Placed → Picked Up → In Transit → Out for Delivery → Delivered / Not Delivered`

Route lines use `map_path_id` + `map_path_order`
for Tableau's dual-layer map (lines + event points).

</div>
<div>

### 3-Page Tableau Story

<div class="box">

**Page 1 — Command Center**
KPI cards · Japan Smart Shipment Route Map · Temperature Condition stacked bar · Donut distribution chart

</div>
<div class="box">

**Page 2 — Prefecture Insights**
Delivered Prefectures · Top 10 Package Volume · Top 10 Avg Temperature · Top 10 Package Density by Prefecture

</div>
<div class="box">

**Page 3 — Sensor Reliability**
RFID Success % Over Time · RFID At-Risk Packages · Temperature Trend by Journey Stage · Packages Requiring Operational Review

</div>

</div>
</div>

---

# Milestone 2 — Live Demo

<div class="cols">
<div>

### KPI Benchmarks

| KPI | Benchmark |
|---|---|
| Delivery Rate | ≥ 95% |
| Avg RFID Success % | ≥ 97% |
| Exception Packages | ≤ 5 |
| Danger Zone Packages | ≤ 5 |
| Avg Temperature | ≤ 25°C |

### Temperature Condition Colors

| Label | Color |
|---|---|
| Ambient | `#BFC0C0` (gray) |
| Cool | `#6C8EA4` (blue-gray) |
| Danger Zone | `#B00000` (brand red) |

</div>
<div>

### Dashboard Filters
- Package ID (drill into one shipment)
- Perishable status
- Final delivery status (`Delivered` / `In Transit` / `Not Delivered`)
- Event status
- Event timestamp range

### Design Theme
- Brand dark red `#B00000` / Dark maroon `#7A0000`
- White panels / Light gray `#E6E6E6`
- Navigation buttons between all 3 pages

### 🔗 Tableau Public
[View Live Dashboard →](https://public.tableau.com/views/MO-IT148Milestone2SmartTrackingSystemDashboardSubmissionS3101TeamKaizen/MAINDASHBOARD)

</div>
</div>

---

# Ethical Considerations

<div class="box-dark">

**Q1 (All groups): Can IoT devices always be trusted to provide accurate readings? What happens if a sensor fails or is tampered with?**

</div>

IoT devices are not infallible. Sensor failures, network outages, or physical tampering can produce incorrect or missing readings. In a blockchain-backed system, inaccurate data is permanently recorded — making **garbage-in, garbage-out** a real risk. Safeguards include sensor redundancy, range-check validation before storage, and anomaly flagging prior to on-chain writes.

<div class="box-dark" style="margin-top: 20px;">

**Q2 (Logistics tracking): If an IoT tracking device fails, should companies rely only on blockchain records — or have backup verification methods?**

</div>

Blockchain records are immutable and trustworthy as a data store, but they only reflect what was submitted. If a sensor fails mid-shipment, the ledger will show gaps or stale data — not the physical reality. Kaizen Logistics addresses this with the **RFID Verified** flag and **RFID Success %** per package. Packages with low RFID rates are surfaced in our **Sensor Reliability** dashboard page as requiring **operational review**, prompting human verification rather than blind trust in the automated record.

---

# Sustainability & Long-Term Impact

<div class="box-dark">

**Q: Should businesses using blockchain for IoT offset their carbon footprint? How could they do this?**

</div>

Yes. Businesses can offset by: choosing **energy-efficient blockchain networks** (e.g., proof-of-authority, or Ethereum post-Merge rather than proof-of-work), sourcing infrastructure from **renewable energy providers**, **right-sizing** infrastructure (a private chain instead of a public one where appropriate), and investing in carbon credits or reforestation programs to neutralize remaining emissions.

<div class="box-dark" style="margin-top: 20px;">

**Q: Do blockchain-powered supply chains reduce paper waste and redundant data storage, or consume more energy than traditional systems?**

</div>

Both can be true. Blockchain eliminates paper-based manifests, duplicate data entry, and siloed databases — each Kaizen Logistics package becomes a single shared tamper-resistant record replacing multiple paper logs. However, energy cost is real. The net benefit depends on scale: **at logistics scale, the reduction in physical paper, redundant storage, and dispute-resolution overhead outweighs the energy cost** when efficient chains are used.

---

# Lessons Learned & Challenges Overcome

<div class="cols">
<div>

### Biggest Challenges

<div class="box">

**🔌 Ganache State Loss**
Contracts disappear on restart. Solved by storing the contract address in `.env` and scripting a redeploy workflow — updating the address is a one-line change.

</div>
<div class="box">

**🔑 `onlyOwner` Transaction Failures**
Transactions silently failed when sent from the wrong Ganache account. Fixed by explicitly matching the sender to the deployer address.

</div>
<div class="box">

**📦 ABI / Contract Mismatch**
Stale ABI caused `BadFunctionCallOutput` errors. Enforced discipline: always export ABI from Remix after every contract change and commit `contracts/abi.json`.

</div>

</div>
<div>

### Key Takeaways

<div class="box">

**IoT + Blockchain is powerful but fragile at the edges.** Sensor data quality is the weakest link — blockchain only preserves what it receives.

</div>
<div class="box">

**`.env`-driven config is essential for team workflows.** Hardcoded addresses and paths break as soon as Ganache restarts or another developer clones the repo.

</div>
<div class="box">

**Validation is non-negotiable.** The `CSV-to-ledger match: True` check confirmed all 100 records were stored and decoded correctly, preventing silent data corruption.

</div>
<div class="box">

**Event-level thinking unlocks richer dashboards.** Expanding package records to tracking events (Order Placed → Delivered) made Tableau route maps and journey-stage charts possible.

</div>

</div>
</div>

---

# Future Enhancements

<div class="cols">
<div>

### Blockchain & Smart Contract
- **Real-time sensor writes** — trigger `storeData()` directly from MQTT/IoT broker events instead of batch CSV upload
- **Role-based access** — allow authorized warehouse operators to write; restrict destructive ops to deployer only
- **On-chain RFID threshold checks** — revert `storeData` if RFID Success % < 90%, preventing low-quality reads from reaching the ledger
- **Public testnet deployment** — deploy to Sepolia or Polygon Mumbai for real-world persistence beyond Ganache sessions

### Data Pipeline
- **Automated redeploy script** — shell script that deploys the contract, captures the address, and writes it to `.env` in one step
- **Streaming pipeline** — replace batch notebook with a Kafka or MQTT stream feeding directly into the blockchain writer

</div>
<div>

### Dashboard & Visualization
- **Live Tableau refresh** — connect Tableau to a Python API that queries the blockchain in real time instead of a static CSV
- **Predictive delay alerts** — ML model (logistic regression) trained on temperature, route distance, and RFID data to flag likely `Not Delivered` outcomes before the final scan
- **Geospatial risk heatmap** — prefecture-level map colored by combined delay rate + Danger Zone temperature frequency

### Scale & Integration
- **100 → 10,000+ records** — current `MAX_ENTRIES = 500` and single-contract design would need sharding or a factory pattern at production scale
- **Multi-carrier ledger** — extend schema to support multiple logistics companies sharing one auditable blockchain
- **Mobile dashboard** — lightweight React or Tableau Mobile view for on-route drivers to pull their package's blockchain record on demand

</div>
</div>

---
<!-- _class: title -->

# Thank You

## Conclusion & Q&A

**The Kaizen Logistics Smart Tracking System** demonstrates that IoT sensor data, blockchain immutability, and interactive data visualization can be combined in a coherent, end-to-end pipeline — from a simulated package scan to a live Tableau dashboard.

&nbsp;

<div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; margin-top: 20px; text-align: center;">
<div><div style="font-size:36px; font-weight:700;">100</div><div style="opacity:0.8; font-size:15px;">Package records on-chain</div></div>
<div><div style="font-size:36px; font-weight:700;">3</div><div style="opacity:0.8; font-size:15px;">Tableau dashboard pages</div></div>
<div><div style="font-size:36px; font-weight:700;">100%</div><div style="opacity:0.8; font-size:15px;">CSV-to-ledger match</div></div>
</div>

&nbsp;

*Abegail Imee Enriquez · Alvin Tubtub · Brian Jan Carlos*
*Juan Angelo Natividad · Maria Rose Kawano · Mariedel Apaitan*

MO-IT148 · S3101 · Team Kaizen · July 13, 2026
