## 2. Wallets, Browsers, and Testnet ETH Setup

In this section, you will set up a **clean browser environment**, install **crypto wallets**, and obtain **Ethereum testnet ETH**.


## 2.1 Install a Fresh Browser (Choose One)

To avoid conflicts with existing extensions or cached wallets, **install a fresh browser** and use it only for this course. You can remove it later. 

Choose **one** of the following (pick one you dont already have):

- **Google Chrome**  
  https://www.google.com/chrome/

- **Mozilla Firefox**  
  https://www.mozilla.org/firefox/

- **Brave Browser** (privacy-focused, Chromium-based)  
  https://brave.com/download/

We will use this browser exclusively for blockchain development work.



## 2.2 Install MetaMask (Ethereum Wallet)

**MetaMask** is a widely used Ethereum wallet. A wallet is required for interacting with Ethereum testnets, Remix and other tools.

🔗 https://metamask.io/download/


1. Install MetaMask as a browser extension on your new browser.
2. Create a **new wallet**.
3. Securely store your **Secret Recovery Phrase** (do NOT share it). *why not?*
4. Leave MetaMask set to its default settings for now.

> ⚠️ Never share your recovery phrase. Anyone with it can access and move your funds.

Question. How does the recovery phrase work. How can it be used to access your wallet?



## 2.3 Install Phantom Wallet (Multi-Chain Wallet)

**Phantom** is a wallet that supports **Ethereum (EVM)**, **Solana**, and other chains. We can also use this wallet for the work on this course. 

🔗 https://phantom.app/download


1. Install Phantom as a browser extension.
2. Create a **new wallet**.
3. Securely store the recovery phrase.
4. Ensure **Ethereum** is enabled inside Phantom settings.



## 2.4 Switch MetaMask to an Ethereum Testnet

We will use the Ethereum testnet **Sepolia**. There are other test networks, but at the current time of writing Sepolia is the easiest to manage.

1. Open **MetaMask**.
2. Click **Settings** → **Advanced**.
3. Enable **Show test networks**.
4. Return to the main MetaMask view.
5. Open the network dropdown at the top.
6. Select **Sepolia**.

If you do not find the RPC Server Address, you can use the one here: https://ethereum-sepolia-rpc.publicnode.com 


## 2.5 Get Testnet ETH (Sepolia)

You need **Ethereum testnet ETH** to deploy contracts and send transactions.  
Testnet ETH has **no real-world value** and is distributed for free via **faucets**.

> ⚠️ If you do not have any ETH (or testnet ETH in this case), we will not be able to make transactions or create smart contracts, thus this step is required.

### Step 1: Make Sure Sepolia Is Available in MetaMask

Sepolia is the current standard Ethereum test network, but it may not be visible by default. See the step above for changing to the test network.

### Step 2: Copy Your Wallet Address

1. Make sure MetaMask is set to **Sepolia**.
2. Click your account name to copy your wallet address.
3. Keep this address handy, you will paste it into a faucet.

### Step 3: Get Sepolia ETH (Easiest First)

#### ✅ Option A: Google Cloud Sepolia Faucet (Recommended & Easiest)

🔗 **https://cloud.google.com/application/web3/faucet/ethereum/sepolia**

- Sign in with a **Google account**
- Paste your MetaMask address
- Request Sepolia ETH

This is currently the most reliable option and works well for our use case.

#### Option B: Alchemy Sepolia Faucet

🔗 https://sepoliafaucet.com/

- Requires a GitHub or Alchemy login
- Paste your MetaMask address
- Request test ETH



#### Option C: Infura Sepolia Faucet

🔗 https://www.infura.io/faucet/sepolia



#### Option D: QuickNode Faucet

🔗 https://faucet.quicknode.com/ethereum/sepolia


### Step 4: Share ETH With Your Classmates

Once you have Sepolia ETH, you can share it by sending to another classmate. Alternatively you can send it to your own Phantom wallet address.

1. Ask a classmate for their Sepolia wallet address.
2. Send them a small amount (e.g. `0.002 ETH`).
3. Confirm they receive it.

Congratulations, you have made a real transaction that will remain on the testnet chain. You can look up that transaction using the transaction id on a testnet block explorer.

## 2.6 Checkpoint

You should now have:
- A fresh new browser installed
- MetaMask installed and set to **Sepolia**
- Phantom installed
- Testnet ETH in your MetaMask wallet

You are now ready to:
- Deploy contracts from Remix using **Injected Provider – MetaMask**
- Connect wallets to web applications
- Interact with the Ethereum testnet

## 2.7 Next Steps

Go to [part3.md](./part3.md) where we will start to deploy an ERC20 token.  

