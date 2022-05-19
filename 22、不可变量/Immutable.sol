// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract Immutable{
    // immutable修饰的状态变量必须赋初始值
    address public immutable owner = msg.sender;

    uint public x;

    function foo() external{
        require(msg.sender == owner,"not owner");
        x += 1;
    }
}