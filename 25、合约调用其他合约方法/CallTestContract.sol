// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract CallTestContract{

    function setX(TestContract _test,uint _x) external{
        _test.setX(_x);
    }

    function getX(address _test) external view returns(uint) {
        return TestContract(_test).getX();
    }

    function setXandReceiveEther(address _test,uint _x) external payable {
    	// 传递调用者发送的主币数量
        TestContract(_test).setXandReceiveEther{value: msg.value}(_x);
    }

    function getXandValue(address _test) external view returns(uint _x,uint _value){
        (_x,_value) = TestContract(_test).getXandValue();
    }

}

contract TestContract{
    uint public x;
    uint public value = 123;

    function setX(uint _x) external {
        x = _x;
    }

    function getX() external view returns(uint) {
        return x;
    }

    function setXandReceiveEther(uint _x) external payable{
        x = _x;
        // 发送主币数量
        value = msg.value;
    }

    function getXandValue() external view returns(uint _x,uint _value){
        (_x,_value) = (x,value);
    }
}