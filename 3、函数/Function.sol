// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.7;

contract FunctionIntro{
	// external 外部调用
	// pure 纯函数 不可以对链上状态进行读取或修改
    function add(uint x,uint y) external pure returns(uint){
        return x + y;
    } 

    function sub(uint x,uint y) external pure returns(uint){
        return x - y;
    }

}