// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

// This example contract covers the concepts of:
/*
  - Global Variables
  - Error handling using: require()
*/
contract Ownable{
  address public owner; // Owner State Variable
  uint secretNumber;
  constructor(uint _secretNumber){
    // Set the owner to the address (global variable) that has deployed the contract
    owner = msg.sender;
    secretNumber = _secretNumber;
  }

  modifier onlyOwner(){
    // Check whether the msg.sender is the owner
    require(msg.sender == owner,"Not the Contract Owner");
    _;
  }

  function transferOwnership(address _newOwner) external onlyOwner{
    // Cannot transfer Ownership to zero address (0x0000..)
    require(_newOwner!=address(0),"Invalid Address");
    owner = _newOwner;
  }

  // Anyone can call this function
  function checkOwnerAddress() external view returns (address){
    return owner;
  }

  // Only Owner can call this function
  function checkSecretNumber() external onlyOwner view returns(uint){
    return secretNumber;
  }
}