// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract Payable{
	// payable 修饰表示可以发送ETH主币
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }
	// 合约可以接受ETH主币
    function send() external payable{

    }

    function getBalance() external view returns(uint) {
        return address(this).balance;
    }
}