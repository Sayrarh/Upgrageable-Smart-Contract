//SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;
import "./Proxiable.sol";

contract ImplementationB is Proxiable {

    address public owner;
    uint public count;

    function initialize() public {
        require(owner == address(0), "Already initalized"); //checks to see if the owner has triggered the function before
        owner = msg.sender;
    }

    function encode() public pure returns(bytes memory){
        return abi.encodeWithSignature("initialize()");
    }

    function increment() public {
        //require(msg.sender == owner, "Only the owner can increment");
        count++;
    }

    function decrement() public {
        count--;
    }

    function updateCode(address newCode) onlyOwner public {
        updateCodeAddress(newCode);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner is allowed to perform this action");
        _;
    }

}


