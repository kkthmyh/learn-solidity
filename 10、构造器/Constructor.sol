// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;
// 构造器，只在合约部署时执行一次
contract Constructor{

    address public owner;

    uint public x;

    constructor(uint _x){
        owner = msg.sender;
        x = _x;
    }

}