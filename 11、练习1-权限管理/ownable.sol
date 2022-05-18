// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract Ownable {

    address public owner;
	// 构造器
    constructor(){
        owner = msg.sender;
    }

	// 代码修改器
    modifier OnlyOwner() {
        require(msg.sender == owner,"Only owner can call");
        _;
    }

	// 权限转移
    function setOwner(address _addr) external OnlyOwner{
        owner = _addr;
    }

    function anyOneCanCall() external{
        //code
    }

    function onlyOwnerCanCall() external OnlyOwner {
        //code
    }
        
}