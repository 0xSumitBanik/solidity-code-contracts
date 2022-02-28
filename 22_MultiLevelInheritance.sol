// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract ParentContract{
  // We add virtual keyword to indicate that this function can be overriden by the child contract
  function displayName() external virtual pure returns (string memory){
      return "This is Parent Contract";
  }
}


contract ChildContract is ParentContract{
  // As this function will also be overriden by another child contract hence it is set to virtual and override
  function displayName() external virtual override pure returns (string memory){
      return "This is Child Contract";
  }
}
contract GrandChildContract is ChildContract{
  // The following function is overriden with override keyword
  function displayName() external override pure returns (string memory){
      return "This is Grand Child Contract";
  }  
}