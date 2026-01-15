// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleStorage {
    address public owner;
    uint256 private storedValue;
    string private message;

    event OwnerSet(address indexed oldOwner, address indexed newOwner);
    event ValueUpdated(uint256 newValue);
    event MessageUpdated(string newMessage);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor() {
        address oldOwner = owner;
        owner = msg.sender;
        emit OwnerSet(oldOwner, owner);
    }

    function setValue(uint256 _value) public onlyOwner {
        storedValue = _value;
        emit ValueUpdated(_value);
    }

    function getValue() public view returns (uint256) {
        return storedValue;
    }

    function setMessage(string calldata _message) public onlyOwner {
        message = _message;
        emit MessageUpdated(_message);
    }

    function getMessage() public view returns (string memory) {
        return message;
    }
}
