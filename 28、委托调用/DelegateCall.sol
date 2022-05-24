// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;



contract DelegateCall {
    uint public num;
    address public sender;
    uint public value;

    function setVar_(address _test, uint _num) external payable {
        (bool success , bytes memory data) = _test.delegatecall(abi.encodeWithSelector(TestDelegateCall.setVar.selector, _num));
        require(success, "fail request");
    }
}

