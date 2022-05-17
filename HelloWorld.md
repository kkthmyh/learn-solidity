#  1 Hello World

##  1.1 代码分析

```solidity
// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.7;

contract HelloSolidity{

    string public myString = "hello solidity";
}
```

可以使用>、<、^指定编译器版本号

#  2 值和类型

##  2.1 代码分析

```solidity
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
```

#  3 函数

##  3.1 代码分析

```solidity
// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.7;

contract FunctionIntro{
	// external 外部调用
	// pure 纯函数 不可以对链上状态进行读取或修改
    function add(uint x,uint y) external pure returns(uint){
        return x + y;
    } 

    function sub(uint x,uint y) external pure returns(uint){
        return x - y;
    }

}
```

#  4 状态变量

##  4.1 代码分析

```solidity
// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.7;

contract StateVariables{
	// 状态变量定义后即保存在链上
    uint public myUint = 123;
	
    function foo() external{
    	// 非状态变量之内方法调用时候产生
        uint notStateVar = 456;
    }

}
```

#  5 全局变量

##  5.2 代码分析

```solidity
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
```

#  6 只读函数

##  6.1 代码分析

```solidity
// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.7;

contract ViewAndPureFunction{

    uint public num;
    // view 可以读取链上数据
    function viewFunc() external view returns(uint) {
        return num;
    }
}
```

#  7 常量

##  7.1 代码分析

```solidity
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract Constants{

    address public constant MY_ADDRESS = 0x811A7FcF536550541Fd7A6867F716BeAfbB1Ed16;

    uint public MY_UINT = 123;

}

```



#  8 报错控制

##  8.1 代码分析

```solidity
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

// require 当表达式为true时,执行require后代码,否则输出定义的报错信息,返还gas并回滚状态
// revert  直接抛出错误和java中的throw语句类似,返还gas并回滚状态
// assert  断言
// 0.8版本以上的自定义error,可以节约gas fee

contract Errors{

    uint public num = 10;

    function testRequire(uint x) external view returns(uint){
        require(x > 10,"x<=10,please check!!!");
        return x;
    } 

    // 自定义异常
    
    error MyError(address add,uint x);

    function testRevert(uint x) external view returns(uint) {
        if (x <= 10) {
            revert("x<=10,please check!!!");
        }else if (x > 20) {
            revert MyError(msg.sender,x);
        }
        return x;
    }

    function testAssert(uint x) external view returns(uint){
        assert(x==num);
        return x;
    }

}

```



#  9 函数修改器

##  9.1 代码分析

```solidity
```



#  10 

##  
