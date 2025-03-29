// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Identity {
    mapping(address => string) public identities;

    function register(string memory did) public {
        identities[msg.sender] = did;
    }

    function getDID(address user) public view returns (string memory) {
        return identities[user];
    }
}
