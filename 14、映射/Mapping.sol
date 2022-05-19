
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;
// 类似于java中的HashMap k-v键值对
contract Mapping {
    // 定义简单映射
    mapping(address => uint) public balances;
    // 定义嵌套映射
    mapping(address => mapping(address => bool)) public isFriend;

    function examples() external {
        // 映射赋值
        balances[msg.sender] = 123;
        // 获取映射的值
        uint bal = balances[msg.sender];
        uint bal2 = balances[address(1)];
        // 删除映射
        delete balances[msg.sender];
        // 嵌套映射的定义
        isFriend[msg.sender][address(this)] = true;

    }

}   