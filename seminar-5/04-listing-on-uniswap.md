# Objective
In this tutorial, you will:

- Add a liquidity pool on Uniswap (e.g., MTK/ETH)
- Enable public trading of your token
- Learn what affects the price and how liquidity works

## What You Need
Before starting, ensure you have:

- An ERC-20 token deployed (from 01-)
- Tokens in your wallet (you minted them to yourself)
- Some ETH in the same wallet

- You should also have completed the private sale (Step 2), or reserved some tokens for this liquidity pool.

## Step 1: Choose Your Pool Size
You must add equal value of each token.
Example:

You want to pair 1 ETH and 10,000 MTK

Implied price: 1 ETH = 10,000 MTK or 1 MTK = 0.0001 ETH

This becomes your starting market price on Uniswap.

## Step 2: Add Liquidity on Uniswap

Go to https://app.uniswap.org

Connect your MetaMask wallet

Click Pool → New Position

Choose token pair:

Token A: ETH

Token B: paste your MTK contract address

Set price range:

Choose “Full Range” for simplicity (covers all price movement)

Enter amounts to deposit (e.g., 1 ETH and 10,000 MTK)

Approve the token spend (MetaMask will prompt you)

Click Add Liquidity

💡 Tip: Uniswap v3 uses concentrated liquidity, so providing liquidity across the full range makes it simple but spreads your capital thin. Advanced LPs may choose a narrower range around expected price.

🔗 Step 3: Share Your Trading Link
Once the pool is live, users can:

Buy or sell MTK via the Uniswap Swap page

Just paste your token address into the interface

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

