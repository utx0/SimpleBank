// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/SimpleBank.sol";

contract SimpleBankTest is Test {
    SimpleBank bank;

    function setUp() public {
        bank = new SimpleBank();
    }

    function testDeposit() public {
        bank.deposit{value: 100}();
        assertEq(bank.getBalance(), 100);
    }

    function testWithdraw() public {
        bank.deposit{value: 100}();
        bank.withdraw(50);
        assertEq(bank.getBalance(), 50);
    }
}
