# Savings Contract

A simple smart contract written in solidity that allows a user to store funds and then withdraw them at a chosen date.

### Walkthrough

The smart contract in file "SavingsContract-001.sol" has been developed with functionality that allows a user to lock up funds for a selected amount of time, once the time 
has passed then the user can withdraw the funds. The user must wait untill the selected time has been passed to withdraw otherwise the contract will not allow for the withdraw 
to be processed. The contract also allows for queries of the total balance and access is also restricted to just the owner/deployer of the contract. 

"SavingsContract-002.sol" is a slight modified version of 001 and allows a user to withdraw a particular amount of funds (instead of the whole balance) and alter the locking period for longer periods of time.
