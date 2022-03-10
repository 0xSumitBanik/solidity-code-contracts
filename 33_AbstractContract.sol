// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

// When one of the function body is not defined, that contract becomes the abstract contract.
// We cannot deploy abstract contracts.

abstract contract AbstractContract{
  // Functions without implementation must be marked virtual.
  function displayText(string calldata _text) virtual external returns(string memory);
}    

// To use the unimplemented function, we need to inherit the abstract contract.
contract DisplayContract is AbstractContract{
  function displayText(string calldata _text) pure override external
  returns(string memory){
    return _text;
  }

}