// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;





contract Events{
    //定义_balances映射变量,记录
    mapping(address => uint256) public _balances;
    //以转账ERC20代币为例
    //事件Transfer记录3个变量from、to、value,indexed关键词将from和to索引,方便后续查询
    event Transfer(
        address indexed from,
        address indexed to,
        uint256 value);

    //定义_transfer函数,执行转账逻辑    
    function _transfer(
        address from,
        address to,
        uint256 amount
        ) external{
        _balances[from] = 10000000;//给转账地址一些初始代币
        _balances[from] -= amount;//from地址减去转账数量
        _balances[to] += amount;//to地址加上转账数量
    //释放事件
    emit Transfer(from,to,amount);
    }
}