// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract ParentContract{
  // We add virtual keyword to indicate that this function can be overriden by the child contract
  function displayName() external virtual pure returns (string memory){
      return "This is Parent Contract";
  }
}


contract ChildContract is ParentContract{
  // The following function is overriden with override keyword
  function displayName() external override pure returns (string memory){
      return "This is Child Contract";
  }
}