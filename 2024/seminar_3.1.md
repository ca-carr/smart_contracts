<!--
# Seminar 3: Smart Contract Deployment and Interaction
**Release Date**: 20/02/2024

Welcome to the third seminar of the Smart Contract module. This session aims to guide you through deploying an ERC-20 token smart contract and interacting with it on the Polygon Mumbai testnet.

## Objectives
- Deploy an ERC-20 token using Solidity and OpenZeppelin.
- Interact with the deployed contract through a web interface.
- Understand the basics of adding liquidity to your token.

## Prerequisites
- Basic knowledge of Solidity, MetaMask, and web development.
- Access to lecture materials and related readings.
![Screenshot 2024-02-20 214915](https://github.com/ca-carr/smart_contracts/assets/5767854/81bfbd75-3edc-417a-80ad-019ca9a56851)

## Note
- This seminar is designed to complement your exam preparation.
- Collaboration is encouraged, but ensure you understand the material independently.
- Feel free to ask for help if needed.

---![Screenshot 2024-02-21 125204](https://github.com/ca-carr/smart_contracts/assets/5767854/5a35db11-cf47-4cb5-8b94-1afb02dc5980)


## Step 1: Setup and Tools

### Tools You'll Need
- **Solidity**: The smart contract programming language.
- **Remix IDE**: An open-source web application for developing Ethereum smart contracts.
- **MetaMask**: A crypto wallet and gateway to blockchain apps, essential for interacting with Ethereum networks.
- **Alchemy**: Provides access to blockchain networks and a faucet for obtaining testnet tokens.
- **OpenZeppelin**: Offers secure smart contract templates.

### Getting Started
1. **Browser Setup**: Download and install the [Brave browser](https://brave.com/) for enhanced privacy and built-in MetaMask support.
2. **MetaMask**: Install MetaMask in Brave and create a new, separate wallet for testing purposes.
3. **Polygon Mumbai Configuration**: Use [Chainlist](https://chainlist.org/) to add the Polygon Mumbai testnet to MetaMask.
4. **Testnet MATIC**: Obtain testnet MATIC from [Alchemy's faucet](https://www.alchemy.com/faucets/polygon-mumbai) to use in transactions.
5. **Remix IDE**: Open Remix to start developing your smart contract.
6. **OpenZeppelin Contract Wizard**: Utilize the [Contract Wizard](https://docs.openzeppelin.com/contracts/5.x/wizard) to generate your ERC-20 token contract.

### Example Contract
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract BEEMERS is ERC20, Ownable, ERC20Permit {
    constructor(address initialOwner)
        ERC20("BEEMERS", "BMR")
        Ownable(initialOwner)
        ERC20Permit("BEEMERS") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
-->

Following the steps from the previous seminar, we are now going to create our own NFT!

As an example I am going to use the image here: https://drive.google.com/file/d/1Hy9Z2DbyXc3O-LltNVZvueWFEbSEw3z6/view?usp=sharing and use it to create an NFT.

We will use a lot of the same steps from Seminar 3


## Step 1, getting your NFT image out-there

First you need to make an image you would like to upload. I suggest you simply get an image that you like that **you own**.
It can be anything.

## Step 2, uploading the image

Next we are going to use the webite https://www.pinata.cloud/ to upload our image

![Screenshot 2024-02-21 125204](https://github.com/ca-carr/smart_contracts/assets/5767854/5a35db11-cf47-4cb5-8b94-1afb02dc5980)

Once you have the image you should get a CID. 
Question, what does CID stand for?


Following the steps from the previous seminar, we are now going to create our own NFT!

We can use the Openzeppelin WIzard https://wizard.openzeppelin.com/


We are also going to need an image. The image I have chosen is at the url: https://drive.google.com/file/d/1Hy9Z2DbyXc3O-LltNVZvueWFEbSEw3z6/view?usp=sharing which is encoded in the smart contract in the Wizard. I have also selected mintable and increment ids. You do not need to do this yourself, but you can do.


![Screenshot 2024-02-20 214915](https://github.com/ca-carr/smart_contracts/assets/5767854/eb86984e-368b-4db8-934a-8f413346104f)


## Step 2

- I will now open this and deploy from Remix to my account like before



