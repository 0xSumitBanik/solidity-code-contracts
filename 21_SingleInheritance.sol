// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract ParentContract{
  function displayName() external virtual pure returns (string memory){
      return "This is Parent Contract";
  }
}


contract ChildContract is ParentContract{
  function displayName() external virtual override pure returns (string memory){
      return "This is Child Contract";
  }
}