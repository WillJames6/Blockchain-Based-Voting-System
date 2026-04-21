pragma solidity ^0.5.16;

contract Voting {
    // Track whether an address has voted
    mapping(address => bool) public hasVoted;
    
    // Track how many votes each candidate has received
    mapping(bytes32 => uint) public votesReceived;
    
    // Array of candidates
    bytes32[] public candidates;
    
    // Admin address
    address public admin;

    // Restrict functions to admin only
    modifier onlyAdmin() {
        require(msg.sender == admin, "Only the admin can add candidates");
        _;
    }

    // Constructor to initialize the contract with candidate names
    constructor(bytes32[] memory candidateNames) public {
        admin = msg.sender; // Set the deployer as the admin
        candidates = candidateNames; // Set the initial list of candidates
    }

    // Function to vote for a candidate
    function voteForCandidate(bytes32 candidate) public {
        require(!hasVoted[msg.sender], "You have already voted.");
        require(validCandidate(candidate), "Candidate does not exist.");

        hasVoted[msg.sender] = true;
        votesReceived[candidate] += 1;
    }

    // Check if the given candidate is valid
    function validCandidate(bytes32 candidate) view public returns (bool) {
        for (uint i = 0; i < candidates.length; i++) {
            if (candidates[i] == candidate) {
                return true;
            }
        }
        return false;
    }
}
