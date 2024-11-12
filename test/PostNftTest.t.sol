// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {Test} from "forge-std/Test.sol";
import {PostNft} from "src/PostNft.sol";

// not testing anything, just to pass the github action

contract PostNftTest is Test {
    PostNft postNft;

    function setUp() external {
        postNft = new PostNft();
    }

    function testPostNftInitialCounter() external view {
        assertEq(postNft.getTokenId(), 0);
    }
}
