// SPDX-License-Identifier GPL-3.0
pragma solidity ^0.8.7;

contract EtherWallet{

    address payable public owner;

    constructor() {
       owner = payable(msg.sender);
    } 

    receive() external payable {}

    function withdraw(uint _amount) external {
        require(owner == msg.sender,not owner);
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns(uint) {
        return address(this).balance;
    }
}