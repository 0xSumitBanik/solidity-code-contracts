// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract DataLocation{
  /* Data Locations:
    When we use a Reference data type, we also need to specify the data location. 👇
                ( ☝ structs, arrays and mapping )
      - storage : Location type for storing state variables which means data will be persisted.
      - memory :  To hold the value onto memory.
      - calldata : Similiar to memory but this can only be used with function inputs.
  */

  struct Asset{
    uint assetId;
    string name; 
  }

  Asset public asset; // Stored in the storage

  function operation() external returns (Asset memory){
  // Asset is a struct that's why we are using memory ☝
     asset.assetId=1;
     asset.name="ETH Documentation";

     return asset;
  }

  function len(uint[] calldata _num) external pure returns (uint){
    uint lenArray = _num.length;
    return lenArray;
  }

}