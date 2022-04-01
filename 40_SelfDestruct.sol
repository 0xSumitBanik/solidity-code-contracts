// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract SelfDestruct{
  event Log(bytes32);
  constructor() payable{}
    
  function deleteContract() external{
    selfdestruct(payable(msg.sender));
    emit Log("Contract Deleted"); // 👈 This will not get logged as contract is destructed.
  }

  function isContractAlive() external pure returns (bool){
    return true; //if the contract is self destructed, this will automatically reset to false value.
  }
}

contract TestSelfDestruct{
  function getBalance() external view returns (uint){
    return address(this).balance;
  }

  // On Calling this 👇, the TestSelfDestruct will get all the ETH from the destucted contract (inspite of not having fallback func.)
  function destroyDeployedContract(SelfDestruct _addr) external{
    _addr.deleteContract();
  }
}