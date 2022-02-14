// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract FunctionModifiers{

  bool public locked;
  uint8 public count;

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

}