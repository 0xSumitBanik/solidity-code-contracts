// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract IterableMapping{
  // Mapping for storing the balances for specific address
  mapping(address=>uint) public balances;
  // Mapping to store and keep track of inserted addresses
  mapping(address=>bool) public inserted;
  // Dynamic Array to store the mapping keys (here: inserted addresses)
  address[] public mappingKeys;

  // Set the value for the inserted key and push it to the array of keys if reqd.
  function setValue(address _key, uint _balance) external{
    balances[_key]=_balance;

    if(!inserted[_key]){
      inserted[_key]=true;
      mappingKeys.push(_key);
    }
  }

  // Implemented the function of getting the mapping size
  function getSize() external view returns (uint){
    return mappingKeys.length;
  }

  // Get the value using the mappingKeys Array Index
  function getValue(uint _index) external view returns (uint){
    return balances[mappingKeys[_index]];
  }
}