# Seminar 3 (released on 20/02/2024)
This is the third seminar for the Smart Contract module.
- To complete this seminar, you may need to consult the lecture material and the related reading. 
- You are expected to be able to complete it on your own, though you may work with your group.
- Aspects of the work we will do in this seminar are related to the exam assessment, like all seminars.
- Don't be afraid to ask for help!

---
## Solidity challenge puzzle

Take a look at the solidity challenge puzzle, Challenge.sol, in the same directory on the Github page, and complete the following tasks:

### Task 1
Import the challenge puzzle into your oline Remix editor, then compile and run, then deploy, the script. Ensure you can deploy and interact with the puzzle. If you are stuck at this point ask a colleague for help.

### Task 2
Take a look at the remix code, and the deployment window, then answer the following questions:
- Explain what each function does?
- What does the bool, uint256 and a bytes32 keywords mean, and what are they doing?

### Task 3
Now we are going to treat the puzzle for what it is, a challenge, and solve it.
Follow the instructions to solve the puzzle. Write down the solution string, and explain the steps you have to take to solve the puzzle.

### Task 4
Create your own smart contract puzzle based on this template. The solution must be a simple word, and you can give hints as to the word. Feel free to adapt and improve on the solidity code, or add more functions. When you are done, test it, and share this contract with the Module Leader. It will be distributed to the class.


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

<img width="561" alt="Screenshot 2024-02-16 162735" src="https://github.com/ca-carr/smart_contracts/assets/5767854/a9d4922b-f0d5-499f-ae08-bf227722a1fc">


Save both to a .txt file, called contract_address.txt and contract_abi.txt on your local machine. 


## Step 3
Fresh from your success of steps 1 and 2, we are now going to find out how we can interact with these testnet smart contracts.





