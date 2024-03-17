## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/DeployBasicNft.s.sol:DeployBasicNft --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --verify --etherscan-api-key $ETHERSCAN_API_KEY --broadcast
```

```shell
$ forge script script/DeployMoodNft.s.sol:DeployMoodNft --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --verify --etherscan-api-key $ETHERSCAN_API_KEY --broadcast
```

After deployed to sepolia testnet, copy the contract address
When minting is completed, import that address into metamask nft section 

cast send <deployed contract address> "mintFunc()" --private-key <key> --rpc-url $RPC_URL

### Mint

```shell
$ forge script script/Interactions.s.sol:MintBasicNft --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --verify --etherscan-api-key $ETHERSCAN_API_KEY --broadcast
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```

libs: forge-std, foundry-devops, openzeppelin-contracts