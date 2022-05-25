// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

// 返回两数最大值

library Math {
    function max(uint x,uint y) internal returns(uint) {
        return x >= y?x : y;
    }
}

contract TestLib {

    function getMax(uint x,uint y) external returns(uint){
        return Math.max(x,y);
    }
        
}
