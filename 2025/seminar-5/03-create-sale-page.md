# Objective

- Create a GitHub Pages-hosted sale page where users can connect their wallet and buy tokens

- Connect your frontend to the smart contract using **Ethers.js**

***Exercise***: Since we have done this before in previous seminars, we will not go over it again. Below are some helpful snippets html and js that you can use for connecting to your token sale.

## Create the Sale Page

Create a folder called frontend/ and add the following files.

### index.html

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Buy MyToken</title>
  <script src="https://cdn.jsdelivr.net/npm/ethers@6.6.2/dist/ethers.umd.min.js"></script>
</head>
<body>
  <h1>Buy MyToken (MTK)</h1>
  <p><button onclick="connectWallet()">Connect Wallet</button></p>
  <p>
    <input type="number" id="ethAmount" placeholder="ETH amount">
    <button onclick="buyTokens()">Buy</button>
  </p>
  <script src="app.js"></script>
</body>
</html>
```

### app.js
```js

const saleAddress = "YOUR_SALE_CONTRACT_ADDRESS"; // Your sale contracts address
const saleAbi = [ // Your sale contract's ABI
  "function buyTokens() payable",
  "function rate() view returns (uint256)"
];

let provider, signer, contract;

async function connectWallet() {
  if (window.ethereum) {
    await window.ethereum.request({ method: "eth_requestAccounts" });
    provider = new ethers.BrowserProvider(window.ethereum);
    signer = await provider.getSigner();
    contract = new ethers.Contract(saleAddress, saleAbi, signer);
    alert("Wallet connected!");
  } else {
    alert("Please install MetaMask.");
  }
}

async function buyTokens() {
  const ethAmount = document.getElementById("ethAmount").value;
  const tx = await contract.buyTokens({ value: ethers.parseEther(ethAmount) });
  await tx.wait();
  alert("Tokens purchased!");
}
```

## Deploy to GitHub Pages

- Create a GitHub repository (e.g. token-sale-site)
- Push your frontend files
- Enable GitHub Pages
- Go to `repo → Settings → Pages`
- Source: main, folder: / (root)

After a few minutes, your site will be live!

### Example

If your GitHub username is alice, and repo is token-sale-site, the site will be at:

```arduino
Copy
Edit
https://alice.github.io/token-sale-site/
```
