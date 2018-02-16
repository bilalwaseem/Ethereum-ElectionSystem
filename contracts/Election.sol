// pragma solidity ^0.4.2;

// contract Election {
//     //model a candidate
//     struct Candidate {
//         uint id;
//         string name;
//         uint voteCount;
//     }

//     //stores the accounts that have voted
//     mapping(address => bool) public voters;

//     mapping(uint => Candidate) public candidates; //associative array named candidates like a hash map i.e. assigns a uint for each candidate where uint is from the struct object and candidate is a single object. The mapping function interacts with the datalayer of the block

//     uint public candidatesCount; //default value is zero

//     // voted event
//     event votedEvent (
//         uint indexed _candidateId
//     );


//     //constructor
//     function Election() public {
//         addCandidate("Candidate 1");
//         addCandidate("Candidate 2");
//     }

//     // modifier Checking(uint _candidateId) {
//     //     //require that they have not voted before
//     //     require(!voters[msg.sender]);

//     //     //requires a valid candidate
//     //     require(_candidateId > 0 && _candidateId <= candidatesCount);
//     //     _;
//     // }

//     function addCandidate(string _name) private {
//         candidatesCount++;                      //id, name, voteCount
//         candidates[candidatesCount] = Candidate(candidatesCount, _name, 0); //stores the object in the mapping array
//     }

//     function vote (uint _candidateId) public {
//         //require that they have not voted before
//         require(!voters[msg.sender]);

//         //requires a valid candidate
//         require(_candidateId > 0 && _candidateId <= candidatesCount);

//         //records the vote
//         voters[msg.sender] = true;
//         //update user vote count
//         candidates[_candidateId].voteCount ++;

//         // trigger voted event
//         votedEvent(_candidateId);
//     }
// }

pragma solidity ^0.4.2;

contract Election {
    // Model a Candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Store accounts that have voted
    mapping(address => bool) public voters;
    // Store Candidates
    // Fetch Candidate
    mapping(uint => Candidate) public candidates;
    // Store Candidates Count
    uint public candidatesCount;

    function Election () public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate (string _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote (uint _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender]);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount ++;
    }
}
