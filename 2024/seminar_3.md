# Seminar 3 (released on 20/02/2024)
This is the third seminar for the Smart Contract module.
- To complete this seminar, you may need to consult the lecture material and the related reading. 
- You are expected to be able to complete it on your own, though you may work with your group.
- Aspects of the work we will do in this seminar are related to the exam assessment, like all seminars.
- Don't be afraid to ask for help!

---


# Deploying smart contracts

## Step 1, the tools: Solidity, Remix, MetaMask, Alchemy and OpenZeppelin

First download a clean browser. We reccomend downloading the Brave browser https://brave.com/ 
then loading up Brave, you can install MetaMask.

It is important that you do not use a MetaMask that you use for real. This is only for the test.

Now you should have something that looks like:
<img width="800" alt="Screenshot 2024-02-16 154007" src="https://github.com/ca-carr/smart_contracts/assets/5767854/32c11f5d-6231-4d0e-88e4-246ae5cdb90a">


Now we need to configure MetaMask to use the Polygon Mumbai chain. We can find out the details and add it at https://chainlist.org/ 

In our Brave browser we need to:
- go to https://chainlist.org/
- search for the Polygon network
- Select include testnets
- Connect to Polygon Mumbai


Now we need to sign up to the website Alchemy to get some testnet coins, which we will use later.
To get the coins: 
- https://www.alchemy.com/faucets/polygon-mumbai
- Sign up to alchemy if you need to
- Insert your address and select 'send me MATIC'

Once this is all done we can open Remix in our brave browser and open a contract file. 
- In the contract foler we are going to make a new solidity smart contract for a ERC-20 token. This allows us to create our own tokens!

Rather than do this from scratch, we are going to follow a template. We can use OpenZeppelin for the templates: https://docs.openzeppelin.com/contracts/5.x/wizard

We are going to use the contract wizard, here is some code we have made earlier 
```sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract BEEMERS is ERC20, Ownable, ERC20Permit {
    constructor(address initialOwner)
        ERC20("BEEMERS", "BMR")
        Ownable(initialOwner)
        ERC20Permit("BEEMERS")
    {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }


    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
```

## Step 2
We are now going to deply the contract on the Polygon testnet network.
First we are importning the code, then we are going to Compile and run the script as before.

To do this, we go to the deployment section
<ol>
    <li> Select Deploy   </li>
    <li> Select Injected Provider - MetaMask (you may have to authorise MetaMask) </li>
    <li> Select the one account that you should have </li>
    <li> Make sure that the account you have is in the deploy section, and hit deploy (again you may have to authorise MetaMask) </li>
</ol>
The steps correspond to the image
<img width="800" alt="Screenshot 2024-02-16 160643" src="https://github.com/ca-carr/smart_contracts/assets/5767854/935f59ce-89a5-4cbe-bc72-4747747af803">

In a few seconds you should get a confirmation that your smart contract has been deployed on the network, huzzah!

Now before we stop here, it is important that we note down a couple of things that we will need for the next step. The first is the contract address. In the example here it is $0x28520f1196b15bbc66278c0c2ec5c2dc99da2975$, and we will need the contract ABI, which is very long, but starts like:

```js
[
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "spender",
				"type": "address"
			},
			{
				"internalType": "uint256",
				"name": "value",
				"type": "uint256"
			}
		],
		"name": "approve",
		"outputs": [
	...
 ...
 ...
 ... 
]
```
<img width="800" alt="Contract ABI" src="https://github.com/ca-carr/smart_contracts/assets/5767854/89df04f4-13d5-44a8-9ecd-5d65683bdc81">

<img width="800" alt="Contract address" src="https://github.com/ca-carr/smart_contracts/assets/5767854/6325888d-e579-4faf-89db-1a4b229b9a50">

Save both to a .txt file, called contract_address.txt and contract_abi.txt on your local machine, in a fresh local directory called seminar3.

<img width="561" alt="Screenshot 2024-02-16 162735" src="https://github.com/ca-carr/smart_contracts/assets/5767854/a9d4922b-f0d5-499f-ae08-bf227722a1fc">

## Step 3
Fresh from your success of steps 1 and 2, we are now going to find out how we can interact with these testnet smart contracts.

First we need to install Visual Studio Code (VS code), linke here: https://code.visualstudio.com/download

Once installed we will open it, and navigate to our local directory we created called seminar3. 
It should look something like the image below.

<img width="800" alt="Contract address" src="https://github.com/ca-carr/smart_contracts/assets/5767854/653ce67c-8cfb-4134-8d46-a17b57996924">

 Now we are going to test our connection to the local server. 

First create a new file called connect.html, and enter the code below. We can do this in VS code.
 ```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Connect to MetaMask</title>
    <script>
        async function connectToMetaMask() {
            if (typeof window.ethereum !== 'undefined') {
                console.log('MetaMask is installed!');
                // Request account access, errors will be logged to the console automatically
                const accounts = await window.ethereum.request({ method: 'eth_requestAccounts' });
                console.log('Connected account:', accounts[0]);
            }
        }
    </script>
</head>
<body>
    <button onclick="connectToMetaMask()">Connect to MetaMask</button>
</body>
</html>
```

Next we are going to install the Live Server Extension in VS Code. The extensions panel is 5 steps dowwn on the left of the VS Code display.
<img width="800" alt="Contract address" src="https://github.com/ca-carr/smart_contracts/assets/5767854/d3f1f93f-47f6-43cd-993c-0babac9f87a1">

Select to install it, and once it is installed we will navigate to our seminar3 folder in VS Code, then right click on connect.html and select Open With Live Server.

Now we should see our website open in our broawer. Since this will likely not be our Brave browser (where we have our testnet account), we can copy and paste the URL into our brave browser. The URL should look something like: http://127.0.0.1:5500/connect.html

Now we should be able to press the connect button and MetaMask will prompt us to connect to the website. 

We can also disconnect to the webiste from MetaMask itself. This is somehting we should take care to do.

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>BEEMERS Contract Interaction</title>
    <script src="https://cdn.jsdelivr.net/npm/web3@1.3.0/dist/web3.min.js"></script>
</head>
<body>
    <h1>BEEMERS Contract Interaction</h1>
    <button id="connectButton">Connect to MetaMask</button>
    <div id="mintFunction" style="display:none;">
        <input type="text" id="mintToAddress" placeholder="Address to Mint To">
        <input type="number" id="mintAmount" placeholder="Amount to Mint">
        <button onclick="mintTokens()">Mint Tokens</button>
    </div>

    <script>
        let web3;
        let myContract;
        const contractABI = [ COPY IN YOUR ABI ];
	const contractAddress = ' COPY IN YOUR ADDRESS ';

        window.addEventListener('load', async () => {
            if (typeof window.ethereum !== 'undefined') {
                web3 = new Web3(window.ethereum);
                myContract = new web3.eth.Contract(contractABI, contractAddress);
            } else {
                alert('MetaMask is not installed.');
            }

            document.getElementById('connectButton').addEventListener('click', async () => {
                try {
                    await window.ethereum.request({ method: 'eth_requestAccounts' });
                    document.getElementById('mintFunction').style.display = 'block';
                } catch (error) {
                    console.error('Could not connect to MetaMask:', error);
                }
            });
        });

        async function mintTokens() {
            const mintToAddress = document.getElementById('mintToAddress').value;
            const mintAmount = document.getElementById('mintAmount').value;
            const accounts = await web3.eth.getAccounts();
            const account = accounts[0]; // Using the first account in MetaMask

            try {
                const mintReceipt = await myContract.methods.mint(mintToAddress, web3.utils.toWei(mintAmount, 'ether')).send({ from: account });
                console.log('Mint transaction receipt: ', mintReceipt);
                alert('Minting successful!');
            } catch (error) {
                console.error('Minting failed: ', error);
                alert('Minting failed!');
            }
        }
    </script>
</body>
</html>
```




