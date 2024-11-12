// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

import {Script} from "forge-std/Script.sol";
import {PostNft} from "src/PostNft.sol";

contract DeployPostNft is Script {
    function run() external returns (PostNft) {
        vm.startBroadcast();
        PostNft postNft = new PostNft();
        vm.stopBroadcast();
        return (postNft);
    }
}
