// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;


//返回值
contract Return{
    //返回多个变量
    //returns跟在函数名后用于声明返回的变量类型及变量名;return用于函数主体返回指定的变量
    function returnMultiple() public pure returns(uint256,bool,uint256[3] memory){
        return(1,true,[uint256(1),2,5]);
    }

    //数组类型返回值必须用memory存储

    //命名式返回(表明返回变量的名称则不用在函数体中使用return)
    function returnNamed() public pure returns(uint256 _number,bool _bool,uint256[3] memory _array){
        _number = 2;
        _bool = false;
        _array = [uint256(3),2,1];
    }

    //命名式返回(也可用return来返回变量)
    function returnNamed2() public pure returns(uint256 _number,bool _bool,uint256[3] memory _array){
        return(1,true,[uint256(9),2,5]);
    }


    //解构式赋值
    function readReturn() public pure{
        //读取全部返回值
        uint256 _number ;
        bool _bool ;
        bool _bool2 ;
        uint256[3] memory _array ;
        (_number,_bool,_array) = returnNamed();//声明变量，然后将要赋值的变量按顺序用,隔开

        //读取部分返回值，解构式赋值
        (,_bool2,) = returnNamed();
    }
}