// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract Mapping{
  // Syntax: mapping(_KeyType => _ValueType)
  mapping(address => uint) public balances;
  mapping(address => mapping (address=>bool)) public relational;

  function mappingOperations() external{
    balances[msg.sender] = 1000; // set the value for msg.sender to 1000

    delete balances[msg.sender]; // Sets it to false value (here, 0) for specified key
  }

  /*
    Note:
    - You can mark state variables of mapping type as public and Solidity creates a getter for you. 
    - The _KeyType becomes a parameter for the getter.
   */
}