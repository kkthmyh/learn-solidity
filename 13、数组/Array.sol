// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract Array{
    // 动态数组
    uint[] public nums = [1,2,3];
    // 定长数组
    uint[3] public numsFixed = [4,5,6];

    function examples() external {
        // 获取长度
        uint l = nums.length; // 3
        // 获取元素
        uint i = nums[1]; // 2
        // push 元素
        nums.push(4); // [1,2,3,4]
        // pop 元素
        nums.pop(); // [1,2,3]
        // 删除元素，被删除的元素被置为默认值
        delete nums[1]; // [1,0,2]


        // 创建内存数组 类似于java
        // 内存中不可创建动态数组，因此该数组不可以使用pop等改变数组长度的function
        uint [] memory nums2 = new uint[](2);
        
    }

    function test() external view returns(uint[] memory) {
        return nums;
    }

}