pragma solidity 0.8.18;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract TestSoulBound is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("Soul Bound Test", "SBT") {}

    function safeMint(address to, string memory tokenURI) public {        
        //Tentei implementar regras para:
        //1- Checar se a pessoa mintando é a mesma assinando a transação de mint
        //2- Não permitir caso não seja a mesma pessoa assinando
        //3- Não permitir mais de um token na carteira
        //(Não consegui)

        _tokenIds.increment(); 
        uint256 tokenId = _tokenIds.current();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, tokenURI);
    }

    function setTokenURI(uint256 tokenId, string memory tokenURI) public {
        require(_exists(tokenId), "ERC721Metadata: URI set of nonexistent token");
        _setTokenURI(tokenId, tokenURI);
    }

    function getTokenURI(uint256 tokenId) public view returns (string memory) { // get tokenURI from mapping
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");
        return tokenURI(tokenId);
    }

    function _transfer(address from, address to, uint256 tokenId) internal override {
        revert("SoulBoundToken: No transfers allowed");
    }

    //BURN: OPCIONAL. (Vai depender da regra de negócios)
    //function burn(uint256 tokenId) public {
        //require(_isApprovedOrOwner(msg.sender, tokenId), "SoulBoundToken: caller is not owner nor approved");
        //_burn(tokenId);
    //}
}
