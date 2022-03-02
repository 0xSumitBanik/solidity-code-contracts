// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

/*
Hierarchical Inheritance:

In Hierarchical inheritance, a parent contract has more than one child contracts. 
It is mostly used when a common functionality is to be used in different places.
*/

contract ParentContract{
  // We add virtual keyword to indicate that this function can be overriden by the child contract
  function displayName() external virtual pure returns (string memory){
      return "This is Parent Contract";
  }
}


contract FirstChildContract is ParentContract{
  // As this function will also be overriden by another child contract hence it is set to virtual and override
  function displayName() external virtual override pure returns (string memory){
      return "This is First Child Contract";
  }
}
contract SecondChildContract is ParentContract{
  // The following function is overriden with override keyword
  function displayName() external override pure returns (string memory){
      return "This is Second Child Contract";
  }  
}