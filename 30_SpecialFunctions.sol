// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract SpecialFunctions{

  /* Solidity has mainly two special functions:
     1. Receive Function
        - The receive function is executed on a call to the contract with "empty calldata".
        - This function cannot have arguments, cannot return anything.
        - It can be virtual, can override and can have modifiers.

        In the worst case, the receive function can only rely on 2300 gas being available (for example when send or transfer is used), leaving little room to perform other operations except basic logging. The following operations will consume more gas than the 2300 gas stipend:

        -  Writing to storage
        -  Creating a contract
        -  Calling an external function which consumes a large amount of gas
        -  Sending Ether

     2. Fallback Function
        - The fallback function is executed on a call to the contract if none of the other functions match the given function signature
        - It is declared using either fallback () external [payable] or
          fallback (bytes calldata _input) external [payable] returns (bytes memory _output)
        - It can be virtual, can override and can have modifiers.

    Which function is called, fallback() or receive()?

           send ETH
               ⬇
         Is msg.data empty?
              ↙         ↘
            yes          no
            ↙             ↘
      receive() exists?   fallback()
         ↙   ↘
        yes   no
        ↙      ↘
    receive()   fallback()
  */

  // It will emit the functionName, calling address and complete calldata (which should have hexadecimal value)
  // The calldata should be a valid hexadecimal value with size of at least one byte.
  event Logging(string functionName,address sender,uint value,bytes data);

  receive() external payable{
    emit Logging("Inside receive()",msg.sender,msg.value,""); // msg.data = "" as receive function will not execute if msg.data is present.
  }

  fallback(bytes calldata _input) external payable returns(bytes memory){
    emit Logging("Inside fallback()",msg.sender,msg.value,msg.data);
    return _input;
  }
} 