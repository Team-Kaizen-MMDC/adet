// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;


contract IoTDataStorage {
    struct IoTData {
        uint256 timestamp;
      string deviceId;   // Package ID (e.g., "PKG001")
        string dataType;   // "Location" or "Status"
        string dataValue;  // e.g., "Tokyo" or "Delivered"
    }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  

    uint256 public constant MAX_ENTRIES = 500;
    IoTData[] public dataRecords;
    address public owner;


    event DataStored(uint256 timestamp, string deviceId, string dataType, string dataValue);


    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }


    constructor() {
        owner = msg.sender;
    }


    function storeData(
        string memory _deviceId,   // Package ID
        string memory _dataType,   // "Location" or "Status"
        string memory _dataValue   // Actual location or status value
        ) public onlyOwner {
        require(dataRecords.length < MAX_ENTRIES, "Storage limit reached");
        dataRecords.push(IoTData(block.timestamp, _deviceId, _dataType, _dataValue));
        emit DataStored(block.timestamp, _deviceId, _dataType, _dataValue);
    }


    function getTotalRecords() public view returns (uint256) {
        return dataRecords.length;
    }


    function getRecord(uint256 index) public view returns (uint256, string memory, string memory, string memory) {
        require(index < dataRecords.length, "Index out of bounds");
        IoTData memory record = dataRecords[index];
        return (record.timestamp, record.deviceId, record.dataType, record.dataValue);
    }
}
