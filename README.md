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
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;
// 函数修改器类似于抽取公共代码片段
contract FunctionModifier{

    uint public num = 10;

    // function test1() external {
    //     require(num<10,"num>=10 please check");
    // }

    // function test2() external {
    //     require(num<10,"num>=10 please check");
    // }

    // 对于上述的两个function 中的x<10 可以抽取成函数修改器

    modifier MyModifier(uint x) {
        require(x<10,"x>=10 please check");
        _;
    }

    function test1(uint x) external MyModifier(x){
      num += x;
    }

           
    function test2(uint x) external MyModifier(x){
        num += x;

    }
        
}

```

#  10 构造函数

##  10.1 代码分析

```solidity

// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;
// 构造器，只在合约部署时执行一次
contract Constructor{

    address public owner;

    uint public x;

    constructor(uint _x){
        owner = msg.sender;
        x = _x;
    }

}


```

#  11 练习1 权限管理合约

##  11.1 代码分析

```solidity
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract Ownable {

    address public owner;
	// 构造器
    constructor(){
        owner = msg.sender;
    }

	// 代码修改器
    modifier OnlyOwner() {
        require(msg.sender == owner,"Only owner can call");
        _;
    }

	// 权限转移
    function setOwner(address _addr) external OnlyOwner{
        owner = _addr;
    }

    function anyOneCanCall() external{
        //code
    }

    function onlyOwnerCanCall() external OnlyOwner {
        //code
    }
        
}
```

#  12 函数返回

##  12.1 代码分析

```solidity
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract FunctionOutputs{
    // 可以return多个参数
    function returnMany() public pure returns(uint,bool){
        return (1,false);
    }
    // 对return的参数进行命名
    function named() public returns(uint x,bool b) {
        return (1,false);
    }

    // 隐式返回
    function assigned() public pure returns(uint x,bool b) {
        x = 1;
        b = false;
    }

    function test() public pure{
        // 接收返回值
    //    (uint x , bool b) =  returnMany();
       // 接收部分返回值，可以节约gas
       (, bool b) = returnMany();
    }

}


```

#  13 数组

##  13.1 代码分析

```solidity
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
```

#  14 映射

##  14.1代码分析

```solidity

// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;
// 类似于java中的HashMap k-v键值对
contract Mapping {
    // 定义简单映射
    mapping(address => uint) public balances;
    // 定义嵌套映射
    mapping(address => mapping(address => bool)) public isFriend;

    function examples() external {
        // 映射赋值
        balances[msg.sender] = 123;
        // 获取映射的值
        uint bal = balances[msg.sender];
        uint bal2 = balances[address(1)];
        // 删除映射
        delete balances[msg.sender];
        // 嵌套映射的定义
        isFriend[msg.sender][address(this)] = true;

    }

}   
```

#  15 结构体

##  15.1 代码分析

```solidity
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract Structs{
    // 定义Car结构体
    struct Car{
        string name;
        uint year;
        address owner;
    }
    // 定义结构体状态变量
    Car public car;
    Car[] public cars;
    mapping(address => Car[]) public carOwners;

    function examples() external {
        // 结构体赋值1
        Car memory car1 = Car("toyota",1999,msg.sender);
        // 结构体赋值2
        Car memory car2 = Car({name:"audi",year:2000,owner:msg.sender});
        // 结构体赋值3
        Car memory car3;
        car3.name = "wl";
        car3.year = 2022;
        car3.owner = msg.sender;

        // 结构体添加到数组中
        cars.push(car1);
        cars.push(car2);
        cars.push(car3);


        // 获取结构体
        Car memory _car = cars[1];
        
    }

}
```

#  16 通过代理合约部署合约

##  16.1 代码分析

```solidity
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
```

#  17 存储位置

##  17.1 代码分析

```solidity
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;
// 智能合约中数据的存储位置有 storage memory calldata 
// storage => 存储在链上可以改变状态变量的值
// memory => 存储在内存中方法调用完成即销毁，不能改变状态变量的值
// calldata => 和memory类似，但是只能定义在函数的输入参数中
contract DataLocations{

    struct Mystruct{
        uint foo;
        string text; 
    }

    mapping(address => Mystruct) public myStructs;

    function emamples() external {
        myStructs[msg.sender] = Mystruct(123,"foo");
        Mystruct storage my = myStructs[msg.sender];
        my.text = "java";

    }

}
```



#  18 触发事件

##  18.1 代码分析

```solidity
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract Event{

    event Log(string message,uint x);
    // 使用indexed标记，可以被区块链索引，借助web3或者ethers sdk可以查询
    event Log(address indexed addr,string message,uint x);

    function example() external{
        emit Log("this is a event",123);
        emit Log(msg.sender,"this is a indexed msg",123);
    }
}
```



#  19 多线继承

##  19.1 代码分析

```solidity
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

//    x
//   / \
//  y   |
//   \ /
//    z
//  上述是一个多线继承的场景，z继承x也继承y，在写合约时继承关系为x y z

contract X {

    function foo() external pure virtual returns(string memory){
        return "X";
    }

    function bal() external pure virtual returns(string memory){
        return "X";
    }

    function x() external pure returns(string memory){
        return "X";
    }

}


contract Y is X{

    function foo() external pure virtual override returns(string memory){
        return "Y";
    }

    function bal() external pure virtual override returns(string memory){
        return "Y";
    }

    function y() external pure returns(string memory){
        return "Y";
    }
}


contract Z is X,Y{

    function foo() external pure virtual override(X,Y) returns(string memory){
        return "Z";
    }

    function bal() external pure virtual override(X,Y) returns(string memory){
        return "Z";
    }

}


```

#  20 父级合约构造函数

##  20.1 代码分析

```solidity
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract A {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract B {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}
// 第一种调用父级构造器方法
contract C is A("A"),B("B"){

}
// 第二种调用父级构造器方法
contract D is A , B{

    constructor (string memory name,string memory text) A(name) B(text){
        
    }

}

```

#  21 可视范围

##  21.1 代码分析

```solidity
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

```

#  22 不可变量

##  22.1 代码分析

```solidity
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract Immutable{
    // immutable修饰的状态变量必须赋初始值
    address public immutable owner = msg.sender;

    uint public x;

    function foo() external{
        require(msg.sender == owner,"not owner");
        x += 1;
    }
}
```

#  23 payable 关键词

## 23.1 代码分析

```solidity
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract Payable{
	// payable 修饰表示可以发送ETH主币
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }
	// 合约可以接受ETH主币
    function send() external payable{

    }

    function getBalance() external view returns(uint) {
        return address(this).balance;
    }
}
```

#  24 练习2-以太坊钱包

##  24.1 代码分析

```solidity
// SPDX-License-Identifier GPL-3.0
pragma solidity ^0.8.7;

contract EtherWallet{

    address payable public owner;

    constructor() {
       owner = payable(msg.sender);
    } 

    receive() external payable {}

    function withdraw(uint _amount) external {
        require(owner == msg.sender,not owner);
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns(uint) {
        return address(this).balance;
    }
}
```



#  25 合约调用其他合约方法

##  25.1 代码分析

```solidity
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
```



#  26 接口合约

##  26.1 代码分析

- 定义合约

```solidity
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract Counter{

    uint public count;

    function inc() external{
        count += 1;
    }

    function dec() external{
        count -= 1;
    }
}
```

- 定义接口

```solidity
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
```



#  27 低级call

##  27.1 代码分析

```solidity
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract TestCall {

    string public message;
    uint public x;

    event Log(string message);

    fallback() external payable{
        emit Log("fallback was called");
    }

    function foo(string memory _message,uint _x) external payable returns(bool,uint){
        message = _message;
        x = _x;
        return (true,999);
    }

}

contract Call {
    
    bytes public data;

    function callFoo(address _test) external payable{
        (bool success , bytes memory _data) = _test.call{value:111}(abi.encodeWithSignature("foo(string,uint256)","call Foo",123));
        require(success,"call failed");
        data = _data;
    }

    function callNotExist(address _test) external {
       (bool success , ) = _test.call(abi.encodeWithSignature("callNotExist()"));
       require(success,"call failed");
    }

}
```



#  28 委托调用

##  28.1 代码分析

```solidity
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;
// 调用合约和被调用合约参数列表需要相同
// 被调用合约状态变量不会改变 调用合约状态变量会改变
contract TestDelegateCall {

    uint public num;
    address public sender;
    uint public value;

    function setVar(uint _num) external payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract DelegateCall {
    uint public num;
    address public sender;
    uint public value;

    function setVar_(address _test, uint _num) external payable {
        (bool success , bytes memory data) = _test.delegatecall(abi.encodeWithSelector(TestDelegateCall.setVar.selector, _num));
        require(success, "fail request");
    }
}

```

#  29 工厂合约

## 29.1 代码分析

```solidity
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract Account {
    address public bank;
    address public owner;

    constructor(address _owner) payable{
        bank = msg.sender;
        owner = _owner;
    }
}


contract AccountFactory {

    Account[] public accounts;

    function createAcccount(address _owner) external payable {
       Account account =  new Account{value:111}(_owner);
       accounts.push(account);
    }

}

```

#  30 库合约

##  30.1 代码分析

```solidity
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

// 返回两数最大值

library Math {
    function max(uint x,uint y) internal returns(uint) {
        return x >= y?x : y;
    }
}

contract TestLib {

    function getMax(uint x,uint y) external returns(uint){
        return Math.max(x,y);
    }
        
}

```



#  31 哈希算法

##  31.1 代码分析

```solidity
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract Hash{
    // keccak256是solidity内置的hash算法
    // encodePacked不会补零，可能导致hash碰撞
    function testHash1(string memory _text,uint _x,address _address) external pure returns(bytes32) {
       return keccak256(abi.encodePacked(_text,_x,_address));
    }
     // encodePacked会补零，不会导致hash碰撞，推荐此打包方式
    function testHash2(string memory _text,uint _x,address _address) external pure returns(bytes32) {
       return keccak256(abi.encode(_text,_x,_address));
    }
}

```

#  32 验证签名

##  32.1 代码分析

```solidity
```

#  33 练习3-权限控制智能合约

##  33.1 代码分析

```solidity
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;
// role => account => bool
contract AccessControl {

    event GrantRole(bytes32 indexed _role,address indexed _account); 
    event RevokeRole(bytes32 indexed _role,address indexed _account); 

    mapping(bytes32 =>mapping(address => bool)) public roles;
    //0xdf8b4c520ffe197c5343c6f5aec59570151ef9a492f2c624fd45ddde6135ec42
    bytes32 private constant ADMIN = keccak256(abi.encodePacked("ADMIN"));
    //0x2db9fd3d099848027c2383d0a083396f6c41510d7acfd92adc99b6cffcf31e96
    bytes32 private constant USER = keccak256(abi.encodePacked("USER"));

    constructor () {
        _grantRole(ADMIN,msg.sender);
    }

    modifier OnlyRole(bytes32 _role) {
        require(roles[_role][msg.sender],"no auth");
        _;
    } 

    function _grantRole(bytes32 _role,address _account) internal {
        roles[_role][_account] = true;
        emit GrantRole(_role,_account);
    }

    function grantRole(bytes32 _role,address _account) external OnlyRole(ADMIN){
       _grantRole(_role,_account);
    }


     function revokeRole(bytes32 _role,address _account) external OnlyRole(ADMIN){
        roles[_role][_account] = false;
        emit RevokeRole(_role,_account);
    }


}
```











