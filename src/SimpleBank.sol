// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleBank {
    // Mapping to store account balances
    mapping(address => uint256) private balances;

    // Event to log deposits
    event Deposit(address indexed account, uint256 amount);

    // Event to log withdrawals
    event Withdrawal(address indexed account, uint256 amount);

    // Function to deposit Ether into the contract
    function deposit() public payable {
        // Add the deposited amount to the user's balance
        balances[msg.sender] += msg.value;

        // Emit the Deposit event
        emit Deposit(msg.sender, msg.value);
    }

    // Function to withdraw Ether from the contract
    function withdraw(uint256 amount) public {
        // Check if the user has enough balance to withdraw
        require(balances[msg.sender] >= amount, "Insufficient balance");

        // Subtract the amount from the user's balance
        balances[msg.sender] -= amount;

        // Transfer the amount to the user's account
        payable(msg.sender).transfer(amount);

        // Emit the Withdrawal event
        emit Withdrawal(msg.sender, amount);
    }

    // Function to check the balance of an account
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}
