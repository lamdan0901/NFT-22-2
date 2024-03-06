// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.19;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721{

  uint private tokenCounter;
  mapping(uint => string) private tokenURIs;

  constructor() ERC721("Dogie", "DOG"){
    tokenCounter = 0;
  }

  function mintNft(string memory _tokenUri)public {
    _safeMint(msg.sender, tokenCounter);
    tokenURIs[tokenCounter++] = _tokenUri;
  }

  function tokenURI (uint _tokenUri) public view override returns (string memory){
    return tokenURIs[_tokenUri]; 
  }
}