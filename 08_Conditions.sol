// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract Conditions{
    // Write a function that will only check for even numbers.
    function checkEven(uint number) external pure returns (bool){
        bool result;
        // if construct 👇
        if(number%2==0){
          result = true;
        }
        return result;
    }

    function checkEvenTernary(uint number) external pure returns (bool){
        bool result;
        // if construct 👇
        result = number%2 == 0 ? true: false;
        return result;
    }
}