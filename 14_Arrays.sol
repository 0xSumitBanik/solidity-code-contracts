// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract CaptureFunctionOutputs{
  /* Fixed Size Arrays */
  uint constant SIZE = 5;
  uint[SIZE] public x = [1, 2, 3, 4, 5];
  //             index:  0  1  2  3  4
  uint[SIZE] public y = [10, 20];
  //             index: [0    1]  2  3  4 -> these indexes are initialized with 0

  /* Dynamic Size Arrays */
  uint[] public d = [1,2];

  
}