# Smart Contract

> Smart contract for penny auction platform.

Written in **Solidity** - Smart Contract Oriented Language.

## Usage

Install dependencies

```sh
$> yarn install
```

Inside your .env file add environmental variables

```sh
//.env file
INFURA_API_KEY=API_KEY
MNENOMIC=MNEOMIC_FROM_METAMASK
```

Compile and deploy your contract

```sh
$> truffle compile
$> truffle migrate --network rinkeby
```

This will take some time. Once it’s fully deployed copy the last txid and go to https://rinkeby.etherscan.io/tx/YOUR_LAST_TXID

To test it do

```sh
$> truffle console --network rinkeby
```

In the truffle console do

```sh
$> penny_auction = PennyAuction.at("YOUR_CONTRACT_ADDRESS")
```

## Deployment

In the future release, we will automate this process with infura.

Copy this code into **Mist Wallet** and deploy your conract.
