pragma solidity ^0.4.2;

contract Election {
    //model a candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    mapping(uint => Candidate) public candidates; //associative array named candidates like a hash map i.e. assigns a uint for each candidate where uint is from the struct object and candidate is a single object. The mapping function interacts with the datalayer of the block

    uint public candidatesCount; //default value is zero

    //constructor
    function Election() public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate(string _name) private {
        candidatesCount++;                      //id, name, voteCount
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0); //stores the object in the mapping array
    }
}