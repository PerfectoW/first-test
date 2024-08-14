// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract deleteInitialValue{
    //初始值delete操作符 删除一个变量的值并用初始值代替
    bool public _bool2 = true;
    
    address public _address = address(1);

    enum ActionSet { Buy,Hold,Sell}
    ActionSet public _enum = ActionSet.Buy;//第一个元素0

    struct Student{
        uint256 id;
        uint256 score;
    }
    Student public student = Student(10,225);

    uint[8] public _staticArray = [1,2,3,4,5,6,7,8];

    function d () external{

    }
    function d_bool() external {
        delete _bool2;//变为默认值false
    }
    function d_address() external {
        delete _address;//变为默认值，address(0)
    }
    function d_enum() external {
        delete _enum;//变为默认值，buy的下标0
    }
    function d_student() external {
        delete student;//变为默认值,student(0,0)
    }
    function d_staticArray() external {
        delete _staticArray;//变为默认值[0,0,0,0,0,0,0,0]
    }
}