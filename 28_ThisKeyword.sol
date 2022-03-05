// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract ThisKeyword{
  // This Keyword points to the current smart contract instance.
  ThisKeyword public thisContract = this; // by default it has a return type of contract name
  // 👆 This will contain the address of deployed smart contract.
  address public contractAddress = address(this); // explicit address conversion

  uint public val;
  bool public flag;

  // How to get the values of variables using this? 
  // Please refrain from using the following way as it's not a good practice.

  uint public getVal = this.val();
  bool public getFlag = this.flag();

  function displayText() external pure returns (string memory){
    return "Hello World";
  }

  // string public a = displayText(); 👈 This will give an error, as we are trying to invoke an external function.

  string public text = this.displayText(); // Using this method we can access external functions inside the same contract. (it;s not advisable tho ❌)
} 