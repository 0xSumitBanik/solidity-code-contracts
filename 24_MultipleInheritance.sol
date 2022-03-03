// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

/*
Multiple Inheritance:

In Multiple Inheritance, a single contract can be inherited from many contracts. 
A parent contract can have more than one child while a child contract can have more than one parent.
*/

contract FirstParentContract{
  // We add virtual keyword to indicate that this function can be overriden by the child contract
  function displayName() external virtual pure returns (string memory){
      return "This is First Parent Contract";
  }
}

contract SecondParentContract{

}
 
