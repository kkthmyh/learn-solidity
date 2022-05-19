// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

//    x
//   / \
//  y   |
//   \ /
//    z
//  上述是一个多线继承的场景，z继承x也继承y，在写合约时继承关系为x y z

contract X {

    function foo() external pure virtual returns(string memory){
        return "X";
    }

    function bal() external pure virtual returns(string memory){
        return "X";
    }

    function x() external pure returns(string memory){
        return "X";
    }

}


contract Y is X{

    function foo() external pure virtual override returns(string memory){
        return "Y";
    }

    function bal() external pure virtual override returns(string memory){
        return "Y";
    }

    function y() external pure returns(string memory){
        return "Y";
    }
}


contract Z is X,Y{

    function foo() external pure virtual override(X,Y) returns(string memory){
        return "Z";
    }

    function bal() external pure virtual override(X,Y) returns(string memory){
        return "Z";
    }

}

