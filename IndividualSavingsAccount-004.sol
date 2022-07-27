// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

import"./SafeMaths.sol";
import "./TransferHelper.sol";

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
    
    function DepositETH() public payable OnlyOwner() {
        require (msg.value > 0);
        balance = balance.add(msg.value);
    }

    function DepositERC20Tokens(address _token, uint256 _amount) public {
        (bool success, bytes memory data) =
            _token.call(abi.encodeWithSelector(IERC20Minimal.transfer.selector, address(this), _amount));
        require(success && (data.length == 0 || abi.decode(data, (bool))), 'TF');
    }
     
    function WithdrawETH(uint256 _amount) public OnlyOwner() Locked() {
        payable(owner).transfer(_amount);
        balance = balance.sub(_amount); 
    }

    function WithdrawERC20Tokens(address _token, uint256 _amount) public {
        (bool success, bytes memory data) =
            _token.call(abi.encodeWithSelector(IERC20Minimal.transfer.selector, msg.sender, _amount));
        require(success && (data.length == 0 || abi.decode(data, (bool))), 'TF');
    }

    function GetBalance() public view OnlyOwner() returns (uint256) {
        return balance;
    }

    function LockForLonger(uint256 _timeLocked) public OnlyOwner() {
        require (_timeLocked > time_locked);
        time_locked = _timeLocked;
    }

    function ChangeOwner(address _newOwner) public OnlyOwner() {
        owner = _newOwner;
    }

}
