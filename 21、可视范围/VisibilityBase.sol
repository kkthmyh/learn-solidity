// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

// private 只在合约内部
// internal 只在合约内部和继承
// public 内外都可见
// external 外部可见
contract VisibilityBase {
    uint private x = 0;
    uint internal y = 1;
    uint public z = 2;

    function privateFunc() private pure {

    }

    function internalFunc() internal pure {

    }

    function publicFunc() public pure {

    }

    function externalFunc() external pure {

    }

}
