// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

/* Note:
  We can send Ether to other contracts by

  1. transfer (uses 2300 gas stipend, throws error)
  2. send (uses 2300 gas stipend, returns bool status)
  3. call (forward all gas or set gas, returns bool status)
*/
contract SendEther{
  // To enable the contract to store ether while deploying, we have to make the constructor payable.
  constructor() payable{}

  function transferExample(address payable _receiver) external payable{
    // This will transfer the amount: number of wei sent with the message
      _receiver.transfer(msg.value);
  }

  function sendExample(address payable _receiver) external payable{
    // This will transfer the amount: number of wei sent with the message
      bool sentStatus = _receiver.send(msg.value);
      require(sentStatus,"Fund Transfer Failed");
  }

  // This is the recommended method (more to be discussed later)
  function callExample(address payable _receiver) external payable{
    // This will transfer the amount: number of wei sent with the message
      (bool sentStatus,) = _receiver.call{value: msg.value}("");
      require(sentStatus,"Fund Transfer Failed");
  }  

}

contract ReceiveEther{
  event Log(address sender,uint amount,uint gas);

  receive() external payable{
    // gasleft() is a function which exists in global namespace.
    // It returns the remaining gas.
    emit Log(msg.sender,msg.value,gasleft());
  }

  function getBalance() external view returns(uint){
    return address(this).balance;
  }
}