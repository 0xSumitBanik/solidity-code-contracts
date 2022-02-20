// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

// This example contract covers the concepts of:
/*
  - Data Locations
  - memory, calldata
*/
contract Storage{
  string public data;

  function setData(string calldata _data) external {
    // If data location are used in function inputs. 👇
    // Memory : 89874 gas
    // Calldata : 72286 gas
    data = _data;
  }


  // The compiler automatically creates getter functions for all public state variables.
  // This is just to demonstrate the getter method having memory data location.
  function getData() external view returns (string memory){
    return data;
  }
}