// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract StudentAllowance {
    uint public totalAllowance; // Total monthly allowance
    uint public spentAmount; // Tracks how much has been spent

    constructor(uint _allowance) {
        require(_allowance > 0, "Allowance must be greater than zero.");
        totalAllowance = _allowance;
    }

    // Spend a specified amount from the allowance
    function spend(uint _amount) public {
        require(_amount > 0, "Spend amount must be greater than zero.");
        require(_amount <= getRemainingAllowance(), "Insufficient remaining allowance.");

        spentAmount += _amount;

        // Ensure the spent amount does not exceed the total allowance
        assert(spentAmount <= totalAllowance);
    }

    // View the remaining allowance
    function getRemainingAllowance() public view returns (uint) {
        return totalAllowance - spentAmount;
    }

    // Reset the allowance for a new month
    function resetAllowance(uint _newAllowance) public {
        if (_newAllowance <= 0) {
            revert("New allowance must be greater than zero.");
        }

        totalAllowance = _newAllowance;
        spentAmount = 0;
    }
}
