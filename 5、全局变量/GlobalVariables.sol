// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.7;

contract GlobalVariables{
	// view 关键字可以读取链上状态不可修改链上状态
    function globalVar() external view returns(address,uint,uint) {
		// 全局变量
		// 地址类型
        address sender = msg.sender;
        // 出块时间
        uint time = block.timestamp;
        // 区块高度
        uint num = block.number;

        return (sender,time,num);
    }

}