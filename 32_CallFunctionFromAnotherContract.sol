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

  function executeDisplayTextUsingCall(address _contractAddress, string calldata _text) external
  returns(bool,bytes memory){
    // It returns two output: 1. status of call method, 2. bytes output of abi.encodeWithSignature function (discussed in details later)
    (bool _status, bytes memory _output)= _contractAddress.call(abi.encodeWithSignature("displayText(string)",_text));
    return(_status,_output);
  }
}
