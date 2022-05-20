// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

interface ICounter{
    function count() external returns(uint);

    function inc() external;

    function dec() external;
}

contract CallInterfaceContract{

    uint public count;

    function callInterface(address _contract) external {
        ICounter(_contract).inc();
        count = ICounter(_contract).count();
    }

}