🎯 Objective
By the end of this tutorial, you will have:

- Created a basic ERC-20 token
- Deployed it to an Ethereum-compatible network (e.g., Sepolia Testnet)
- Verified it works with MetaMask

🧰 Tools Needed

- MetaMask (browser extension)
- Remix IDE
- Test ETH (from a faucet, for deployment)
- OpenZeppelin Contracts

🛠️ Step 1: Setting Up Remix

- Open Remix
- On the left panel, click the “File Explorers” tab
- Create a new file: MyToken.sol

📜 Step 2: Write the Token Contract
Paste the following code into MyToken.sol:

```sc
solidity
Copy
Edit
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    constructor(uint256 initialSupply) ERC20("MyToken", "MTK") {
        _mint(msg.sender, initialSupply * (10 ** decimals()));
    }
}
```

🧠 This contract:

Uses OpenZeppelin’s ERC20 and Ownable libraries

Mints the total supply to the contract deployer

Uses 18 decimals (standard for ERC-20)

🔌 Step 3: Compile the Contract
Go to the Solidity Compiler tab in Remix

Make sure version is 0.8.20 or higher

Click Compile MyToken.sol

🚀 Step 4: Deploy the Contract
Go to the Deploy & Run Transactions tab

Select Injected Provider - MetaMask (it will connect Remix to MetaMask)

Make sure you’re on a testnet like Sepolia

Under “Deploy”, enter your total supply (e.g., 1000000)

Click Deploy and confirm in MetaMask

🧪 Step 5: Test the Token
After deployment, copy your contract address

In MetaMask, click “Import Tokens”

Paste the contract address

You should now see your token balance

✅ Summary
You now have a working ERC-20 token deployed on a testnet! Here's what you’ve done:

Written a compliant token contract

Used OpenZeppelin for security and standards

Deployed via MetaMask and Remix

Verified token visibility in MetaMask

