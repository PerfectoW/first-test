// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

//发行/控制合约资产
contract Owner{
    address public owner;//定义owner变量

    //构造函数,每个合约可以定义一个,并在部署合约时自动运行一次
    constructor(address initialOwner){
        owner = initialOwner;//在部署合约的时候,将owner设置为传入的initialOwner地址
    }

    //修饰器modifier
    modifier onlyOwner{
        require(msg.sender == owner);//检查调用者是否为owner地址
        _;//是则运行函数主体，否则报错并revert交易
    }
    
    function changeOwner(address _newOwner) external onlyOwner{
        owner = _newOwner;//只有owner地址运行这个函数,并改变owner
    }
}
//用0x70997970C51812dc3A010C7d01b50e0d17dc79C8作为新地址测试,
//当账户不为owner地址(既不是0x5B38Da6a701c568545dCfcB03FcB875f56beddC4)时交易失败
//因为modifier onlyOwner的检查语句不满足