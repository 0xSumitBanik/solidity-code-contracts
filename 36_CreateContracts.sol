// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EV {
    address public owner;
    string public model;
    uint public yearOfManufacture;

    constructor(address _owner, string memory _model,uint _yearOfManufacture) payable {
        owner = _owner;
        model = _model;
        yearOfManufacture = _yearOfManufacture;
    }
}

contract CreateEV{
    // Contract Array to store the addressed of newly deployed EV contract
    EV[] public evs;

    function create(address _owner,string calldata _model,uint _yearOfManufacture) external{
        // This will create a new instance of EV contract and "ev" variable will have the new contract address
        EV ev = new EV(_owner,_model,_yearOfManufacture);
        evs.push(ev);
    }

    function create2(address _owner,string calldata _model,uint _yearOfManufacture) external{
        // This will create a new instance of EV contract and "ev" variable will have the new contract address
        EV ev = new EV{salt:keccak256(abi.encode(block.timestamp))}(_owner,_model,_yearOfManufacture);
        evs.push(ev);
    }

    function createWithETH(address _owner,string calldata _model,uint _yearOfManufacture) external payable{
        // This EV contract will only be created if we send 111wei along with the transaction.
        EV ev = new EV{value:111}(_owner,_model,_yearOfManufacture);
        evs.push(ev);
    }
}