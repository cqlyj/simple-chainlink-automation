// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Script, console} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {PostContract} from "src/PostContract.sol";

contract GeneratePostDataAndPostContent is Script {
    string public title = "Hello";
    string public content = "World";

    function generatePostDataAndPostContent(
        address mostRecentlyDeployed
    ) public {
        PostContract postContract = PostContract(mostRecentlyDeployed);
        bytes memory data = postContract.generatePostData(title, content);
        console.log("Generated post data: ");
        console.logBytes(data);

        postContract.postContent(data);
        console.log(
            "Posted content with title: ",
            title,
            " and content: ",
            content
        );
    }

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "PostContract",
            block.chainid
        );

        console.log(
            "Most recently deployed PostContract address: ",
            mostRecentlyDeployed
        );

        generatePostDataAndPostContent(mostRecentlyDeployed);
    }
}
