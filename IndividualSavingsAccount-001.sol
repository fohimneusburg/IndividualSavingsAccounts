pragma solidity ^0.8.4;

import"./SafeMaths.sol";

contract IndividualSavingsAccount {

    using SafeMath for uint256;

    uint256 internal balance;
    uint256 public time_locked;
    
    address public owner;

    modifier OnlyOwner() {
        require (msg.sender == owner);
        _;
    }

    modifier Locked() {
        if (time_locked >= block.timestamp) {
            revert();
        }
        _;
    }

    constructor (uint256 _timeLocked) payable {
        balance = msg.value;
        time_locked = _timeLocked;
        owner = msg.sender;
    }
    
    function Deposit() public payable OnlyOwner() {
        require (msg.value > 0);
        balance = balance.add(msg.value);
    }
     
    function Withdraw() public OnlyOwner() Locked() {
        payable(owner).transfer(balance);
        balance = 0;
    }

    function GetBalance() public view OnlyOwner() returns (uint256) {
        return balance;
    }

}
