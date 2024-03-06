// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";
import {MoodNft} from "../src/MoodNft.sol";

contract DeployMoodNft is Script {
  function run() external returns (MoodNft){
    string memory sadSvg = vm.readFile("./images/moodNft/sad.svg");
    string memory happySvg = vm.readFile("./images/moodNft/happy.svg");

    vm.startBroadcast();
    MoodNft moodNft = new MoodNft(svgToImgURI(sadSvg), svgToImgURI(happySvg));
    vm.stopBroadcast();
    return moodNft;
  }

  function svgToImgURI(string memory _svg) public pure returns (string memory) {
    string memory baseURL = "data:image/svg+xml;base64,";
    string memory encodedSvg = Base64.encode(bytes(string(abi.encodePacked(_svg))));
    return string(abi.encodePacked(baseURL, encodedSvg));
  }
}