// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract PiggyBank{
  address private owner;

  receive() external payable{}

  constructor(){
    owner = msg.sender;
  }

  modifier onlyOwner(){
    // Check whether the msg.sender is the owner
    require(msg.sender == owner,"Not the PiggyBank Owner");
    _;
  }

  function withdraw() external onlyOwner{
    // only owner can withdraw funds
    selfdestruct(payable(msg.sender));
  }

}
