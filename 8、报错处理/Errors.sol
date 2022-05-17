// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

// require 当表达式为true时,执行require后代码,否则输出定义的报错信息,返还gas并回滚状态
// revert  直接抛出错误和java中的throw语句类似,返还gas并回滚状态
// assert  断言
// 0.8版本以上的自定义error,可以节约gas fee

contract Errors{

    uint public num = 10;

    function testRequire(uint x) external view returns(uint){
        require(x > 10,"x<=10,please check!!!");
        return x;
    } 

    // 自定义异常
    
    error MyError(address add,uint x);

    function testRevert(uint x) external view returns(uint) {
        if (x <= 10) {
            revert("x<=10,please check!!!");
        }else if (x > 20) {
            revert MyError(msg.sender,x);
        }
        return x;
    }

    function testAssert(uint x) external view returns(uint){
        assert(x==num);
        return x;
    }

}
