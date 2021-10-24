// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    mapping(address => uint256) userWaves;

    constructor() {
        console.log("I'm supposed to be smart, but I'm only printing a line...");
        // console.log("Yo yo, I am a contract and I am smart");
    }
    
    function wave() public {
        totalWaves += 1;
        userWaves[msg.sender] += 1;
        console.log("%s has waved!", msg.sender);
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