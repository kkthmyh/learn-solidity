// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;
// 智能合约中数据的存储位置有 storage memory calldata 
// storage => 存储在链上可以改变状态变量的值
// memory => 存储在内存中方法调用完成即销毁，不能改变状态变量的值
// calldata => 和memory类似，但是只能定义在函数的输入参数中
contract DataLocations{

    struct Mystruct{
        uint foo;
        string text; 
    }

    mapping(address => Mystruct) public myStructs;

    function emamples() external {
        myStructs[msg.sender] = Mystruct(123,"foo");
        Mystruct storage my = myStructs[msg.sender];
        my.text = "java";

    }

}