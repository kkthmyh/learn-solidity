// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.7;

contract StateVariables{
	// 状态变量定义后即保存在链上
    uint public myUint = 123;
	
    function foo() external{
    	// 非状态变量之内方法调用时候产生
        uint notStateVar = 456;
    }

}