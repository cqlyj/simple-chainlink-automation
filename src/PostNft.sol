// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {ERC721URIStorage, ERC721} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract PostNft is ERC721URIStorage {
    uint256 private counter;

    constructor() ERC721("PostNft", "PN") {
        counter = 0;
    }

    function mint(address to, string memory tokenURI) external {
        _safeMint(to, counter);
        _setTokenURI(counter, tokenURI); // Store metadata URL
        counter++;
    }

    function getTokenId() public view returns (uint256) {
        return counter;
    }
}
