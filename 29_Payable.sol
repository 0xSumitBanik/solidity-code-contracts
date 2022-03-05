// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract Payable{
  // payable is a modifier that can be added to a function.
  // It allows a function to receive ether while being called.

  // The following function has a payable modifier which means it can receive ether
  function depositETH() external payable{

  }

  // This function returns the balance (in Wei) of the specified address.
  // To Check if the depositETH() has worked properly, we'll pass the deployed smart contract address.
  function getBalance(address _addr) external view returns(uint){
    return _addr.balance;
  }
}