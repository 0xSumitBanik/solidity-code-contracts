// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract Arrays{
  /* Fixed Size Arrays */
  uint constant SIZE = 5;
  uint[SIZE] public x = [1, 2, 3, 4, 5];
  //             index:  0  1  2  3  4
  uint[SIZE] public y = [10, 20];
  //             index: [0    1]  2  3  4 -> these indexes are initialized with 0

  /* Dynamic Size Arrays */
  uint[] public d = [1,2];

  function arrayOperations() external {
    // Adding elements to the array
    d.push(); // This will push an empty element (here: uint 0)
    // 👆 Output:  [1,2,0]
    
    d.push(100); // Overriding the default value to be pushed
    // 👆 Output:  [1,2,0,100]
    
    // Delete elements from array
    delete d[0]; // This will set the value of the first element to false value (0)
    // 👆 Output:  [2,0,100]
    // Remove last element from array
    d.pop(); // Implicitly calls the delete on removed element
    // 👆 Output:  [2,0]

    /* Note:
        - Increasing the length of a storage array by calling push() has constant gas costs because storage is zero-initialised.
        - While decreasing the length gas cost depends upon the size.
           - if it's an array getting deleted, Gas Cost will be high. 
    */

  }
  
}