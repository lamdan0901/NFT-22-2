// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.19;

import {ERC721} from  "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721{

  uint private tokenCounter;

  constructor() ERC721("Dogie","DOG"){
    tokenCounter = 0;
  }

  function tokenURI (uint tokenId) public view override returns (string memory){}
}