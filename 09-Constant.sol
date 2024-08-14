// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

//constant(常量)和immutable(不变量)，状态变量声明这两个关键字后，
//不能在初始化后更改数值。可以提升合约的安全性并节省gas
contract Constant{
    //constant变量必须在声明的时候初始化，之后不能改变破坏
    uint256 public constant CONSTANT_NUM = 10;
    string public constant CONSTANT_STRING = "0xAA";
    bytes public constant CONSTANT_BYTES = "WANG";
    address public constant CONSTANT_ADDRESS = address(2);

    //immutable变量可以在constructor里初始化，之后不能改变
    uint256 public immutable IMMUTABLE_NUM = 999999999;
    address public immutable IMMUTABLE_ADDRESS = address(1);
    uint256 public immutable IMMUTABLE_BLOCK;
    uint256 public immutable IMMUTABLE_TEST;

    //若immutable变量既在声明时初始化又在constructor(构造函数)中初始化则用constructor的值
    //利用constructor初始化immutable变量
    constructor(){
        IMMUTABLE_ADDRESS = address(this);
        IMMUTABLE_NUM = 111;
        IMMUTABLE_TEST = test();
    }

    function test() public pure returns(uint256) {
        uint256 what = 9;
        return(what);
    }

}