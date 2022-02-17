// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract IterableMapping{
  mapping(address=>uint) public balances;
  mapping(address=>bool) public inserted;
  address[] public mappingKeys;

  function setValue(address _key, uint _balance) external{
    balances[_key]=_balance;

    if(!inserted[_key]){
      inserted[_key]=true;
      mappingKeys.push(_key);
    }
  }

  function getSize() external view returns (uint){
    return mappingKeys.length;
  }

  function getValue(uint _index) external view returns (uint){
    return balances[mappingKeys[_index]];
  }
}