// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract InitialValue{//初始值
    //用public变量的getter函数验证
    bool public _bool;//false
    string public _string;// ""
    int public _int;// 0
    uint public _uint;// 0
    address public _address;// 0x0

    enum ActionSet { Buy,Hold,Sell }
    ActionSet public _enum;//Buy的索引0

    function fi() internal{}//internal空白函数
    function fe() external{}//external空白函数


    //Reference Types应用类型初始值
    uint[8] public _staticArray;// 所有成员设为其默认值的静态数组[0,0,0,0,0,0,0,0]
    uint[] public _dynamicArray;// "[]"
    mapping (uint => address) public _mapping;//所有元素都为其默认值的mapping
    //所有成员设为其默认值的结构体0,0
    struct Student{
        uint256 id;
        uint256 score;
    }
    Student public student;

    //delete操作符
    bool public _bool2 = true;
    function d() external {
        delete _bool2;// delete 会让_bool2变为默认值，false
    }
}