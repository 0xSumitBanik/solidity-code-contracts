// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ABIFunctions {
  /*Note:

  ABI stands for application binary interface.

  - In general, an ABI is the interface between two program modules, one of which is often at 
    the level of machine code. The interface is the de facto method for encoding/decoding data 
    into/out of the machine code.

  - In Ethereum, it's basically how you can encode Solidity contract calls for the EVM and, 
    backwards, how to read the data out of transactions.

  */

  string public message;

  constructor(){
    message = "Hello Mom";
  }

  function displayHello() pure external returns (string memory){
    return "Hello";
  }

  function abiEncode() view public returns (bytes memory){
    // 0x0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000948656c6c6f204d6f6d0000000000000000000000000000000000000000000000
    // The first part contains the offset - 0x20 = 32 bytes (in decimal)
    // The second part contains the length of the string - 0x009 = 9
    // The 3rd part contains the encoded data
    return abi.encode(message);
  }

  function abiDecode() view external returns (bytes memory){
    return abi.decode(abiEncode(),(bytes));
  }

  function abiEncodePacked() view external returns (bytes memory){
    // It encodes the data and also compresses it
    return abi.encodePacked(message);
  }

  function abiEncodeWithSelector() pure external returns (bytes memory){
    return abi.encodeWithSelector(ABIFunctions.displayHello.selector);
  }

  function abiEncodeWithSignature() pure external returns (bytes memory){
    return abi.encodeWithSignature("setHello()");
  }
}
