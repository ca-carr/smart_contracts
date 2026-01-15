# DAY 1; Part 2;  ERC-20 Token in Remix

In this lab, you will create and deploy a **standard ERC-20 token** using **Remix IDE** (browser-based). You’ll deploy first to the **Remix VM** (a simulated chain that runs in your browser), then run simple on-chain interactions (mint check, transfers).

> Remix runs entirely in the browser at https://remix.ethereum.org/ and requires no local setup.  
> When you deploy using the **Remix VM**, the contract exists **only in your browser** (it is not on a public network).

---

## Learning outcomes

By the end you should be able to:
- Write a minimal ERC-20 token using **OpenZeppelin Contracts**
- Compile in Remix with the correct compiler version
- Deploy to the **Remix VM**
- Interact with your deployed contract (read balance, transfer)

---

## 2. ERC-20 Token with Remix

### 2.1 Open Remix and Create a Workspace

**TASKS**
1. Open Remix in your browser: https://remix.ethereum.org/.
2. In the left sidebar, open the **File Explorer**.
3. Create a new workspace (optional but recommended):
   - Click the workspace dropdown → **Create** → name it `erc20-lab`.

---

### 2.2 Create the Token Contract

We’ll use **OpenZeppelin Contracts** (industry-standard implementations of token standards). citeturn2view2

**TASKS**
1. In the `contracts/` folder, create a new file named: `MyToken.sol`. citeturn2view0
2. Paste this contract:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Import OpenZeppelin ERC20 from a tagged release (stable version).
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v5.4.0/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("MyToken", "MTK") {
        _mint(msg.sender, initialSupply);
    }
}
```

> Why this import?  
> Using a **tagged release** avoids pulling “moving target” code from a branch. OpenZeppelin Contracts releases are documented as a reusable library for secure smart contract development. citeturn2view2turn1view1  
> (The ERC-20 pattern shown here matches OpenZeppelin’s standard approach: inherit `ERC20`, set name/symbol, mint initial supply to deployer.) citeturn1view1

---

### 2.3 Compile in Remix

**TASKS**
1. Click the **Solidity Compiler** tab (the “S” icon).
2. Set **Compiler Version** to **0.8.20** (or higher 0.8.x).  
   - This must match the `pragma solidity ^0.8.20;` line.
3. Turn on **Auto compile** (recommended).
4. Click **Compile MyToken.sol**.
5. Confirm you see a **green checkmark** (successful compile).

---

### 2.4 Deploy to the Remix VM (Local Simulation)

**TASKS**
1. Click **Deploy & Run Transactions** (the Ethereum logo / “play” panel).
2. In **Environment**, choose **Remix VM** (the simulated in-browser chain).
3. Under **Contract**, select `MyToken`.
4. In the deploy input field for `initialSupply`, enter an amount in “base units”:
   - Example: `1000000000000000000000` (this represents **1000 tokens** with **18 decimals**)
5. Click **Deploy**.

**CHECKPOINT**
- Your contract should appear under **Deployed Contracts** with an address.
- Remember: deployments on Remix VM exist only in your browser. citeturn1view3

---

### 2.5 Interact with Your Token (Core Tasks)

Under **Deployed Contracts**, expand `MyToken`.

**TASKS**
1. **Read your balance**
   - Find `balanceOf(address)`
   - Paste your current account address (shown at the top of Deploy & Run)
   - Click `balanceOf`
   - Confirm you have the full initial supply
2. **Transfer tokens to another account**
   - In the account dropdown at the top, switch to a different Remix VM account and copy its address
   - Switch back to the original deployer account
   - Call `transfer(recipient, amount)`
     - Example amount: `10000000000000000000` (10 tokens with 18 decimals)
   - Verify the recipient received tokens with `balanceOf(recipient)`

**OPTIONAL TASK**
3. Explore ERC-20 metadata
   - Call `name()`, `symbol()`, `totalSupply()`

---

## Extension Tasks (Save for Later)

These are **advanced tasks** that you will do after the Remix VM version works.

### A. Deploy to a Public Testnet (Injected Provider)

Remix can deploy through your wallet using **Injected Provider – MetaMask** (this connects Remix to MetaMask for real testnet transactions). citeturn2view1

**TASKS (Later)**
1. Install MetaMask and switch to an EVM testnet (commonly **Sepolia**).
2. Get testnet ETH from a faucet (required to pay gas). citeturn2view0
3. In Remix → **Deploy & Run** → set **Environment** to **Injected Provider – MetaMask**. citeturn2view1
4. Deploy `MyToken` again with a sensible `initialSupply`.
5. Record:
   - Contract address
   - Network name
   - Deployer address

### B. Build a Webpage to Connect to Testnet

**TASKS (Later)**
1. Create a simple webpage that:
   - Connects to MetaMask
   - Reads `balanceOf()` for the connected wallet
2. Add a “Transfer” form that calls `transfer()`.

---

## Deliverables

1. A deployed ERC-20 token on the Remix VM
2. Evidence of:
   - Your deployer balance
   - One successful transfer to a second account
3. A short write-up (2–4 sentences) describing:
   - Token name/symbol
   - Initial supply
   - What you tested (balance + transfer)
