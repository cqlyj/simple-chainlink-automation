// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Script, console} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {PostNft} from "src/PostNft.sol";

contract GetTokenId is Script {
    function getTokenId(address mostRecentlyDeployed) public view {
        PostNft postNft = PostNft(mostRecentlyDeployed);
        uint256 tokenId = postNft.getTokenId();
        console.log("Token ID: ", tokenId);
    }

    function run() external view {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "PostNft",
            block.chainid
        );

        console.log(
            "Most recently deployed PostNft address: ",
            mostRecentlyDeployed
        );

        getTokenId(mostRecentlyDeployed);
    }
}
