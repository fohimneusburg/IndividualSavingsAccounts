# Individual Savings Accounts

A set of simple smart contracts written in solidity that allows a user to store funds and then withdraw them at a chosen date.

### Walkthrough

###### ISA 001

IndividualSavingsAccount-001.sol has been developed with functionality that allows a user to lock up funds for a selected amount of time, once the time 
has passed then the user can withdraw the funds. The user must wait untill the selected time has been passed to withdraw otherwise the contract will not allow for the withdraw to be processed. The contract also allows for queries of the total balance and access is also restricted to just the owner/deployer of the contract. 

###### ISA 002

IndividualSavingsAccount-002.sol is a slightly modified version of 001 and allows a user to withdraw a particular amount of funds (instead of the whole balance) and alter the locking period for longer periods of time.

###### ISA 003

IndividualSavingsaccunt-003.sol is basically the same as 001 & 002 however in this instance the owner is able to change the address which governs the contract. Hence giving the contract a new owner address.
