// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract TestDelegateCall {

    uint public num;
    address public sender;
    uint public value;

    function setVar(uint _num) external payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}