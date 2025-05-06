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

## Buying Tokens

Now that we have a sale smart contract, we should be able to buy the token just by sending it some ETH (or Sepolia ETH). 

- Make sure your contract has some tokens in it, we can do this by:
    - Minting tokens to the address or
    - Sending tokens from our first address
- Select another account that has some ETH, and create a transaction to the smart contract sale address. It should autcomatically return a token.

## Improving Our Sale Smart Contract
***Exercise:*** Think about how you could improve the sale smart contract.

- What might you like to add in?
- How would you like to improve it?
- Could you reduce deployment gas cost?
- Could you reduce gas cost for operating on the smart contract?
- What functions would you like to see?

Below is an example of improvements or changes to the smart contract you may wish to implement or deploy.

```js
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract STCSale is Ownable {
    IERC20 public immutable token;
    uint256 public rate;
    bool public available = true;

    constructor(address _token, uint256 _rate) Ownable(msg.sender) {
        token = IERC20(_token);
        rate = _rate;
    }

    receive() external payable {
        buyTokens();
    }

    function buyTokens() public payable {
        require(available, "Token buying is disabled");
        uint256 tokenAmount = msg.value * rate;
        require(token.balanceOf(address(this)) >= tokenAmount, "Not enough tokens");
        require(token.transfer(msg.sender, tokenAmount), "Transfer failed");
    }

    function withdrawETH() external onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }

    function withdrawUnsoldTokens() external onlyOwner {
        token.transfer(owner(), token.balanceOf(address(this)));
    }

    function makeTokensAvailable(bool _available) public onlyOwner {
        available = _available; 
        // true -> allow buyers to buy tokens // false -> stop buyers from buying tokens
    }

    function  tokensAvailable() public view returns(uint256) {
        return(token.balanceOf(address(this)));
    }

    function  tokensAvailableToBuy() public view returns(bool) {
        return(available);
    }

        event RateChanged(uint256 oldRate, uint256 newRate);

    function changeRate(uint256 _rate) external onlyOwner {
        emit RateChanged(rate, _rate);
        rate = _rate;
    }
}
```

## Next

- In [Part 3](03-create-sale-page.md) you will construct a front end to sell the token and interact with your smart contract.
- In [Part 4](04-listing-on-uniswap) you will list the token on [Uniswap](https://app.uniswap.org/).