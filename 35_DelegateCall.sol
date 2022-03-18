// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract EmployeeRecord{

  uint id;
  mapping(uint=>string) public EmployeeMapping;

  event Log(uint indexed,string);

  function addEmployeeDetails(string calldata _name) external{
    EmployeeMapping[id++]=_name;
    emit Log(id,_name);
  }

}

/* Note:
  - There exists a special variant of a message call, named delegatecall 
    which is identical to a message call apart from the fact 
    that the code at the target address is executed in the context of the calling contract 
    and msg.sender and msg.value do not change their values.

  - This means that a contract can dynamically load code from a different address at runtime. 
    Storage, current address and balance still refer to the calling contract, 
    only the code is taken from the called address.
*/


// We will call this contract using the delegatecall
contract EmployeeDB{

  // Please maintain the order of state variables for which the delegatecall will be performed.
  // Here, we are only using one State Variable.
  uint id;


  function delegateCallExample(address _contractAddress,string calldata _name) external{
    (bool status,) = _contractAddress.delegatecall(
      abi.encodeWithSelector(EmployeeRecord.addEmployeeDetails.selector, _name)
    );
    require(status,"Delegate Call Failed");
  }

}