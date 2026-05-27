// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract SmartTrackingLedger {
    struct DataRecord {
        uint256 timestamp;
        string deviceId;
        string dataType;
        string dataValue;
    }

    event DataStored(
        uint256 timestamp,
        string deviceId,
        string dataType,
        string dataValue
    );

    uint256 public constant MAX_ENTRIES = 1000;
    address public owner;
    DataRecord[] private dataRecords;

    constructor() {
        owner = msg.sender;
    }

    function getTotalRecords() external view returns (uint256) {
        return dataRecords.length;
    }

    function getRecord(uint256 index)
        external
        view
        returns (uint256, string memory, string memory, string memory)
    {
        require(index < dataRecords.length, "Index out of range");
        DataRecord storage record = dataRecords[index];
        return (record.timestamp, record.deviceId, record.dataType, record.dataValue);
    }

    function storeData(
        string memory _deviceId,
        string memory _dataType,
        string memory _dataValue
    ) external {
        require(dataRecords.length < MAX_ENTRIES, "Max entries reached");

        DataRecord memory record = DataRecord({
            timestamp: block.timestamp,
            deviceId: _deviceId,
            dataType: _dataType,
            dataValue: _dataValue
        });

        dataRecords.push(record);
        emit DataStored(record.timestamp, record.deviceId, record.dataType, record.dataValue);
    }
}
