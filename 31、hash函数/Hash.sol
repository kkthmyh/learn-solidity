// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract Hash{
    // keccak256是solidity内置的hash算法
    // encodePacked不会补零，可能导致hash碰撞
    function testHash1(string memory _text,uint _x,address _address) external pure returns(bytes32) {
       return keccak256(abi.encodePacked(_text,_x,_address));
    }
     // encodePacked会补零，不会导致hash碰撞，推荐此打包方式
    function testHash2(string memory _text,uint _x,address _address) external pure returns(bytes32) {
       return keccak256(abi.encode(_text,_x,_address));
    }
}