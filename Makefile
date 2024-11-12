-include .env

all : install build

build :; @forge build

install:
	@forge install OpenZeppelin/openzeppelin-contracts --no-commit && forge install smartcontractkit/chainlink-brownie-contracts --no-commit && forge install cyfrin/foundry-devops --no-commit

deploy-postNft:
	@forge script script/DeployPostNft.s.sol:DeployPostNft --rpc-url $(SEPOLIA_RPC_URL) --private-key $(PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) --legacy -vvvv

deploy-postContract:
	@forge script script/DeployPostContract.s.sol:DeployPostContract --rpc-url $(SEPOLIA_RPC_URL) --private-key $(PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) --legacy -vvvv

deploy-chainlinkAutoWorker:
	@forge script script/DeployChainlinkAutoWorker.s.sol:DeployChainlinkAutoWorker --rpc-url $(SEPOLIA_RPC_URL) --private-key $(PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) --legacy -vvvv

# getTokenId:
# 	@forge script script/PostNftInteraction.s.sol:GetTokenId --rpc-url $(SEPOLIA_RPC_URL) --private-key $(PRIVATE_KEY) --broadcast -vv

getTokenId:
	@cast call ${POSTNFT_ADDRESS} "getTokenId()" --rpc-url ${SEPOLIA_RPC_URL}

generatePostData:
	@cast send ${POSTCONTRACT_ADDRESS} "generatePostData(string,string)" "Hello" "World" --private-key ${PRIVATE_KEY} --rpc-url ${SEPOLIA_RPC_URL}

postContent:
	@cast send ${POSTCONTRACT_ADDRESS} "postContent(bytes)" 0x00000000000000000000000000000000000000000000000000000000000000200000000000000000000000005b73c5498c1e3b4dba84de0f1833c4a029d90519000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000a0000000000000000000000000000000000000000000000000000000000000000548656c6c6f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005576f726c64000000000000000000000000000000000000000000000000000000  --private-key ${PRIVATE_KEY} --rpc-url ${SEPOLIA_RPC_URL}

# generatePostDataAndPostContent:
# 	@forge script script/PostContractInteraction.s.sol:GeneratePostDataAndPostContent --rpc-url $(SEPOLIA_RPC_URL) --private-key $(PRIVATE_KEY) --broadcast -vv