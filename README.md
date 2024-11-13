# Smart-Contract

This Solidity program demonstrates how to implement error handling mechanisms in smart contracts. It includes basic functionality for setting a value and performing division with custom error messages, helping developers understand how to use require, assert, and revert statements for input validation and contract logic.

## Description

This contract, written in Solidity, implements two primary functions: setting a value and performing division. It includes basic error handling to ensure:

* The value being set is greater than 0 and not the same as the previous value.
* Division by zero is prevented.
* Only values that are divisible by the denominator can be used in the division.

The contract also demonstrates how to handle custom error messages with require, assert, and revert, providing an essential foundation for creating more robust smart contracts.

## Getting Started

### Executing program

1. To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

2. Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., myToken.sol). Copy and paste the following code into the file:

```javascript
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract ErrorHandlerContract {
    uint public value;

    function setValue(uint _value) public {
        require(_value > 0, "Value must be greater than 0.");
        assert(_value != value);
        value = _value;
    }

    function performDivision(uint _numerator, uint _denominator) public pure returns (uint) {
      require(_denominator != 0, "Cannot divide by zero.");

      if (_numerator % _denominator != 0) {
         revert("Numerator must be divisible by denominator.");
      }
      
      return _numerator / _denominator;
   }
}
```

3. To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the compiler version is set to 0.8.28 or any compatible version, and then click "Compile myToken.sol.".

4. Once the contract is compiled, deploy it by navigating to the Deploy & Run Transactions tab in the left sidebar. Select the ErrorHandlerContract from the dropdown and click Deploy.

5. After deploying the contract, you'll see it under Deployed Contracts. You can now interact with the contract:
   * Use the setValue function to set a new value, ensuring the value is greater than 0 and different from the previous value.
   * Use the performDivision function to divide two numbers, making sure the numerator is divisible by the denominator and the denominator is not zero.
## Authors

Metacrafter John Alvin R. Cruz
## License

This project is licensed under the MIT License - see the LICENSE.md file for details
