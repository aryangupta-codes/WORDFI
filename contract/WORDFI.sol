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
