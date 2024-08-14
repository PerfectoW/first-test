// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract FunctionTypes{
    uint256 public number = 5;

    // function <function name>(<parameter types>参数的变量类型和名称) {internal/external/public/private}
    // [pure|view|payable决定函数权限/功能的关键词][returns (<return types>)返回的变量类型和名称]
    // 合约中的函数要明确指定可见性
    function add() external{
        number = number + 1;
    }

    //pure:既不能读也不能写，可以给函数传递参数_number然后返回_number+1。不会读取或写入状态变量
    function addPure(uint256 _number) external pure returns (uint256 new_number){
        new_number = _number + 1;
    }

    //view:可以读不能写，可以读取number但不改写number,返回一个新的变量
    function addView()external view returns(uint256 new_number){
        new_number = number + 1;
    }

    
    //internal:内部函数
    function minus() internal {
        number = number - 1;
    }

    //合约内的函数也已调用内部函数
    function minusCall() external {
        minus();
    }
    
    //payable:递钱，能给合约支付eth的函数
    function minusPayable() external payable returns(uint256 balance){
        minus();
        balance = address(this).balance;//this引用合约地址
    }
}