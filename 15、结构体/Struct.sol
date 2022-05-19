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