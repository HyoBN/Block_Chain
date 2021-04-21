pragma solidity >=0.4.23;

contract Voting {
    //constructor to initialize candidates.
    //vote for candidates.
    //get count of votes for each candidates.
    
    bytes32[] public candidateList;
    mapping (bytes32 => uint8) public votesReceived;
    // mapping? : The data type of the key-value pair. ex) dictionary type in python.
    
    constructor(bytes32[] storage candidateNames) public {// why bytes32 ? : solidity does not support string yet.
        candidateList=candidateNames;
    }
    
    function voteForCandidate(bytes32 candidate) public {
        require(validCandidate(candidate)); 
        votesReceived[candidate] +=1;
    }
    
    function totalVotesFor(bytes32 candidate) view public returns(uint8){
        require(validCandidate(candidate)); 
        return votesReceived[candidate]; 
    }
    
    function validCandidate(bytes32 candidate) view public returns(bool){
        require(validCandidate(candidate)); 
        for(uint i=0;i<candidateList.length;i++){
            if(candidateList[i]==candidate){
                return true;
            }
        }
        return false; 
    }
    
}