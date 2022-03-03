// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract StateMutabilityFunctions{

  /* View Functions:-
    - Functions can be declared "view" in which case they promise not to modify the state.
    - The following statements are considered modifying the state:
      * Writing to state variables.
      * Emitting events.
      * Creating other contracts.
      * Using selfdestruct.
      * Sending Ether via calls.
      * Calling any function not marked view or pure.
      * Using low-level calls.
      * Using inline assembly that contains certain opcodes.
  */

    uint count = 123;
    function viewFunction() external view returns (uint){
      return count; // Read only function dealing with a state variable
    }

  /* Pure Functions:-
    - Read Only function that does not involves state variables.
    - It should be possible to evaluate a pure function at compile-time given only its inputs and msg.data, 
      but without any knowledge of the current blockchain state.
    - In addition to the list of state modifying statements explained above, the following are considered reading from the state:
      * Reading from state variables.
      * Accessing address(this).balance or <address>.balance.
      * Accessing any of the members of block, tx, msg (with the exception of msg.sig and msg.data).
      * Calling any function not marked pure.
      * Using inline assembly that contains certain opcodes.
  */

    function pureFunction() external pure returns (uint){
      uint a = 1;
      a+=10;
      return a;
    }


    // 'Function Visibility specifiers'
    // These can be placed where 'view' is, including:
    // public - visible externally and internally
    // external - only visible externally (including a call made with this.)
    // private - only visible in the current contract
    // internal - only visible in current contract, and those deriving from it.
}