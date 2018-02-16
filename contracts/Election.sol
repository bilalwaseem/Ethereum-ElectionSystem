pragma solidity ^0.4.2;

contract Election {
    //member variables
    string public candidate;
    //constructor
    function Election() public {
        candidate = "Candidate 1";
    }
}