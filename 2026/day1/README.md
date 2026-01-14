# DAY 1
## 0. Setup Instructions

1. **Sign up for GitHub**
    - Go to [github.com](https://github.com) and create a free account if you don't already have one.

2. **Fork this repository**
    - Navigate to the class repository: [github.com/ca-carr/smart_contracts](https://github.com/ca-carr/smart_contracts)
    - Click the **Fork** button to create your own copy of the repository under your account.

3. **Open a Codespace**
    - Go to your new forked repository on GitHub.
    - Click the green **<> Code** button and select **Codespaces**
    - Click **Create codespace on main** to open your development environment.

4. **(Optional) Use VS Code Desktop**
If you prefer working in the native VS Code application on your laptop rather than the browser, you can connect your local editor to the cloud environment.
    - Download and install [Visual Studio Code](https://code.visualstudio.com/).
    - Then install [GitHub Codespaces Extension](https://marketplace.visualstudio.com/items?itemName=GitHub.codespaces) once VS Code is installed.
    - Once your browser Codespace (from Step 3) is running:
    -  Click the **Menu** icon (three horizontal lines) in the top left of the browser editor.
    - Select **Open in VS Code Desktop** and allow the browser permission to launch the application.

### ⚠️ Important Note on Usage Limits
GitHub Codespaces is free for personal accounts, but it has monthly limits. To avoid using up your quota: **Always stop your Codespace when you are done working for the day.**

* **To Stop:** Go to [github.com/codespaces](https://github.com/codespaces), find your active codespace, click the three dots (`...`), and select **Stop codespace**.

> **Free Tier Limits:**
> * **Storage:** 15 GB-month (Files stored)
> * **Compute:** 120 hours/month (Time spent running)
>
> *Usage beyond these limits will be billed to your personal account.*

## 1. Create Your Portfolio Site
Before we build smart contracts, we need a place to showcase them. You will build a simple personal website to serve as your portfolio. Later in the course, you will link your decentralised applications (dApps) and group project here.

1. Open your portfolio directory.
```bash
cd /workspaces/smart_contracts/2026/portfolio/
```

2. Make sure our development environment is up to date.
```bash
sudo apt-get update
sudo apt-get upgrade
```
Press `y` when prompted.

3. Run a local web server on port 8000
```bash
python3 -m http.server
```
> We are using python here, and you should be prompted to open the forwarded port. You can close the web server by pressing `ctl+c` or `cmd+c`

4. **TASK:** Configure the website in `index.html` to have your name at the top, and a description of what you are doing today. 


## 2. Smart Contracts with Hardhat (ERC-20 Token)

In this section, you will set up a **new Hardhat project** from scratch, create a simple ERC-20 token using modern tooling, and deploy it to a local Hardhat blockchain.

---

### 2.1 Create a New Project Directory

Before installing Hardhat, create a dedicated directory for your smart contracts.

1. From the `2026` directory, create and enter a new folder:
```bash
cd /workspaces/smart_contracts/2026/
mkdir erc20
cd erc20
```

2. Initialize a new Node.js project:
```bash
npm init -y
```

> This will create a package.json file to manage your project dependencies.

3. Install hardhat (for reference: https://hardhat.org/docs/tutorial/setup)
```
npm install --save-dev hardhat
npx hardhat --init
```
Select hardhat-3, and to use all the defaults.

- Select Create a JavaScript project
- Accept the default options
- Install additional dependencies when prompted
- After initialization, your directory should include:
    - contracts/
    - scripts/
    - hardhat.config.js

## 2.3 Create an ERC-20 Token Contract

We will use OpenZeppelin, a widely used and audited smart contract library.

Install OpenZeppelin contracts:

```bash
npm install @openzeppelin/contracts
```

```js
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("MyToken", "MTK") {
        _mint(msg.sender, initialSupply);
    }
}
```

```bash
npx hardhat node
```