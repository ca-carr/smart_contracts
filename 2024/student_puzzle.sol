// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

/**
 * Solve this one word puzzle with 10 limited number of attempt.
 * The solution is a key concept in blockchain, crucial for adding new blocks.
 */
contract BlockchainPuzzle {

    // Hashed solution for the puzzle. (Hash of the solution word)
    bytes32 private constant SOLUTION_HASH = 0x4edb209cbb70385eeb61cafb80e3a36c3d618cb922a60355af792a041041b6d1;
    
    // Indicates whether the puzzle has been solved.
    bool public isSolved = false;

    // Number of attempts made to solve the puzzle.
    uint public attemptCount = 0;

    // Maximum number of attempts allowed.
    uint public constant MAX_ATTEMPTS = 10;

    /**
     * Attempt to solve the puzzle.
     * If the guess is correct, or maximum attempts are reached, returns true; otherwise false.
     */
    function solvePuzzle(string memory _guess) public returns (bool) {
        require(attemptCount < MAX_ATTEMPTS, "Maximum attempt limit reached.");
        
        attemptCount++;
        
        if (keccak256(abi.encodePacked(_guess)) == SOLUTION_HASH) {
            isSolved = true;
            return true;
        }
        
        if(attemptCount >= MAX_ATTEMPTS) {
            revert("Maximum number of attempts reached.");
        }

        return false;
    }

    /**
     * Check the current status of the puzzle.
     */
    function checkStatus() public view returns (bool) {
        return isSolved;
    }

    /**
     * Get the total number of attempts made.
     */
    function getAttemptCount() public view returns (uint) {
        return attemptCount;
    }
}
