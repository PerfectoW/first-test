// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

//变量数据存储和作用域
// contract DataStorage{
//     //函数的参数和临时变量一般用memory(string,bytes,array和自定义结构),如果返回数据类型是变长的一定要加memory
//     //calldate变量不能修改(immutable),一般用于函数的参数
//     function fCalldata(uint[] calldata _x) public pure returns(uint[] calldata){
//         //参数为calldata数组，只能读不能被修改
//         //_x[0] = 0;//报错
//         return(_x);
//     }

//     uint[]x = [1,2,3];//状态变量:数组x

//     function fStorage() public{
//         //声明一个storage的变量xStorage,指向x。修改新变量xStorage也会影响原变量x
//         uint[] storage xStorage = x;
//         xStorage[0] = 100;
//     }

//     function fMemory() public view{
//         //声明一个memory的变量。修改xMemory不会影响x
//         uint[] memory xMemory = x;
//         xMemory[0] = 22;
//     }
// }

//变量的作用域
    contract Variables{
        //状态变量:存储在链上的变量,所有合约内函数都可访问,gas消耗高
        uint public x = 1;
        uint public y;
        string public z;

        function foo() external{
        //可以在函数里更改状态变量的值
            x = 5;
            y = 2;
            z = "0xAA";
    }
        //局部变量:仅在函数执行过程中的有效变量。不上链gas低,局部变量在函数内声明
        function bar() external pure returns(uint){
            uint xx = 1;
            uint yy = 3;
            uint zz = xx + yy;
            return(zz);
        }

        //全局变量:全局范围工作的变量,都是solidity预留的,他们可以在函数内不声明直接使用
        function global() external view returns(address,uint,bytes memory,uint){
            address sender = msg.sender;//消息发送者(当前caller)
            uint blockNum = block.number;//当前区块的number
            bytes memory data = msg.data;//完整call data
            uint blockGas = block.gaslimit;//当前区块的gaslimit(极限)
            return(sender,blockNum,data,blockGas);
        }
        //以太单位:Solidity不存在小数点,以0代替
        function weiUint() external pure returns(uint){
            assert(1 wei == 1e0);
            assert(1 wei == 1);
            return 1 wei;
        }

        function gweiUint() external pure returns(uint){
            assert(1 gwei == 1e9);
            assert(1 gwei == 1000000000);
            return 1 gwei;
        }

        function etherUint() external pure returns(uint){
            assert(1 ether == 1e18);
            assert(1 ether == 1000000000000000000);
            return 1 ether;
        }

        //时间单位:可在合约中规定
        function secondsUint() external pure returns(uint){
            assert(1 seconds == 1);
            return 1 seconds;
        }

        function minutesUnit() external pure returns(uint){
            assert(1 minutes == 60);
            assert(1 minutes == 60 seconds);
            return 1 minutes;
        }

        function hoursUint() external pure returns(uint){
            assert(1 hours == 3600);
            assert(1 hours == 60 minutes);
            return 1 hours;
        }

        function daysUint() external pure returns(uint){
            assert(1 days == 86400);
            assert(1 days == 24 hours);
            return 1 days;
        }

        function weeksUint() external pure returns(uint){
            assert(1 weeks == 604800);
            assert(1 weeks == 7 days);
            return 1 weeks;
        }
}

    