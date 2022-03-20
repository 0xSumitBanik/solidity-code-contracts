// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract ErrorHandling{
    /* 
      Solidity uses state-reverting exceptions to handle errors. 
      Such an exception undoes all changes made to the state in the current call
      (and all its sub-calls) and flags an error to the caller.
    */

    function testAssert(uint _num) external pure {
      // The assert function creates an error of type Panic(uint256).
      assert(_num==10); // Checks if number is equals 10

      /* Note:
         - Assert should only be used to test for internal errors, and to check invariants.
         - Properly functioning code should never create a Panic.
         More: https://docs.soliditylang.org/en/latest/control-structures.html#panic-via-assert-and-error-via-require
      */

      /* Use assert() to:
        - Check for overflow/underflow
        - Check Invariants (a logical assertion that is always held to be true during a certain phase of execution).
        - Validate state after making changes
        - Prevent conditions which should never, ever be possible
        - Generally, you will probably use assert less often
        - Generally, it will be used towards the end of a function.
      */
    }

    function testRequire(uint _num) external pure {
      require(_num < 100 && _num >=0,"true");

      /* Note:
         - The require function should be used to ensure valid conditions, 
           such as inputs, or contract state variables are met, or to validate return values from calls to external contracts. 
         - If used properly, analysis tools can evaluate your contract to identify the conditions and function calls which will reach a failing assert.
         - Properly functioning code should never reach a failing assert statement; if this happens there is a bug in your contract which you should fix.
      */

      /* Use require() to:
        - Validate user inputs ie. require(input<20);
        - Validate the response from an external contract
        - Validate state conditions prior to execution.
        - Generally, you should use require most often
        - Generally, it will be used towards the beginning of a function
      */
    }

    uint8 count = 100;
    error UnAllowedNumbers(string errorMessage);
    function testRevert(uint _num) external{

      if(_num == 0){
        revert UnAllowedNumbers("Zero not allowed");
      }

      if(_num<100){
        revert("Two Digit Number not allowed");
      }

      count+=1;
      if(count>100){
        revert(); // This will also revert the changes that has been done in the count state variable.
      }
    }
}