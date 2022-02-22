// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract FunctionsIntro{

    /* Note: All of the function visibility topics will be discussed later. */
    // Addition
    function add(uint x , uint y) external pure returns (uint){
      return x+y;
    }

    // Subtraction
    function sub(uint x , uint y) external pure returns (uint){
      return x-y;
    }
   
    // Multiplication
    function mul(uint x , uint y) external pure returns (uint){
      return x*y;
    }
    
    // Division
    function div(uint x , uint y) external pure returns (uint){
      return x/y;
    }

    // Modulo
    function mod(uint x , uint y) external pure returns (uint){
      return x%y;
    }

    // Exponentiation
    function exponentiation(uint x , uint y) external pure returns (uint){
      return x**y;
    }

    // This is function overloading; as we have same name function but diff. parameters
    function add(uint x , uint y, uint z) external pure returns (uint){
      return x+y+z;
    }

}