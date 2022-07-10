// SPDX-License-Identifier: GPL-3.0
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
        require (time_locked >= block.timestamp);
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
     
    function Withdraw(uint256 _amount) public OnlyOwner() Locked() {
        payable(owner).transfer(_amount);
        balance = balance.sub(_amount); 
    }

    function GetBalance() public view OnlyOwner() returns (uint256) {
        return balance;
    }

    function LockForLonger(uint256 _timeLocked) public OnlyOwner() {
        require (_timeLocked > time_locked);
        time_locked = _timeLocked;
    }

}
