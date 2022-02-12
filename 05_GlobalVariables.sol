// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract GlobalVariables{

    /* Global Variables:
      - Special variables exists in the global namespace.
      - Mainly used to provide information about the blockchain or are general-use utility functions.
     */

     function displayData() external view returns (uint,uint,address,uint,address){
       uint blockNumber = block.number;
       uint blockTimeStamp = block.timestamp;
       address sender = msg.sender;
       uint txGasPrice = tx.gasprice;
       address txSender = tx.origin;

       return (blockNumber,blockTimeStamp,sender,txGasPrice,txSender);
     }
  
    // Read More at: https://docs.soliditylang.org/en/latest/units-and-global-variables.html#block-and-transaction-properties
}