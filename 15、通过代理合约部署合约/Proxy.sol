// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;


contract TestContract1{

    address public owner = msg.sender;

    function setOwner(address addr) external{
        require(msg.sender == addr,"not owner");
        owner = addr;
    }

}

contract TestContract2{
    address public owner = msg.sender;
    uint public value = msg.value;
    uint public x;
    uint public y;

    constructor(uint _x,uint _y) payable{
        x = _x;
        y = _y;
    }

}


contract Proxy{

    fallback() external payable {}

    event Deploy(address);

    function deploy(bytes memory _code) external payable returns(address addr) {

        assembly{
        addr := create(callvalue(),add(_code,0x20),mload(_code))
        }
        require(addr != address(0),"deploy failed");
        emit Deploy(addr);
    }

    function execute(address _target,bytes memory _data) external payable{
        (bool success , ) = _target.call{value:msg.value}(_data);
        require(success,"failed");
    }

}

contract Helper{
    function getByteCode1() external pure returns(bytes  memory) {
        bytes memory bytecode = type(TestContract1).creationCode;
        return bytecode;
    }
    function getByteCode2(uint _x,uint _y) external pure returns (bytes memory) {
        bytes memory bytecode = type(TestContract2).creationCode;
        return abi.encodePacked(bytecode,abi.encode(_x,_y));
    }

     function getCallData(address _owner) external pure returns (bytes memory) {
        bytes memory bytecode = type(TestContract2).creationCode;
        return abi.encodeWithSignature("setOwner(address)",_owner);
    }

}