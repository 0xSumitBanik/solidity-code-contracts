// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract FirstParentContract{
  string public name;
  constructor(string memory _name){
      name = _name;
  }
}

contract SecondParentContract{
  uint128 public age;
  constructor(uint128 _age){
      age = _age;
  }
}
 
contract FirstChild is SecondParentContract,FirstParentContract{
  constructor(string memory _name,uint128 _age) SecondParentContract(_age) FirstParentContract(_name){

  }
}
