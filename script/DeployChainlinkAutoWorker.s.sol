// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

import {Script} from "forge-std/Script.sol";
import {ChainlinkAutoWorker} from "src/ChainlinkAutoWorker.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract DeployChainlinkAutoWorker is Script {
    address mostRecentlyDeployedPostNft =
        DevOpsTools.get_most_recent_deployment("PostNft", block.chainid);

    function run() external returns (ChainlinkAutoWorker) {
        vm.startBroadcast();
        ChainlinkAutoWorker chainlinkAutoWorker = new ChainlinkAutoWorker(
            mostRecentlyDeployedPostNft
        );
        vm.stopBroadcast();
        return (chainlinkAutoWorker);
    }
}
