// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract AssetTracking{

  enum OrderStatus{
    Confirmed,
    Shipped,
    Delivered,
    Cancelled
  }

  struct Asset{
    uint assetId;
    OrderStatus status;
  }

  Asset[] public assets;

  function setOrderStatus(uint _assetId,OrderStatus _status) external{
      assets.push(
        Asset({
          assetId:_assetId,
          status:_status
        })
      );
  }



}