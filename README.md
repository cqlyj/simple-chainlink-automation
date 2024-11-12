# Sample Contract Addresses on Sepolia Testnet

```bash
contract PostNft 0x305E14F19250f73304E616BED338c77A89Fac295
contract PostContract 0xa88EBDC0c4BfF4606ecf9080Bfeb1af5eB2d422a
contract ChainlinkAutoWorker 0x247cA86024d1D63678d0f9090deDd58962D9B1C1
```

# Getting Started

## Requirements

- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  - You'll know you did it right if you can run `git --version` and you see a response like `git version x.x.x`
- [foundry](https://getfoundry.sh/)
  - You'll know you did it right if you can run `forge --version` and you see a response like `forge 0.2.0 (816e00b 2023-03-16T00:05:26.396218Z)`

## Quickstart

```
git clone https://github.com/cqlyj/simple-chainlink-automation
cd simple-chainlink-automation
make
```

# Usage - Just see the effects

1. Set up your environment variables:

```bash
cp .env.example .env
```

2. Fill in the `.env` file with your own values.
3. Run the command below:

```bash
make getTokenId
```

You should see output like this:

```bash
0x0000000000000000000000000000000000000000000000000000000000000001
```

Because I have test it once, so the token id is 1. By the time you run it, it may be other number.

4. Run another command:

```bash
make postContent
```

Once transaction is confirmed, you need to wait a bit for the chainlink node to finish the job. Then you can run the command below:

```bash
make getTokenId
```

You should see output like this:

```bash
0x0000000000000000000000000000000000000000000000000000000000000002
```

The token Id will increase by 1 which means the chainlink node has mint a new NFT for you.
