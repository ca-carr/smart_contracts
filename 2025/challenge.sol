// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Challange {

    // PART A
    uint256 number; 
    bytes32 number_solution = 0xaadc37b8ba5645e62f4546802db221593a94729ccbfc5a97d01365a88f649878;
    bool    status_num = false;

    // PART B
    string private storedString;
    bytes32 SOLUTION = 0x33027547537d35728a741470df1ccf65de10b454ca0def7c5c20b257b7b8d161;
    bytes32 SLOG = 0x0000000000000000000000000000000000000000000000000000000000000000;
    bool status_string = false;
    

    // FUNCTION A.1: Store an integer value in the smart contract
    function store_uint256(uint256 num) public returns(uint256) {
        number = num;
        return (number);
    }

    // FUNCTION A.2: Retrive the stored integer value in the contract
    function retrieve_int256() public view returns (uint256){
        return (number);

    }

    // FUNCTION A.3: Hash the string that you send to the smart contract
    function hash_number() public view returns(bytes32){ 
        return keccak256(abi.encodePacked(number));
    }

    // FUNCTION A.4: Check number solution
    function check_number_solution() public returns (bool) { 
        bytes32 computedHash = keccak256(abi.encodePacked(number));
        
        if (computedHash == number_solution) {
            status_num = true;
        } else {
            status_num = false;
        }
        return status_num;
    }

    // Function A.5: check if number puzzle is solved?
    function puzzle_num_status() public view returns (bool) { 
        return status_num;
    }

// PART B

    // FUNCTION B.1: Store a string in the contract
    function store_string(string memory input) public returns (string memory) {
        storedString = input;
        return (storedString);
    }

    // FUNCTION B.2: Retrieve the stored string
    function retrieve_string() public view returns (string memory) {
        return storedString;
    }

    // FUNCTION B.3: Hash the string stored in the smart contract
    function hash_string() public view returns(bytes32){ 
        return keccak256(abi.encodePacked(storedString));
    }

    // FUNCTION B.4: Hash the string _sent_ to the smart contract
    function hash(string memory _string2) public view returns(bytes32){ 
        
        if    (keccak256(abi.encodePacked(_string2)) == SOLUTION) {
            return (SLOG);
        }
        return keccak256(abi.encodePacked(_string2));
        
    }

    // FUNCTION B.5: Check to see if the input string you submit is the solution
    function check_string_puzzle(string memory _string3) public returns(string memory){ 

        // THIS IS THE MAIN PUZZLE FUNCTION! IT IS DIFFERENT TO THE NUMBER PUZZLE (A) ABOVE.
        // THE SOLUTION TO THE PUZZLE IS A SINGLE WORD, ONE THAT YOU WILL HAVE SEEN MANY TIMES IN THE LECTURE SLIDES!
        // if you solve the puzzle, keep it to yourself until next lecture.
        if (hash(_string3) == SLOG) {
            status_string = true;
            return("puzzle solved");
        } else {
            return("wrong, try again!");
        }

    }

    // FUNCTION B.6: Check if the puzzle string is solved
    function puzzle_string_status() public view returns (bool){
        return (status_string);
    }

    // PART C: 
    // Write a function to check if poth puzzles are solved, then return the values of the solutions
    // Comment on the security of this smart ocntract puzzle

}
