// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract ArrayTypes{
    //固定长度Array  (T[K]形式--T是元素类型，K是长度)
    uint[8] array1;
    bytes1[5] array2;
    address[100] array3;

    //可变长度Array
    uint[] array4;
    bytes1[] array5;
    address[] array6;
    bytes array7;//bytes是数组但不用加[]，不能用byte[]声明单字节数组
    //可用bytes或bytes1[] 前者所用gas更少

    //memory动态数组,用new创建，需声明长度且不能改变
   // uint[] memory array8 = new uint[](5);
   // bytes memory array9 = new bytes(9);
    
    
    //[1,2,3]默认为uint8数组，把第一个元素转换成uint[1]
    function f() public pure {
        g([uint(1),2,3]);
    }
    function g(uint[3] memory _data) public pure {
        //...
    }

    //创建的是动态数组需要一个个赋值
    // uint[] memory x = new uint[](3);
    // x[0]=1;
    // x[1]=3;
    // x[2]=4;

    function arrayPush() public returns (uint[] memory){
        uint[2] memory a = [uint(1),2];
        array4 = a;
        // array4.push(3);//数组最后添加（X）
        // array4.push();//数组最后添加0
        array4.pop();//移除数组最后一个元素
        // array4.length;//固定长度
        return array4;
    }


    //结构体
    struct Student{
        uint256 id;
        uint256 score;
        bool test;
    }

    Student student;// 初始一个student结构体

    //给结构体赋值
    //方法1：在函数中创建一个storage的struct引用
    // function initStudent1() external {//初始化student结构体
    //     Student storage _student = student;
    //     _student.id = 11;
    //     _student.score = 100;
    //     _student.test = true;
    // }

    //方法2：直接引用状态变量的strust
    // function initStudent2() external {
    //     student.id = 2;
    //     student.score = 80;
    //     student.test = true;
    // }

    //方法3：构造函数式
    // function initStudent3() external {
    //     student = Student(5,200,true);
    // }

    //方法4：key value
    function initStudent4() external {
        student = Student({id: 4, score: 126, test: true});
    }
}