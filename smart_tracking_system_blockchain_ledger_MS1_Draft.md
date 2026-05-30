```python
from web3 import Web3

# Connect to Ganache
ganache_url = "http://127.0.0.1:8545"
web3 = Web3(Web3.HTTPProvider(ganache_url))

# Check connection
if web3.is_connected():
    print("✅ Connected to Ganache successfully!")
else:
    print("❌ Connection failed.")

# Contract address
contract_address = Web3.to_checksum_address(
    "0x5299d1B2682e5bf6B67b74466f8F56F0211D26Dc"
)

# Paste ABI here
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

# Store a dummy IoT data entry manually to test if transactions work

txn = contract.functions.storeData(
    "TEST001",
    "Temperature",
    "22.5C"
).transact({
    'from': web3.eth.default_account,
    'gas': 1000000
})

web3.eth.wait_for_transaction_receipt(txn)

print("✅ Dummy data stored on blockchain!")

total_records = contract.functions.getTotalRecords().call()
print(f"Total Records: {total_records}")


record = contract.functions.getRecord(0).call()
print("First Stored Record:", record)
```

    ✅ Connected to Ganache successfully!
    ✅ Smart contract loaded successfully!
    Total Records: 2
    Using account: 0x345D574e127f7178Be290D70d969B6f22A1461C8
    ✅ Dummy data stored on blockchain!
    Total Records: 3
    First Stored Record: [1779613785, 'TEST001', 'Temperature', '22.5C']



```python

```


```python

```


```python

```
