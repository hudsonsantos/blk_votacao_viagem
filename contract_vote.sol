pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;


contract Voter {
    
    uint[] public votes ;
    string[] public options ;
    // mapeamento para que usuário não repita a votação
    mapping(address => bool) hasVoted;
    
    constructor (string[] memory _options) public {
        options = _options;
        votes.length = options.length;
        
    }
    function voto(uint option) public {
        //validação da votação e validação usuário já votou
        require(0 <= option && option < options.length, "Invalid option");
        require(!hasVoted[msg.sender], "Esta conta já votou.");
        
        //contabiliza voto e grava se usuário já votou
        votes[option] = votes[option] + 1;
        hasVoted[msg.sender] = true;
    
        
    }
    //funções para verificar os valores de opções e quantidade votação
    function getOption() public view returns(string[] memory){
        return options;
        
    }
    function getVotes() public view returns(uint[] memory){
        return votes;
    }
}
