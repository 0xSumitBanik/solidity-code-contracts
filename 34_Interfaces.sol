// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

// We will be implementing the Storage.sol contract (./examples/Storage.sol)
interface IStorage{  
    function getData() external view returns(string memory);
    function setData(string calldata _data) external;

  /* Note:
  Interfaces are similar to abstract contracts, but they cannot have any functions implemented. There are further restrictions:

  They cannot inherit from other contracts, but they can inherit from other interfaces.

    - All declared functions must be external.
    - They cannot declare a constructor.
    - They cannot declare state variables.
    - They cannot declare modifiers.
  */
}

contract TestInterface{
  // pass the address of the other deployed contract as an argument
  function implementgetData(address _storage) view external returns(string memory){
    return IStorage(_storage).getData();
  } 

  function implementSetData(address _storage,string calldata _data) external{
    return IStorage(_storage).setData(_data);
  }
}