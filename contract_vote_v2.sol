pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;


contract Voter {
    
    struct optionPos {
        uint pos;
        bool exists;
    
    }
    
    uint[] public votes;
    string[] public options;
    mapping (address => bool) hasVoted;
    mapping (string => optionPos) posOfOption;

    
    constructor(string[] memory _options) public {
        options = _options;
        votes.length = options.length;
        
        for (uint i = 0; i < options.length; i++) {
            optionPos memory option = optionPos(i, true);
            posOfOption[options[i]] = option;
        }
        
    }
    
    function voteCode(uint option) public {
        require(0 <= option && option < options.length, "Opção invalida");
        require(!hasVoted[msg.sender], "Conta já votou.");
      

        hasVoted[msg.sender] = true;
        votes[option] = votes[option] + 1;
    }
        function voteName(string memory option) public {
        require(!hasVoted[msg.sender], "Desculpe, esta conta já votou.");
        optionPos memory OptionPos = posOfOption[option];
        require(OptionPos.exists, "Opção não existe");

        hasVoted[msg.sender] = true;
        votes[OptionPos.pos] = votes[OptionPos.pos] + 1;
    }
        //funções para verificar os valores de opções e quantidade votação
    function getOption() public view returns(string[] memory){
        return options;
        
    }
    function getVotes() public view returns(uint[] memory){
        return votes;
    }
    
}
