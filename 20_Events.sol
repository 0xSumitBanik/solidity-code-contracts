// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

/*
  Note: 
  - Solidity events give an abstraction on top of the EVM’s logging functionality. 
  - Applications can subscribe and listen to these events through the RPC interface of an Ethereum client.
*/
contract Events{
  // indexed is used to filter events by parameter.
  // Up to three paramters can be indexed.
  // It adds them to a special data structure known as “topics” instead of the data part of the log.

  event BroadcastMessageEvent(address indexed brodcaster, address indexed receiver,string indexed message);
  
  // We can declare the event as anonymous by adding the keyword anonymous after the Event() 
  // event BroadcastMessageEvent(address indexed brodcaster, address indexed receiver,string indexed message) anonymous;

  // We are writing to the blockchain by logging the data that makes it a transactional function rather than view/pure.
  function sendMessage(address _receiver, string calldata _message) external{
      emit BroadcastMessageEvent(msg.sender, _receiver, _message);
  }
}