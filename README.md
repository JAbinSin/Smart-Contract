# Smart-Contract

This Solidity program demonstrates error-handling mechanisms in a relatable scenario for college students. It models a Student Allowance Tracker to help students manage their monthly allowance and track spending. The contract utilizes require(), assert(), and revert() statements to validate inputs and ensure robust contract logic.

## Description

This contract, written in Solidity, provides the following functionality:

* Track Monthly Allowance: Set and reset a fixed allowance for the month.
* Spend Tracking: Record expenses and ensure the remaining balance is sufficient for any spending.
* Remaining Allowance Calculation: Calculate how much allowance is left.
* Error Handling:
    * Prevents overspending.
    * Validates allowance reset values.
    * Ensures logical consistency after operations.   

This contract demonstrates how to apply require(), assert(), and revert() for error handling in practical scenarios while making it relevant to a student's financial management.

## Getting Started

### Executing program

1. To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

2. Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., myToken.sol). Copy and paste the following code into the file:

```solidity
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
```

3. Compile the Contract:
    * Navigate to the Solidity Compiler tab.
    * Ensure the compiler version is set to ^0.8.28 or compatible.
    * Click Compile myToken.sol.

4. Deploy the Contract:
   * Navigate to the Deploy & Run Transactions tab.
   * Select StudentAllowance from the dropdown.
   * Enter an initial allowance value (e.g., 100) in the constructor input and click Deploy.

5. Interact with the Contract:
   * Use spend() to record expenses. Ensure the amount does not exceed the remaining allowance.
   * Use getRemainingAllowance() to check how much is left.
   * Use resetAllowance() to set a new allowance at the start of a month.

## Authors

Metacrafter John Alvin R. Cruz

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
