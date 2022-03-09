// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract BaseContract {
  function displayText(string calldata _text) external pure returns(string memory){
      return _text;
  }
}

contract CallingContract{
  // We need to pass the address of the another deployed contract
  function executeDisplayText(BaseContract _contractAddress,string calldata _text)
  external
  pure
  returns(string memory){
      return _contractAddress.displayText(_text);
  }
}
