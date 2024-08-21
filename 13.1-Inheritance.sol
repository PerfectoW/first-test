// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;


contract Yeye{
    event Log(string msg);

    //父合约中的函数想要被自合约重写,需要在函数加上virtual
    //定义3个function:hip(),pop(),man(),Log值为Yeye
    function hip() public virtual{
        emit Log("Yeye");//触发Log事件
    }

    function pop() public virtual{
        emit Log("Yeye");
    }

    function man() public virtual{
        emit Log("Yeye");
    }
}

    //子合约中重写了父合约的函数,需要加上override
contract Baba is Yeye{
    //继承两个function:hip()和pop(),输出改为Baba
    function hip() public virtual override{
        emit Log("Baba");
    }
    function pop() public virtual override{
        emit Log("Baba");
    }
    function baba() public virtual {
        emit Log("Baba");
    }
    //从Yeye继承的man函数不变
}

contract Erzi is Yeye,Baba{
    //将继承的两个function: hip()和pop(),输出值改为Erzi
    function hip() public virtual override(Yeye,Baba){
        emit Log("Erzi");
    }

    function pop() public virtual override(Yeye,Baba){
        emit Log("Erzi");
    }


//调用父合约的函数
    //方法一:用 父合约名.函数名()的方式来调用父合约函数
    function callParent() public{
        Yeye.pop();
    }
    //方法二:子合约用super.函数名()关键字调用最近的父合约函数
    //Solidity继承关系按声明时从右到左的顺序是:contract Erzi is Yeye,Baba则Baba是Erzi最近的父合约
    function callParentSuper() public{
        //将调用最近的父合约函数,Baba.pop()
        super.pop();
    }
}

//构造函数的继承
abstract contract A{
    uint public a;

    constructor(uint _a){
        a = _a;
    }
}
//方法一:在继承时声明父构造函数的参数
contract B is A(1){}//继承合约A并赋值_a为1

//方法二:在子合约的构造函数中声明构造函数的参数
contract C is A{
    constructor(uint _c) A(_c * _c){}//将_c*_c的值传递给父合约
}

