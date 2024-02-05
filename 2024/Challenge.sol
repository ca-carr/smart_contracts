// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Challange {

    uint256 number;
    bytes32 SOLUTION = 0xeea8d3c6796b1d78edf75282b5762b3b7ff056c6a0641d45b009595167b0c714;
    bytes32 SLOG = 0x0000000000000000000000000000000000000000000000000000000000000000;
    bool status = false; //1 if solved, 0 otherwise

    // FUNCTION 1: Store an innteger value in the smart contract
    function store(uint256 num) public returns(uint256) {
        number = num;
        return (number);
    }

    // FUNCTION 2: Retrive the stored integer value in the contract
    function retrieve() public view returns (uint256){
        return (number);

    }

    // FUNCTION 3: Display a string that you send to the smart contract
    function display(string memory _string1) public pure returns(string memory) {
        return (_string1);
    }

    // FUNCTION 4: Hash the string that you send to the smart contract
    function hash(string memory _string2) public view returns(bytes32){ 
        
        if    (keccak256(abi.encodePacked(_string2)) == SOLUTION) {
            return (SLOG); //retrun SLOG if your string happens to be a solution
        }
        return keccak256(abi.encodePacked(_string2));
        
    }

    // FUNCTION 5: Check to see if the input string you submit is the solution
    function check_puzzle(string memory _string3) public returns(string memory){ 

        // THIS IS THE PUZZLE FUNCTION!
        // THE SOLUTION TO THE PUZZLE IS A SINGLE WORD, ONE THAT YOU WILL HAVE SEEN MANY TIMES IN THE LECTURE SLIDES!
        // if you solve the puzzle, keep it to yourself for next time.
        if (hash(_string3) == SLOG) {
            status = true;
            return("puzzle solved");
        } else {
            return("wrong!");
        }

    }

    function check_status() public view returns (bool){
        return (status);
    }

}
