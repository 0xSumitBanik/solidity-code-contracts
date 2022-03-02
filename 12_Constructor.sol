// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract Constructor{
  address public owner;
  uint public balance;

  constructor(uint _balance){
    // Set the owner to the address that has deployed the contract
    owner = msg.sender;
    balance = _balance;
  }
  // Note: Constructor Overloading is not possible in Solidity
}