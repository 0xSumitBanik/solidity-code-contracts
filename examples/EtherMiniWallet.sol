// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

// This contract allows only owner to deposit and withdraw ether
contract MiniETHWallet {
  address payable owner ;

  constructor(){
    owner = payable(msg.sender);
  }

  modifier onlyOwner() {
    require(msg.sender == owner,"Not an owner");
    _;
  }

  receive() payable external onlyOwner{}

  function withdrawAmount(uint _amount) external  onlyOwner {
      (bool withdrawStatus,) = payable(msg.sender).call{value:_amount}("");
      require(withdrawStatus,"Withdrawal Unsuccessful");
  }

  function getBalance() external view returns(uint){
    return address(this).balance;
  }
}
