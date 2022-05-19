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
