// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

//映射格式：mapping(_KeyType => _ValueType)//key和value的变量类型
contract Mapping{
    mapping (uint => address) public idToAddress;//id映射到地址
    mapping (address => address) public swapPair;//币对的映射，地址到地址


    //我们定义一个结构体Struct
    // struct Student{
    //     uint id;
    //     uint score;
    // }

    // mapping(Student => uint) public testVar;
    //报错，因为keytype只能使用内置类型，不能使用自定义

    //给映射新增的键值对的语法为 _Var[_Key] = _Value(依次为映射变量名，对应新增的键值对)
    function writeMap (uint _Key, address _Value) public {
        idToAddress[_Key] = _Value;
    }
}