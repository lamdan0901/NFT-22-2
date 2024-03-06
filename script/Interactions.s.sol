// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract MintBasicNft is Script{
  string public constant PUG_URI =
    "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

  function run() external {
    address mostRecentlyDeployedContract 
      = DevOpsTools.get_most_recent_deployment("BasicNft", block.chainid);
    minNftOnContract(mostRecentlyDeployedContract);
  }

  function minNftOnContract(address nftContractAddress) public  {
    vm.startBroadcast();//returns(uint256)

    BasicNft(nftContractAddress).mintNft(PUG_URI);

    vm.stopBroadcast();
  }
}