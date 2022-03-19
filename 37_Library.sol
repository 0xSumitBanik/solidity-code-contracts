// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 


/* Note:
  - Libraries are similar to contracts, but their purpose is that they are deployed only once 
    at a specific address and their code is reused using the DELEGATECALL.
  - This means that if library functions are called, their code is executed in the context of the calling contract.

  In comparison to contracts, libraries are restricted in the following ways:

  - they cannot have state variables
  - they cannot have constructor.
  - they cannot inherit nor be inherited
  - they cannot receive Ether
  - they cannot be destroyed
  - it cannot be abstract unlike contracts.
*/

library Math{
  function max(uint a,uint b) internal pure returns(uint){
    return a>=b?a:b;
  }

  function min(uint a,uint b) internal pure returns(uint){
    return a<=b?a:b;
  }
}


contract PerformMathOperations{

  address public mathLibraryAddress = address(Math);

  function findMax(uint a,uint b) external pure returns(uint){
    return Math.max(a, b);
  }

  // Following is the "using for" directive.
  using Math for uint;
  function findMin(uint a,uint b) external pure returns(uint){
    // These functions will receive the object they are called on as their first parameter (like the self variable in Python).
    return a.min(b);
  }  
}
