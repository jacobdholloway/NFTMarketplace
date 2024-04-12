// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
  uint public myNumber = 10;

  function setNumber(uint _newNumber) public {
    myNumber = _newNumber;
  }

  function getNumber() public view returns (uint) {
    return myNumber;
  }
}