// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract VisibilitySpecifiers{
  // State variables can be declared as public, private, or internal but not external.

  uint private x; // You cannot read the value outside the contract
  uint internal y;
  uint public z; // You can read the value outside the contract

  function privateFunction() private {
    x = 123;
  }

  // We put an underscore for internal functions as a part of convention
  function _internalFunction() internal{
    y = 456;
  }

  // This function can be accessed outside the contract
  // visible externally and internally
  function publicFunction() public {
    z = 789;
  }

  // This function can be accessed outside the contract
  // You cannnot call this function inside the same contract.
  function externalFunction() external view returns (address){
    return msg.sender;
  }


}


contract TestContract is VisibilitySpecifiers{

  function testTheVisibility() external returns (uint){
    // uint derivedValue = x; 👈 This will give an error as we cannot access private variables
    uint derivedValue = y; // We can inherit the internal variable ✔
    uint derivedValue1 = z;  // We can inherit the public variable ✔

    // privateFunction();  👈 This will give an error as we cannot access private functions.
    _internalFunction(); // We can access the internal function ✔
    publicFunction();   // We can access the public function ✔
    
    // externalFunction();   We cannot access the external function ❌

    return (derivedValue+derivedValue1);

  }

}