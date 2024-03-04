
```js
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CollaborativeSentence {
    string public sentence;
    
    // Event to log the added word for easier tracking
    event WordAdded(address contributor, string word);

    function addWord(string memory newWord) public {
        require(bytes(newWord).length > 0 && bytes(newWord).length <= 10, "Word must be 1 to 10 characters long.");
        require(isValidWord(newWord), "Word can only contain letters and punctuation.");

        // Append a space before the new word if the sentence isn't empty
        if (bytes(sentence).length > 0) {
            sentence = string(abi.encodePacked(sentence, " ", newWord));
        } else {
            sentence = newWord;
        }

        emit WordAdded(msg.sender, newWord);
    }

    function getSentence() public view returns (string memory) {
        return sentence;
    }

    // Helper function to check if the word is valid (only contains letters and valid punctuation)
    function isValidWord(string memory str) private pure returns (bool) {
        bytes memory strBytes = bytes(str);
        for(uint i = 0; i < strBytes.length; i++) {
            bytes1 char = strBytes[i];
            if(!(char >= 0x41 && char <= 0x5A) && // A-Z
               !(char >= 0x61 && char <= 0x7A) && // a-z
               !(char == 0x2E || char == 0x2C || char == 0x21 || char == 0x3F || char == 0x3A || char == 0x3B)) { // . , ! ? : ;
                return false;
            }
        }
        return true;
    }
}
```
