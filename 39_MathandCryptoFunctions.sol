// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0; 

contract MathAndCryptoFunctions{

    bytes public message = abi.encode("Hello Mom");

    function computeKeccakHash() view external returns (bytes32){
      return keccak256(message);
    }

    function computeSha256Hash() view external returns (bytes32){
      return sha256(message);
    }

    function computeRipemd160() view external returns (bytes20){
      return ripemd160(message);
    }    

    function useAddMod(uint x,uint y,uint k) pure external returns(uint){
      return addmod(x, y, k); // (x+y)%k
    }

    function useMulMod(uint x,uint y,uint k) pure external returns(uint){
      return mulmod(x, y, k); // (x*y)%k
    }    
}