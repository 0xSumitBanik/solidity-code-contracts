// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

/* Note:
  We can send Ether to other contracts by

  1. transfer (uses 2300 gas stipend, throws error)
  2. send (uses 2300 gas stipend, returns bool status)
  3. call (forward all gas or set gas, returns bool status)
*/
contract SendEther{
  // To enable the contract to receive ether, we have to make the constructor payable.
  // or, include receive/fallback functions.

  receive() payable external{}

  function transferExample(address payable _receiver) external payable{
    // This will transfer 1 wei.
      _receiver.transfer(1);
  }

  function sendExample(address payable _receiver) external payable{

  }

  function callExample(address payable _receiver) external payable{

  }  

}