// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract Storage{
  string public data;

  function setData(string calldata _data) external {
    // If data location are used in function inputs. 👇
    // Memory : 89874 gas
    // Calldata : 72286 gas
    data = _data;
  }

  function getData() external view returns (string memory){
    return data;
  }
}