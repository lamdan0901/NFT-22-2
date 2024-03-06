// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.19;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract MoodNft is ERC721{

  error MoodNft__CantFlipMoodIfNotOwner();

  uint private tokenCounter;
  mapping(uint => Mood) private tokenIdToMood;
  string private sadSvg; 
  string private happySvg;

  enum Mood{
    HAPPY, SAD
  }

  constructor(string memory _sadSvg, string memory _happySvg) ERC721("Mood NFT", "MN"){
    tokenCounter = 0;
    sadSvg = _sadSvg;
    happySvg = _happySvg;
  }

  function mintNft()public { // string memory _tokenUri
    _safeMint(msg.sender, tokenCounter);
    tokenIdToMood[tokenCounter++] = Mood.HAPPY;
  }

  function flipMood(uint _tokenUri) public {
    // only the NFT's owner can flip the mood
    // if(!_isApprovedOrOwner(msg.sender, _tokenId)){
    //   revert MoodNft__CantFlipMoodIfNotOwner();
    // }

    tokenIdToMood[_tokenUri] = tokenIdToMood[_tokenUri] == Mood.SAD ? Mood.HAPPY : Mood.SAD;
  }

  function _baseURI() internal pure override returns (string memory){
    return "data:application/json;base64,";
  }

  function tokenURI (uint _tokenUri) public view override returns (string memory){
    string memory imgURI = tokenIdToMood[_tokenUri] == Mood.SAD ? sadSvg : happySvg;

    return 
      string(
        abi.encodePacked(
          _baseURI(),
          Base64.encode(
            bytes(
              abi.encodePacked(
                '{"name": "', name(), '",',  
                '"description": "An NFT that reflects the owners mood.",', 
                '"attributes": [{"trait_type": "moodiness", "value": 100}],', 
                '"image": "', imgURI, '"}'
              ) 
            )
          )
        )
      );
  }
}