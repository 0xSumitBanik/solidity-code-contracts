// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

/*
  Note: 
  - Solidity events give an abstraction on top of the EVM’s logging functionality. 
  - Applications can subscribe and listen to these events through the RPC interface of an Ethereum client.
*/
contract Events{
  event BroadcastMessageEvent(address indexed brodcaster, address indexed receiver,string indexed message);

  function sendMessage(address _receiver, string calldata _message) external{
      emit BroadcastMessageEvent(msg.sender, _receiver, _message);
  }
}