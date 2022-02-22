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

/* Response:  👇

  1. Without indexed

  [
	{
		"from": "0xA5aE14656C35Cf553cEaa9207f8507ce591fcb59",
		"topic": "0x36289191ddcef272abc241cb1d02d50f4798728220f4d63ae9f494ee511d8e5b",
		"event": "BroadcastMessageEvent",
		"args": {
			"0": "0x617F2E2fD72FD9D5503197092aC168c91465E7f2",
			"1": "0x617F2E2fD72FD9D5503197092aC168c91465E7f2",
			"2": "Hello",
			"brodcaster": "0x617F2E2fD72FD9D5503197092aC168c91465E7f2",
			"receiver": "0x617F2E2fD72FD9D5503197092aC168c91465E7f2",
			"message": "Hello"
		}
	}
]

  Execution Cost: 25300 gas

  2. With indexed

  [
	{
		"from": "0xD560Bf5335BFa59bD55a2A5A5192F2cB4f421D85",
		"topic": "0x36289191ddcef272abc241cb1d02d50f4798728220f4d63ae9f494ee511d8e5b",
		"event": "BroadcastMessageEvent",
		"args": {
			"0": "0x617F2E2fD72FD9D5503197092aC168c91465E7f2",
			"1": "0x617F2E2fD72FD9D5503197092aC168c91465E7f2",
			"2": {
				"_isIndexed": true,
				"hash": "0x06b3dfaec148fb1bb2b066f10ec285e7c9bf402ab32aa78a5d38e34566810cd2"
			}
		}
	}
]

  Execution Cost: 24813 gas

  3. Anonymous event

  [
    {
      "from": "0x47CdBcb5A929Fb90b980a6565c0588E7816fF463",
      "data": "0x",
      "topics": [
        "0x000000000000000000000000617f2e2fd72fd9d5503197092ac168c91465e7f2",
        "0x000000000000000000000000617f2e2fd72fd9d5503197092ac168c91465e7f2",
        "0x1c8aff950685c2ed4bc3174f3472287b56d9517b9c948127319a09a7a36deac8"
      ]
	  }
  ]

  Execution Cost: 24435 gas

*/