# Deploy Your Portfolio to GitHub Pages (from `main`, redirecting to `2026/portfolio`)

## 1. Open the Repository in Your Browser
We will host the portfolio using GitHub Pages. The site files live in `2026/portfolio`, but GitHub Pages (deploy-from-branch mode) publishes from the repository root, so add a root redirect to send visitors to your portfolio folder.

Open the repository on GitHub:
https://github.com/ca-carr/smart_contracts/tree/main

Confirm the portfolio folder exists:
`2026/portfolio/`

## 2. Create a Codespace for the Repo
Use your Codespace to edit files and test the website locally:

- Click the green **Code** button.
- Click the **Codespaces** tab.
- Click **Create codespace on main**.

This opens VS Code in the browser with a terminal and file explorer.

## 3. Run the Portfolio Locally in the Codespace
Before deploying, check that your site works locally.

Open your portfolio directory:
```bash
cd /workspaces/smart_contracts/2026/portfolio/
```

Run a local web server on port 8000:
```bash
python3 -m http.server 8000
```

Open the forwarded port when prompted. Stop the server with Ctrl+C (Windows/Linux) or Cmd+C (Mac).

## 4. Enable GitHub Pages (Deploy From Branch)
Configure GitHub Pages to publish from the `main` branch (in GitHub, not Codespaces):

- Go to **Settings → Pages**
- Under **Build and deployment**:
    - **Source:** Deploy from a branch
    - **Branch:** `main`
    - **Folder:** `/ (root)`
- Click **Save**

GitHub Pages will publish the repository root at:
`https://ca-carr.github.io/smart_contracts/`

## 5. Add a Root Redirect to Your Portfolio
Because the site lives in `2026/portfolio/`, add an `index.html` at the repo root that redirects visitors to the portfolio page.

### Option A: Create the redirect file in Codespaces

Go to the repo root in the terminal:
```bash
cd /workspaces/smart_contracts
```

Create a root `index.html` with a redirect:
```html
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="refresh" content="0; url=./2026/portfolio/" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Redirecting…</title>
    </head>
    <body>
        <p>Redirecting to <a href="./2026/portfolio/">2026/portfolio</a>…</p>
    </body>
</html>
```

Commit and push the change:
```bash
git add index.html
git commit -m "Add root redirect to 2026/portfolio"
git push
```

### Option B: Create the redirect file in GitHub (browser-only)

- In the repo, click **Add file → Create new file**
- Name it `index.html`
- Paste the redirect HTML (same as above)
- Commit directly to `main`

## 6. Confirm Your Live GitHub Pages URLs
Once Pages finishes building, your site URLs will be:

- Base GitHub Pages site (repo root):  
    `https://ca-carr.github.io/smart_contracts/`
- Portfolio folder directly:  
    `https://ca-carr.github.io/smart_contracts/2026/portfolio/`

With the redirect in place, visiting the base URL will forward to the portfolio URL.

## 7. Troubleshooting
Quick checks if something doesn’t work.

- 404 on the base site
    - Confirm **Settings → Pages** is set to `main` and `/ (root)`.
    - Confirm you pushed `index.html` to the repo root.

- Redirect works but portfolio page 404s
    - Confirm the folder name is exactly `2026/portfolio/`
    - Confirm there is an `index.html` inside:
        ```bash
        ls -la /workspaces/smart_contracts/2026/portfolio/
        ```

- Changes not showing
    - Pages can take a short time to update after a push.
    - Check Actions (or **Settings → Pages**) to see the latest build status.

## 8. Continue
Continue developing your portfolio in:
```bash
cd /workspaces/smart_contracts/2026/portfolio/
```

When you update your site, commit and push:
```bash
git add .
git commit -m "Update portfolio"
git push
```

## 9. Part 2: Connect Your ERC-20 Token to Your Web3 Frontend

The following are things you may need to consider: 

### Gather token details
- Copy your deployed contract address and confirm the network (e.g., Sepolia).
- Export the ABI (Remix compile artifacts) and save it in the repo, e.g. `./abi/ERC20.json`.

### Add ethers to your frontend
- Install for local dev: `npm install ethers` (or use a browser build and include `<script src="./path/to/ethers.min.js"></script>`).
- Ensure your JS loads with relative paths so GitHub Pages serves it correctly.

### Detect & connect a wallet in javsacript
```js
if (!window.ethereum) throw new Error('MetaMask not detected');
const accounts = await window.ethereum.request({ method: 'eth_requestAccounts' });
const userAddress = accounts[0];
```
- Show a persistent “Connect Wallet” button and store connected state.

### Create provider and signer (using ethers v6 maybe)
```js
const provider = new ethers.BrowserProvider(window.ethereum);
const signer = await provider.getSigner();
```

### Instantiate the contract
```js
const abi = await fetch('./abi/ERC20.json').then(r => r.json());
const token = new ethers.Contract(tokenAddress, abi, signer /* or provider for readonly */);
```

### Read token data
```js
const [name, symbol, decimalsBN, totalSupplyBN] = await Promise.all([
    token.name(),
    token.symbol(),
    token.decimals(),
    token.totalSupply()
]);
const decimals = Number(decimalsBN);
const totalSupply = ethers.formatUnits(totalSupplyBN, decimals);
const balanceBN = await token.balanceOf(userAddress);
const balance = ethers.formatUnits(balanceBN, decimals);
```
- Display name, symbol, decimals, totalSupply and user balance.

### Write (transfer) with transaction status
```js
async function transferTokens(to, humanAmount) {
    try {
        const amount = ethers.parseUnits(humanAmount, decimals);
        const tx = await token.transfer(to, amount); // signer required
        showStatus('Pending', tx.hash);
        const receipt = await tx.wait(); // waits for confirmation
        showStatus('Confirmed', receipt.transactionHash);
    } catch (err) {
        showError(err);
        showStatus('Failed');
    }
}
```
- Provide UI feedback for pending/confirmed/failed states.

### Network safety checks
```js
const network = await provider.getNetwork();
if (network.chainId !== EXPECTED_CHAIN_ID) {
    // prompt user to switch networks (EIP-3326 / wallet request)
}
```
- Prompt users to switch if chainId mismatches.

### UX improvements
- “Connect Wallet” / “Connected” states.
- Truncate addresses for display (e.g., 0x1234…abcd).
- Clear, user-friendly error messages (e.g., rejected signatures, insufficient funds).
- Disable action buttons while transactions are pending.

### Handle token amounts correctly
- Convert user-facing amounts ↔ base units with decimals:
    - To send: ethers.parseUnits(humanAmount, decimals)
    - To display: ethers.formatUnits(bigIntAmount, decimals)

### Event-driven updates
```js
token.on('Transfer', (from, to, value, event) => {
    // refresh balances and UI when relevant transfer occurs
});
```
- Use events to auto-refresh balances after transfers or approve changes.

### Approve / allowance flow
```js
await token.approve(spender, ethers.parseUnits(amount, decimals));
const allowanceBN = await token.allowance(owner, spender);
const allowance = ethers.formatUnits(allowanceBN, decimals);
```
- Optionally demonstrate transferFrom using a spender account.

### Persistence & reconnect
- Save last connected address: `localStorage.setItem('lastAccount', address)`.
- On page load, re-check and re-connect if the user previously connected.

### GitHub Pages hardening
- Use relative paths for ABI and assets (e.g., `./abi/ERC20.json`, `./js/app.js`) so URLs work under `https://username.github.io/repo/`.
- Avoid absolute imports that assume root `/` paths.
- Keep all static JSON/JS/CSS inside the repo and reference them relatively.

Replace placeholders (EXPECTED_CHAIN_ID, tokenAddress, decimals) with your actual values and wire the UI pieces to these functions for a complete dApp experience.

## 10. When complete, tell the Module Leader!
