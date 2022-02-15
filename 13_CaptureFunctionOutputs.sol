// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract CaptureFunctionOutputs{
  function multipleOutputs() public pure returns (uint,address){
    return (0,address(0));
  }

  function namedOutputs() public pure returns (uint num, address addr){
    num = 0;
    addr = address(0);
    // No need of return statement while assigning named outputs.
  }

  function captureOutputs() public pure {
    (uint x,address a) = multipleOutputs();
    (uint xnum, address addr) = namedOutputs();
  }
}