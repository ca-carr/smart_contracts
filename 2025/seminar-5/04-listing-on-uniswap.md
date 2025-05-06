# Objective

In this final step we will:

- Add a liquidity pool on Uniswap (e.g., SCT161/ETH)
- Enable public trading of your token on uniswap
- Learn what affects the price and how liquidity works

## What You Need

Before starting, ensure you have:

- An ERC-20 token deployed (from [Part 1](01-create-erc20.md))
- Tokens in your wallet (minted to one of your addresses)
- Some ETH (or Sepolia ETH) in the same wallet

## Choose Your Pool Size

You must add equal value of each token, for example:

- You want to pair 1 ETH and 1000 SCT161
- Implied price: 1 ETH = 1000 STC161 or 1 STC161 = 0.001 ETH
- This becomes your starting market price on Uniswap.

## Add Liquidity on Uniswap

Go to [Uniswap Sepolia](https://app.uniswap.org/explore/tokens/ethereum_sepolia/0x1f9840a85d5af5bf1d1762f925bdaddc4201f984) (if using Sepolia).

- Connect your MetaMask wallet
- Click Pool → New Position
- Choose token pair:
    - Token A: ETH
    - Token B: paste your STC161 contract address

Set price range:

- Choose “Full Range” for simplicity (covers all price movement)
- Enter amounts to deposit (e.g., 1 ETH and 1,000 STC161)
- Approve the token spend (MetaMask will prompt you)

Click **Add Liquidity**

> Note: Uniswap v3 uses concentrated liquidity, so providing liquidity across the full range makes it simple but spreads your capital thin. Advanced LPs may choose a narrower range around expected price. 

## Share Your Trading Link

- Once the pool is live, users can:
- Buy or sell STC161 via the Uniswap Swap page
- Just paste your token address into the interface


<!--
To share:

Format the link like this:

bash
Copy
Edit
https://app.uniswap.org/#/swap?outputCurrency=YOUR_TOKEN_ADDRESS&chain=sepolia
Example (if token address is 0xABC...):

bash
Copy
Edit
https://app.uniswap.org/#/swap?outputCurrency=0xABC123...&chain=sepolia
✅ Anyone can now buy or sell the token based on pool liquidity

📉 How Price and Liquidity Affect Trades
Price moves based on the constant product formula x * y = k

When people buy MTK, ETH goes into the pool and MTK comes out → price rises

When people sell MTK, MTK enters and ETH exits → price falls

If your pool is small (e.g., 1 ETH), large trades will move the price a lot

📌 Optional: Verify the Token
Visit Etherscan and paste your token address

You can verify the source code (in Remix: publish to Etherscan)

Add logo, links, and metadata if you want to look professional

✅ Summary
You now have:

A live MTK/ETH market on Uniswap

Your token is tradable and visible

The market is decentralized, no intermediaries needed

🧩 Project Completion Recap
Step	What You Did
1️⃣	Created and deployed an ERC-20 token
2️⃣	Built a GitHub-hosted token sale page
3️⃣	Listed token on Uniswap and provided liquidity
You’ve built a fully open token economy, end-to-end.

-->
