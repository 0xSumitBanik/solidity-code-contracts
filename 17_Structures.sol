// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract Structures{
  // Struct types are used to represent a record.
  struct Book{
    uint bookId;
    string name;
    string author;
  }
  Book public book; // book is the structure state variable name

  // How to set values for struct members (Using . operator)
  function setBookVariable() external{
    book.bookId  = 1;
    book.name    = "Solidity Doc";
    book.author  = "Dev XYZ";
  }

  // How to set values for struct members (Wrapping the values in struct() )
  function setBookVariable1() external{
    book = Book(1,"ABC","DEF"); // Option-1 (order of values must be same as defined in struct)
    book = Book({name:"ABC",bookId:1,author:"DEF"}); // Option-2 (specify key names to follow any order)
  }

}