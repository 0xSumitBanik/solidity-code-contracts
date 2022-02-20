// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

// This example contract covers the concepts of:
/*
  - Enums, Structs
  - modifiers
  - Struct Arrays
  
*/
contract AssetTracking{

  address public owner;

  // Created enum for Order Status
  enum OrderStatus{
    Confirmed,
    Shipped,
    Delivered,
    Cancelled
  }

  constructor(){
    owner = msg.sender;
  }

  struct Asset{
    uint assetId;
    OrderStatus status;
  }

  Asset[] public assets;


  modifier onlyOwner(){
    // Check for the condition if owner is msg.sender
    require(owner == msg.sender,"Not an owner");
    _;
  }

  function setOrderStatus(uint _assetId,OrderStatus _status) external onlyOwner{
    // Add asset values to the assets array
      assets.push(
        Asset({
          assetId: _assetId,
          status: _status
        })
      );
  }

  function updateOrderStatus(uint _assetIndex,OrderStatus _status) external onlyOwner{
    // Update the status for the passed asset index 
    assets[_assetIndex].status = _status;
  }

  // Anyone can call this function as onlyOwner modifier is not used
  function getOrderStatus(uint _assetIndex) external view returns (OrderStatus){
    // Retrieves the status for the passed asset index 
    return assets[_assetIndex].status;
  }
}