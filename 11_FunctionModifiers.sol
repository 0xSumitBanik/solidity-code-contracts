// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract FunctionModifiers{

  bool public locked;
  uint public count;

  function enableLocked(bool _locked) external{
    locked = _locked;
  }

  // Function Modifiers are used to modify the behaviour of a function. 
  // For example to add a prerequisite to a function.
  modifier LockEnabled() {
    require(!locked,"Locked");
    // The function body is inserted where the special symbol "_;" 
    // appears in the definition of a modifier. 
    // So if condition of modifier is satisfied while calling this function, the function is executed and otherwise, an exception is thrown.
    _;
  }

  function increment() external{
    require(!locked,"Locked");
    count+=1;
  }

  function decrement() external{
    require(!locked,"Locked"); // The Same require statement is used
    // which is redundant , it can be condensed into a modifier.
    count-=1;
  }

  function incrementWithModifier() external LockEnabled{
    count+=1;
  }

  function decrementWithModifier() external LockEnabled{
    count-=1;
  }

  //modifier with input parameter
  modifier checkThreshold(uint _num){
    // The number cannot be greater than 1000 as an increment value.
    require(_num<=1000,"Greater than 1000");
    _;
  }

  function incrementInThreshold(uint _num) external LockEnabled checkThreshold(_num){
    count+=_num;
  }

  modifier runFurtherCode(){
    // First it will increment the count by 10
    count+=10;
    // Return to the function caller
    _;
    // Increment the overall value by 20
    count+=20;
  }

  function runningFurtherCode() external runFurtherCode{
    count+=100;
  }
}