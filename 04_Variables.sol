// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract Variables{

  /* State variables:-
    - The values are permanently stored in a contract storage.
    - These variables exists inside a contract and outside a function.
  */
  uint count = 1234; // State Variable

  function execute() external pure returns (uint,bool){
    //Pure means that the function effectively runs in isolation and only operates on the variables that have been passed to it.
    
    /* Local Variables:-
       - Only Scoped inside a function.
       - Doesn't persist the value after the function call ends.
    */
    
    uint value = 1; // Local variables
    bool flag = true; // Local variables

    return (value,flag);
  }
}