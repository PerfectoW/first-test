// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

//修饰器的继承
contract Base1{
    modifier exactDividedBy2And3(uint _a) virtual{
        require(_a % 2 == 0 && _a % 3 == 0);//检查_a是否能被2和3整除
        _;
    }
}

contract Identifier is Base1{
    //计算一个数分别被2除和被3除的值，但传入的参数必须是2和3的倍数
    function getExactDividedBy2And3(uint _dividend) public exactDividedBy2And3(_dividend) pure returns(uint,uint){
        return getExactDividedBy2And3WithoutModifier(_dividend);
    }

    //计算一个数分别被2除和3除的值
    function getExactDividedBy2And3WithoutModifier(uint _divident) public pure returns (uint,uint){
        uint div2 = _divident / 2;
        uint div3 = _divident / 3;
        return (div2,div3);
    }
    //在子合约中用override重写修饰器
    //重写前输入9调用2And3会revert,因为修饰器无法通过检查
    //重写后输入9可正常调用
    // modifier exactDividedBy2And3(uint _a) override{
    //     _;//执行函数
    // }
}