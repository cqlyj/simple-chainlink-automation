// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;
import {PostNft} from "./PostNft.sol";

struct Log {
    uint256 index; // Index of the log in the block
    uint256 timestamp; // Timestamp of the block containing the log
    bytes32 txHash; // Hash of the transaction containing the log
    uint256 blockNumber; // Number of the block containing the log
    bytes32 blockHash; // Hash of the block containing the log
    address source; // Address of the contract that emitted the log
    bytes32[] topics; // Indexed topics of the log
    bytes data; // Data of the log
}

interface ILogAutomation {
    function checkLog(
        Log calldata log,
        bytes memory checkData
    ) external returns (bool upkeepNeeded, bytes memory performData);

    function performUpkeep(bytes calldata performData) external;
}

contract ChainlinkAutoWorker is ILogAutomation {
    PostNft public postNFT;
    // example base URI for metadata, then just concatenate the token ID
    string private constant BASE_URI = "https://ipfs.io/ipfs/posts/";

    event PostNftMinted(
        address indexed poster,
        uint256 tokenId,
        string tokenURI
    );

    constructor(address _postNftAddress) {
        postNFT = PostNft(_postNftAddress);
    }

    function checkLog(
        Log calldata log,
        bytes memory
    ) external pure returns (bool upkeepNeeded, bytes memory performData) {
        upkeepNeeded = true;
        address poster = bytes32ToAddress(log.topics[1]);
        performData = abi.encode(poster);
    }

    function performUpkeep(bytes calldata performData) external override {
        address poster = abi.decode(performData, (address));
        uint256 tokenId = postNFT.getTokenId();
        string memory tokenURI = string(abi.encodePacked(BASE_URI, tokenId));
        postNFT.mint(poster, tokenURI);
        emit PostNftMinted(poster, tokenId, tokenURI);
    }

    function bytes32ToAddress(bytes32 _address) public pure returns (address) {
        return address(uint160(uint256(_address)));
    }
}
