// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    mapping(address => uint256) userWaves;

    
    event NewWave(address indexed from, uint256 timetamp, string message);
    
    struct Wave {
        address waver; // Sender of wave
        string message; // Attached message;
        uint256 timetamp; // Timetamp of message arrival
    }

    Wave[] waves;

    constructor() payable {
        console.log("I'm supposed to be smart, but I'm only printing a line...");
        // console.log("Yo yo, I am a contract and I am smart");
    }
    
    function wave(string memory _message) public {
        totalWaves += 1;
        userWaves[msg.sender] += 1;
        console.log("%s has waved!", msg.sender);

        /*
        Store wave data in array
        */
        waves.push(Wave(msg.sender, _message, block.timestamp));
        /*
        Emit event
        */
        emit NewWave(msg.sender, block.timestamp, _message);

        uint256 prizeAmount = 0.0000000001 ether;
        require(
            prizeAmount <= address(this).balance,
            "Trying to withdraw more money than the contract has."
        );
        (bool success, ) = (msg.sender).call{value: prizeAmount}("");
        require(success, "Failed to withdraw money from contract.");
    }

    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }

    function getMyWaves() public view returns (uint256) {
        uint256 uwaves = userWaves[msg.sender];
        console.log("%s has waved %d times!", msg.sender, uwaves);
        return uwaves;

    }
}