// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;
// 函数修改器类似于抽取公共代码片段
contract FunctionModifier{

    uint public num = 10;

    // function test1() external {
    //     require(num<10,"num>=10 please check");
    // }

    // function test2() external {
    //     require(num<10,"num>=10 please check");
    // }

    // 对于上述的两个function 中的x<10 可以抽取成函数修改器

    modifier MyModifier(uint x) {
        require(x<10,"x>=10 please check");
        _;
    }

    function test1(uint x) external MyModifier(x){
      num += x;
    }

           
    function test2(uint x) external MyModifier(x){
        num += x;

    }
        
}
