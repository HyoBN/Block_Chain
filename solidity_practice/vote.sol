pragma solidity 0.4.24;


contract Vote {

    // structure
    struct candidator{
        string name;
        uint upVote;
    }

    // variable
    bool live;
    address owner;
    candidator[] public candidatorList;
    
    // mapping
    mapping(address => bool) Voted;
    
    // event
    event AddCandidator(string name);
    event UpVote(string candidator, uint upVote);
    event FinishVote(bool live);
    event Voting(address owner);
    
    // modifier
    modifier onlyOwner { //make anyone can't finish the vote except the owner(vote starter).
        require(msg.sender == owner);
        _; //  https://hyukhyukk.tistory.com/61
    }
    // constructor
    constructor() public {
        owner=msg.sender;
        live=true;
        
        emit Voting(owner);
    }
    
    // candidator
    function addCandidator(string _name) public onlyOwner{
        require(live ==true);
        require(candidatorList.length < 5); //Limit the number of candidator.
        candidatorList.push(candidator(_name, 0));
        
        //emit event
        emit AddCandidator(_name);
    }
    // voting
    function upVote(uint _indexOfCandidator) public{
        require(live ==true);

        require(_indexOfCandidator < candidatorList.length);
        require(Voted[msg.sender]==false); // for one people one vote.
        
        candidatorList[_indexOfCandidator].upVote++; 
        
        Voted[msg.sender]=true; //sender variable : have a address who send the message.
        
        emit UpVote(candidatorList[_indexOfCandidator].name, candidatorList[_indexOfCandidator].upVote);
        
    }
    // finish vote
    function finishVote() public onlyOwner{
        require(live ==true);
        live = false;
        
        emit FinishVote(live);
        
    }
    
}