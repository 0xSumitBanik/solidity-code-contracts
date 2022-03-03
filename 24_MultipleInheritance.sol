// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

/*
Multiple Inheritance:

In Multiple Inheritance, a single contract can be inherited from many contracts. 
A parent contract can have more than one child while a child contract can have more than one parent.
*/

contract FirstParentContract{
  // We add virtual keyword to indicate that this function can be overriden by the child contract
  function greeter() external virtual pure returns (string memory){
      return "Hello, I am First Parent Contract";
  }
}

contract SecondParentContract{
  event Logging(string message);
}
 
contract FirstChild is SecondParentContract{
  function displayHello() external returns(string memory){
    emit Logging("I am first child");
    return "Hello";
  }
}

contract SecondChild is SecondParentContract{
  string public childName; // stores the name
  constructor(){
    childName = "Second Child";
  }
}

// Note: The Inheritance Order must have the most base like contract name first
// followed by derived like.
// Here, the most base like is SPC (as it has no other inherited contracts)
// contract FirstGrandChild is SecondChild , SecondParentContract. (This will give error) ❌

contract FirstGrandChild is SecondParentContract,SecondChild{
  constructor(){
    childName = "First Grand Child";
  }

  function hello() external returns(string memory){
      emit Logging("I am first grand child");
      return "Hello";
  }
}


/* Note:

  1. Order of Inheritance
          FPC      SPC
                ↗   |  ↖
              FC   |   SC
                  FGC
    
    where FPC: First Parent Contract , and so on.
*/