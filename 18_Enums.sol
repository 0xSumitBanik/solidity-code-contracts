// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract Enums{
  // Enums restrict a variable to have one of only a few predefined values. 
  // The values in this enumerated list are called enums.

  // Enums require at least one member, and its default value when declared is the first member. 
  // Enums cannot have more than 256 members.

  enum Size{
    ExtraSmall,
    Small,
    Medium,
    Large,
    ExtraLarge
  }

  Size public size; // defaults value to 0
  // Find the smallest and largest value of Enum Size
  Size public smallestValue = type(Size).min; // 0
  Size public largestValue = type(Size).max; // 4

  function getValue() external view returns (Size){
    return size; // Will return the default value 0
  }

  function setCurrentValue(Size _s) external{
    size = _s; // Will set the value to the uint that is passed
  }
}