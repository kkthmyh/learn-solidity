// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract Event{

    event Log(string message,uint x);
    // 使用indexed标记，可以被区块链索引，借助web3或者ethers sdk可以查询
    event Log(address indexed addr,string message,uint x);

    function example() external{
        emit Log("this is a event",123);
        emit Log(msg.sender,"this is a indexed msg",123);
    }
}