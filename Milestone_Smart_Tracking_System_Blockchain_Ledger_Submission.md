```python
import pandas as pd
import time


# Load IoT sensor data from CSV (Generated in Homework 1)
df = pd.read_csv("smart_logistic_tracker_japan.csv")


# Display the first few rows
print(df.head())

#Connect Python to the smart contract.
#Ensure Ganache is running in the background.
#Establish connection with Web3.py:


from web3 import Web3


# Connect to local blockchain
ganache_url = "http://127.0.0.1:8545"
web3 = Web3(Web3.HTTPProvider(ganache_url))


# Verify connection
if web3.is_connected():
    print("✅ Connected to Ganache successfully!")
else:
    print("❌ Connection failed. Ensure Ganache is running.")


#Load Smart Contract
# Replace with actual contract address from Remix
contract_address = "0x5299d1B2682e5bf6B67b74466f8F56F0211D26Dc"


# Paste the ABI from Remix
abi = [
	{
		"inputs": [],
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"anonymous": False,
		"inputs": [
			{
				"indexed": False,
				"internalType": "uint256",
				"name": "timestamp",
				"type": "uint256"
			},
			{
				"indexed": False,
				"internalType": "string",
				"name": "deviceId",
				"type": "string"
			},
			{
				"indexed": False,
				"internalType": "string",
				"name": "dataType",
				"type": "string"
			},
			{
				"indexed": False,
				"internalType": "string",
				"name": "dataValue",
				"type": "string"
			}
		],
		"name": "DataStored",
		"type": "event"
	},
	{
		"inputs": [],
		"name": "MAX_ENTRIES",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"name": "dataRecords",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "timestamp",
				"type": "uint256"
			},
			{
				"internalType": "string",
				"name": "deviceId",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "dataType",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "dataValue",
				"type": "string"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "index",
				"type": "uint256"
			}
		],
		"name": "getRecord",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			},
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "getTotalRecords",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "owner",
		"outputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "_deviceId",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "_dataType",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "_dataValue",
				"type": "string"
			}
		],
		"name": "storeData",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	}
]

# Load smart contract
contract = web3.eth.contract(
    address=contract_address,
    abi=abi
)

# Test contract function
total = contract.functions.getTotalRecords().call()

print("✅ Smart contract loaded successfully!")
print("Total Records:", total)

web3.eth.default_account = web3.eth.accounts[0]
print("Using account:", web3.eth.default_account)



print(f"✅ Connected to Smart Contract at {contract_address}")


#Send the IoT data to the blockchain. Each row from the CSV file will be stored as a transaction on the blockchain.
#Define a function to store IoT data:



def send_iot_data(device_id, data_type, data_value):
    """Sends IoT data to the deployed smart contract"""
    txn = contract.functions.storeData(device_id, data_type, data_value).transact({
        'from': web3.eth.default_account,
        'gas': 3000000
    })
   
    receipt = web3.eth.wait_for_transaction_receipt(txn)
    print(f"✅ Data Stored: {data_type} - {data_value}, Txn Hash: {receipt.transactionHash.hex()}")


# Send first 5 rows from CSV to blockchain
for index, row in df.head(5).iterrows():
    device_id = str(row["package_id"])
    data_type = "Location"
    data_value = str(row["current_location"])

    send_iot_data(device_id, data_type, data_value)
    time.sleep(1)
    
#Now that the data is on the blockchain, retrieve it to verify storage.
#Get total stored records:

total_records = contract.functions.getTotalRecords().call()
print(f"Total IoT records stored: {total_records}")


#Retrieve and print a specific record
record = contract.functions.getRecord(0).call()
print("First Stored Record:", record)
```

                        timestamp           carrier  tracking_number package_id  \
    0  2026-05-04 13:50:26.857905  Yamato Transport     942646961460    PKG7545   
    1  2026-05-03 23:36:26.858095        Japan Post      74355111775    PKG2659   
    2  2026-05-04 08:32:26.858217        Japan Post     217497030475    PKG7965   
    3  2026-05-04 02:35:26.858332        Japan Post     249781996688    PKG5296   
    4  2026-05-04 08:28:26.858444        Japan Post     718415724062    PKG9987   
    
        origin             current_location delivery_location prefecture  \
    0    Tokyo     Naha Central Post Office             Tokyo   Kanagawa   
    1    Tokyo   Nagoya Central Post Office             Kyoto   Kanagawa   
    2    Osaka   Nagoya Central Post Office             Osaka      Aichi   
    3  Fukuoka  Sapporo Central Post Office           Sapporo      Osaka   
    4  Fukuoka        Yokohama Sales Office           Sapporo   Hokkaido   
    
        latitude   longitude  ... waiting_time_minutes perishable  temperature  \
    0  35.993159  139.038781  ...                   45         No         10.7   
    1  35.691292  139.130870  ...                   54        Yes          6.2   
    2  35.591109  139.784940  ...                  144        Yes         -3.1   
    3  35.570440  139.689163  ...                  173        Yes          6.3   
    4  35.679375  139.408071  ...                   82         No          0.7   
    
      humidity    rfid_tag  rfid_verified tamper_alert  traffic_status  \
    0       40  RFID736892          False           No           Heavy   
    1       82  RFID156229          False          Yes          Detour   
    2       86  RFID890703           True          Yes           Heavy   
    3       87  RFID603182           True          Yes          Detour   
    4       60  RFID921432          False          Yes          Detour   
    
       inventory_level asset_utilization  
    0               99             84.59  
    1              363             53.39  
    2               25             95.75  
    3              145             63.84  
    4               34             56.28  
    
    [5 rows x 25 columns]
    ✅ Connected to Ganache successfully!
    ✅ Smart contract loaded successfully!
    Total Records: 3
    Using account: 0x345D574e127f7178Be290D70d969B6f22A1461C8
    ✅ Connected to Smart Contract at 0x5299d1B2682e5bf6B67b74466f8F56F0211D26Dc
    ✅ Data Stored: Location - Naha Central Post Office, Txn Hash: f4ef5afd72003e0a9c00fcec3b77b9f44c130540988ff3252a555ebead467e1e
    ✅ Data Stored: Location - Nagoya Central Post Office, Txn Hash: b6d82cf8af01de2e3ba5019cf14ddf15c05b168c4379cd0f6aa89cd720593a43
    ✅ Data Stored: Location - Nagoya Central Post Office, Txn Hash: d8be2d267d94a106f1e17458f10d7395841fad68c17c3b829953b7d57ee317f6
    ✅ Data Stored: Location - Sapporo Central Post Office, Txn Hash: 005355f0984b748020fc8c265dbc3072fa858e7d7aedd05c3fb8a66ca5088ce0
    ✅ Data Stored: Location - Yokohama Sales Office, Txn Hash: d8222fccc2bd83efa772f5c15512d0d5300bcd28cbad817d07b2fea94890880c
    Total IoT records stored: 8
    First Stored Record: [1779613785, 'TEST001', 'Temperature', '22.5C']



```python

```


```python

```
