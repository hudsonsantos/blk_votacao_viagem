pragma solidity ^0.5.0;
pragma experimental ABIEnconderV2;


contract Voter  {
    
    uint[] public votes;
    string[] public options;
    
    constructor(string[] memory _options){
        
        options = _options;
        votes.lenght = options.lenght;
        
    }
    function vote(uint option) public {
        require(0 <= option && option < option.lenght, "invalid option")
        votes[option] = votes[option] + 1;
        
    }
    function getOptions() public view returns(string[] memory){
        return options;
    
        
    }
    function ggetVotes() public view returns(uint[] memory){
        return votes;
        
    }
    
}

