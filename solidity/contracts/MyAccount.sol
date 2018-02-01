pragma solidity ^0.4.0;
contract MyAccount {
    uint private myBalance;
    
    function MyAccount(uint _myBalance) public{
        myBalance = _myBalance;
    }
    
    function getBalance() public constant returns(uint){
        return myBalance;
    }
    
    function add(uint _amount) public returns(uint){
        myBalance += _amount;
        return myBalance;
    }
}