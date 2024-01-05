// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract modOne {
    address public owner;
    uint256 public value;

    constructor() {
        owner = msg.sender;
    }

    //Contract successfully uses require()
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not authorized to call this function");
        _;
    }

    function placeBet(uint256 _newValue) public onlyOwner {
        require(_newValue > 0, "Value must be greater than zero");
        value = _newValue;
    }

    //Contract successfully uses assert()
    function validateBetSum(uint256 a, uint256 b) public view onlyOwner {
        assert(a + b == 50);
    }

    function validateBet(uint256 input) public view onlyOwner {
        require(input > 0, "Bet must be greater than 0");

        //Contract successfully uses revert() statements
        if (input > 100) {
            revert("Invalid input: Bet greater than 0 are not allowed");
        }
    }
}
