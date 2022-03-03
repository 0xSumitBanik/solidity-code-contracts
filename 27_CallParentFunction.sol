// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract FirstParentContract{

 event Logging(string text);
 function displayTextABC() virtual public returns (string memory){
   return "Text: ABC - First Parent";
 }

  //  We can specify either public/internal (as external funcs. won;t be accesibled inside other contract in same file)
 function notOverridenFunction() internal{
   emit Logging("This output is from Not Overriden Function!");
 }
}

contract SecondParentContract is FirstParentContract{
 function displayTextABC() public virtual override returns (string memory){
   FirstParentContract.notOverridenFunction();
   return "Text: ABC - Second Parent";
 }
}
 
contract FirstChild is FirstParentContract,SecondParentContract{
 function displayTextABC() public override(SecondParentContract,FirstParentContract) returns (string memory){
    // If we use named function calling for a contract, it will only invoke for that specific contract.
    // If we use super, this will invoke all the functions of the inherited Contracts
    super.displayTextABC(); // This will first visit the SecondParentContract and then execute FirstParentContract function
    return "Text: ABC - First Child";
 }
}
