// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.7;

contract ValueTypes{
    
    bool public b = true;
    uint public u = 123; // 0-2^256-1
    int public i = -1;   //-2^255 to 2^255-1
    int public minInt = type(int).min;
    int public maxInt = type(int).max;

    //地址类型
    address public addr = 0x811A7FcF536550541Fd7A6867F716BeAfbB1Ed16;


}