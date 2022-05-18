// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract FunctionOutputs{
    // 可以return多个参数
    function returnMany() public pure returns(uint,bool){
        return (1,false);
    }
    // 对return的参数进行命名
    function named() public returns(uint x,bool b) {
        return (1,false);
    }

    // 隐式返回
    function assigned() public pure returns(uint x,bool b) {
        x = 1;
        b = false;
    }

    function test() public pure{
        // 接收返回值
    //    (uint x , bool b) =  returnMany();
       // 接收部分返回值，可以节约gas
       (, bool b) = returnMany();
    }

}

