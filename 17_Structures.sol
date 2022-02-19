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
  Book[] public books; // Array of struct

  // How to set values for struct members (Using . operator)
  function setBookVariable() external{
    book.bookId  = 1;
    book.name    = "Solidity Doc";
    book.author  = "Dev XYZ";
  }

  // How to set values for struct members (Wrapping the values in struct() )
  function setBookVariable1() external {
    book = Book(1,"ABC","DEF"); // Option-1 (order of values must be same as defined in struct)
    book = Book({name:"ABfC",bookId:1,author:"DEF"}); // Option-2 (specify key names to follow any order)
  }

  function structMemoryVars() external{
    // 
    Book memory b1 = Book(10,"XYZ-1","xyz-1");
    Book memory b2 = Book(100,"XYZ-2","xyz-2");
    Book memory b3 = Book(200,"XYZ-3","xyz-3");

    // Push the structure memory variable to the Books[]
    books.push(b1);
    books.push(b2);
    books.push(b3);

    Book memory _booksArray = books[0];
    _booksArray.bookId=999; // This will not update as it's a memory type (will clear the updation after function scope)

    Book storage _booksArrayStore = books[0];
    _booksArrayStore.bookId=999; // This will update as it's a storage type

    // More on Storage, Memory to be discussed in later section

    delete books[2]; // This will reset the structure member values to false values
  }
}