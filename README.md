
<img width="1470" height="956" alt="Screenshot 2025-10-29 at 2 13 37 PM" src="https://github.com/user-attachments/assets/750f2fda-a6b2-4a00-8150-48251c5ed850" />

# **Word
dFi: Inspirational Quotes on Blockchain**

## Project Description

**WordFi** is a simple decentralized application (dApp) built using **Solidity** and deployed on the **Celo Sepolia** test network. The contract stores inspirational quotes on the blockchain, allowing anyone to submit and view quotes. The quotes are immutable and can be accessed by anyone in the world, providing a transparent and public record of inspiring lines
## What It Does

WordFi allows users to:

* Submit inspirational quotes to the blockchain.
* View a list of all quotes stored on the blockchain.
* See the address of the user who submitted each quote.

The contract ensures that all quotes are stored in a decentralized manner and are accessible to the public.

---

## Features

* **Add Quote**: Users can submit a new inspirational quote to the blockchain.
* **View Quotes**: Users can view any quote stored in the contract by providing the index of the quote.
* **Event Emission**: Each time a new quote is added, an event `QuoteAdded` is emitted with the quote text and the sender’s address.
* **Count Quotes**: Users can get the total number of quotes stored in the contract.

---

## Deployed Smart Contract Link

* **Transaction Link (Celo Sepolia)**: [View Transaction on BlockScout](https://celo-sepolia.blockscout.com/tx/0x145029756ed6c2cc67de29b714ad559cfc7fd7999bec7f397ddd669062e45d44?tab=index)

---

## How to Interact with WordFi

### 1. **Deploying the Contract**

You can deploy the WordFi contract using **Remix IDE**:

* Visit [Remix IDE](https://remix.ethereum.org).
* Create a new file and paste the **WordFi.sol** contract code.
* Select **Solidity Compiler** to compile the contract.
* Under the **Deploy & Run Transactions** tab, select **Remix VM** or connect your wallet (MetaMask) if deploying to a live network.
* Deploy the contract.

### 2. **Interacting with the Contract**

Once deployed, you can interact with the contract:

* **Add a Quote**: Call the `addQuote("Your inspirational text here")` function to add a quote to the blockchain.
* **Get Quote Count**: Call the `getQuoteCount()` function to view how many quotes are stored.
* **View a Quote**: Call `getQuote(index)` to retrieve a specific quote and its author by providing the index.

---

## Smart Contract Code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract WordFi {
    // A struct to store each quote and the address that submitted it
    struct Quote {
        string text;
        address author;
    }

    // Array to hold all quotes
    Quote[] public quotes;

    // Event emitted when a new quote is added
    event QuoteAdded(string text, address indexed author);

    // Function to add a new inspirational line
    function addQuote(string memory _text) public {
        require(bytes(_text).length > 0, "Quote cannot be empty");

        quotes.push(Quote({
            text: _text,
            author: msg.sender
        }));

        emit QuoteAdded(_text, msg.sender);
    }

    // Function to get the total number of quotes
    function getQuoteCount() public view returns (uint256) {
        return quotes.length;
    }

    // Function to get a quote by index
    function getQuote(uint256 _index) public view returns (string memory, address) {
        require(_index < quotes.length, "Invalid index");
        Quote memory q = quotes[_index];
        return (q.text, q.author);
    }
}
```

---

## Tech Stack

* **Solidity**: Smart contract programming language.
* **Celo Blockchain**: A mobile-first blockchain platform.
* **Celo Sepolia Test Network**: Test network used for deployment.
* **Remix IDE**: Web-based IDE to deploy and test the smart contract.

---

## Contributing

Feel free to fork this repository and contribute to enhancing WordFi. If you have an idea for a feature or found a bug, feel free to open an issue or submit a pull request.

---

## License

This project is licensed under the MIT License.

---

### 🙌 Thank You for Using WordFi!

Would you like to add anything else to the README or need help with the next steps in your project?

