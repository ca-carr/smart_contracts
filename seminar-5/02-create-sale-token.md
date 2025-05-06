# Objective

You will:

- Deploy a token sale smart contract that sells your ERC-20 token for ETH / Seoplia ETH
- Add your tokens from [Part 1](01-create-erc20.md)
- Test the contract in Remix to ensure it works as expected


## Create a Token Sale Smart Contract

Create a new contract file in Remix. We will call it `SCTSale.sol`.
The contract code looks like this below.

```js
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract STCSale is Ownable {
    IERC20 public token;
    uint256 public rate;

    constructor(address _token, uint256 _rate) Ownable(msg.sender) {
    token = IERC20(_token);
    rate = _rate;
    }

    receive() external payable {
        buyTokens();
    }

    function buyTokens() public payable {
        uint256 tokenAmount = msg.value * rate;
        require(token.balanceOf(address(this)) >= tokenAmount, "Not enough tokens");
        require(token.transfer(msg.sender, tokenAmount), "Transfer failed");
    }

    function withdraw() public onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }

    function withdrawUnsoldTokens() public onlyOwner {
        token.transfer(owner(), token.balanceOf(address(this)));
    }
}

```

## This Contract

- Needs to be *loaded* with the token we want to sell before it can be used to buy

 The constructor takes two parameters when creating the token, the first is the token address, which should be the address of the smart contract for the token we are planning on selling (the one we have created in [Part 1](01-create-erc20.md)).

```js
constructor(address _token, uint256 _rate) Ownable(msg.sender) {
    token = IERC20(_token);
    rate = _rate;
    }
```

- Accepts ETH (or Sepolia ETH), by default, and trys to run the `buyTokens()` function on `receive()`.
- Provides the rate at which you can buy the token, defined when creating the token on the constructor
- Allows anyone to buy the tokens `buyTokens()` at this fixed rate
- Allows the owner to withdraw ETH in the token or the remaining tokens

## Deploying the Contract

- Compile the contract in Remix
- In **Deploy & Run**, deploy it with:
  - _token = your ERC-20 token address, e.g. `0x61219ab4c21c81c58c62251cac4ac2d9e81fd93d`
  - _rate = tokens per ETH, e.g. 1000, so 1 ETH would give 1000 tokens, 0.01 eth would give 10 tokens etc.
- Write down this new smart contract address
- Transfer tokens to this contract address to make them available for selling


✅ Summary
You now have:

A contract that sells your ERC-20 token for ETH

A web interface to buy tokens

A GitHub-hosted frontend anyone can access