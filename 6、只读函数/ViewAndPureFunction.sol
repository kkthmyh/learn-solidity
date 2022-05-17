// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.7;

contract ViewAndPureFunction{

    uint public num;
    // view 可以读取链上数据
    function viewFunc() external view returns(uint) {
        return num;
    }
}