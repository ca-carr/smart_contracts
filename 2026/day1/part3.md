# Part 3:  ERC-20 Token in Remix

You will create and deploy a **standard ERC-20 token** using the **Remix IDE**.  
You will first deploy to the **Remix VM**, then deploy to **Sepolia** using MetaMask.

Remix runs entirely in the browser, so we don't need to set up a development environment.
https://remix.ethereum.org/

***Note, there is no detail in the steps below. That is on purpose, for you to lean and fill in.***
   - Work together
   - Read documentation
   - Ask you colleagues for help
   - Use tools, such as AI
   - Ask the lecturer for help

## Learning outcomes

By the end of this lab, you should be able to:
- Create an ERC-20 token using OpenZeppelin
- Compile and deploy a smart contract in Remix
- Interact with a deployed token (balance, transfer)
- Understand the difference between a local VM and a public testnet


## Tasks

### 1. Open Remix

- Open https://remix.ethereum.org/
- Create a new workspace called `erc20-lab` (recommended)


### 2. Create an ERC-20 Token

- In the `contracts/` folder, create a new token
- Use OpenZeppelin’s ERC-20 implementation (latest stable release)
- Your token **must**:
  - Inherit from `ERC20`
  - Set a name and symbol
  - Mint an initial supply to the deployer

> Hint: take a look at https://wizard.openzeppelin.com/ for a template, standard, smart contract 

> You are expected to determine the correct compiler version and imports.


### 3. Compile the Contract

- Select an appropriate Solidity compiler (`0.8.x`)
- Compile your contract
- Fix any errors or warnings before continuing


### 4. Deploy to Remix VM

- Open **Deploy & Run Transactions**
- Set **Environment** to `Remix VM`
- Deploy your token with a non-zero initial supply
- Confirm the contract appears under **Deployed Contracts**

---

### 5. Interact with Your Token

Using the deployed contract:

- Check the deployer’s balance
- Transfer tokens to another account
- Verify balances after the transfer
- Inspect token metadata (`name`, `symbol`, `totalSupply`)

### 6. Deploy to Sepolia

Once you are happy with you token contract, you can deploy it to the Sepolia network. 

- Switch Remix environment to **Injected Provider – MetaMask**
- Ensure MetaMask is connected to **Sepolia**
- Deploy the same token contract to the testnet
- Record the contract address

Next we can create a new webpage in our portfolio section to connect to this token. 

### 7. Connect to a Webpage

- Build a simple webpage that:
  - Connects to MetaMask
  - Reads `balanceOf()` from your deployed contract
  - Reads other features, such as token name etc.


## Deliverables

Submit:
1. Token name and symbol
2. Initial supply
3. One Remix VM contract address
4. Evidence of a successful token transfer
5. Sepolia contract address
6. Webpage connected to the token