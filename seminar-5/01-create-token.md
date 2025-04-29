# Objective
By the end of this tutorial, you will have:

- Created a basic ERC-20 token
- Deployed it to an Ethereum-compatible network (e.g., Sepolia Testnet)
- Verified it works with MetaMask

## 🧰 Tools Needed

- MetaMask (browser extension)
- Remix IDE
- Test ETH (from a faucet, for deployment)
- OpenZeppelin Contracts

## 🛠️ Step 1: Setting Up Remix

- Open Remix
- On the left panel, click the “File Explorers” tab
- Create a new file: MyToken.sol

## Using OpenZepplin


## 📜 Step 2: Write the Token Contract
Paste the following code into MyToken.sol:

```js
// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.27;

import {ERC1363} from "@openzeppelin/contracts/token/ERC20/extensions/ERC1363.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Burnable} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {ERC20Pausable} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";
import {ERC20Permit} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract SCT161 is ERC20, ERC20Burnable, ERC20Pausable, Ownable, ERC1363, ERC20Permit {
    constructor(address initialOwner)
        ERC20("SCT161", "SCT161")
        Ownable(initialOwner)
        ERC20Permit("SCT161")
    {}

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // The following functions are overrides required by Solidity.

    function _update(address from, address to, uint256 value)
        internal
        override(ERC20, ERC20Pausable)
    {
        super._update(from, to, value);
    }
}
```

## 🧠 This contract:

Uses OpenZeppelin’s ERC20 and Ownable libraries

Mints the total supply to the contract deployer

Uses 18 decimals (standard for ERC-20)

### 🔌 Step 3: Compile the Contract
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

## ✅ Summary
You now have a working ERC-20 token deployed on a testnet! Here's what you’ve done:

Written a compliant token contract

Used OpenZeppelin for security and standards

Deployed via MetaMask and Remix

Verified token visibility in MetaMask

