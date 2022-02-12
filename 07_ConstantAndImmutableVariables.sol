// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract ConstantAndImmutable{
   // State variables can be declared as: constant or immutable.
   // Constants and Immutables costs lesser gas as compared to other variables.
   // For constant variables, the value has to be fixed at compile-time, 
   // while for immutable, it can still be assigned at construction time. (inside constructor or declare at once).

   uint constant COUNT = 123; // This variable cannot be re-initialized.
   function InvalidOperation() external{
      // COUNT  = 456; 👈 This will cause an error.
   }

   uint immutable IMMUT = 0;
   constructor (uint _IMMUT) {
        // IMMUT = _IMMUT; 👈 This is not allowed as IMMUT is already assigned a value.
   }

  //  This will work 👇
  /*
   uint immutable NOCHANGE;
   constructor (uint _NOCHANGE){
     NOCHANGE = _NOCHANGE;
   }
  */

}