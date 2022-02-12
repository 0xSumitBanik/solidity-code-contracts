// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

/* Solidity is a statically typed language, which means that the type of each variable (state and local) needs to be specified. 
Solidity provides several elementary types which can be combined to form complex types. */

contract ValueTypes{
    // These types are called value types because variables of these types will always be passed by value.
    
    // If we don't mention any values for a variable then the false value is initialized.
    bool b = true; // Boolean
    uint i = 10; // Unsigned Integers only store positive integers
    int j = -10; // Signed Integers can store both positive and negative int.
    uint uintMaxSize = type(uint).max; // uintMaxSize stores the maximum value of uint type
    uint uintMinSize = type(uint).min; // uintMinSize stores the minimum value of uint type

    address addr = 0x1CBc4e06ECa8B19c5D362129167965D32FB15425; // Holds a 20 byte value 
    address payable payableAddr = payable(0x1CBc4e06ECa8B19c5D362129167965D32FB15425); // payable has additional members (transfer and send)
    /* Note: Implicit conversions from address payable to address are allowed, 
    whereas conversions from address to address payable must be explicit via payable(<address>).  */
}