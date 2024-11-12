// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

import {Script} from "forge-std/Script.sol";
import {PostContract} from "src/PostContract.sol";

contract DeployPostContract is Script {
    function run() external returns (PostContract) {
        vm.startBroadcast();
        PostContract postContract = new PostContract();
        vm.stopBroadcast();
        return (postContract);
    }
}
