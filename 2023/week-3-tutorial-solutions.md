<!-- 
### Full tutorial solutions provided on Tuesday 7 Feb

## Part 0: Representing numbers

* 0.A) Complete the table from Week 2

Completed in lectures

* 0.B) Using the website block explorer https://blockchair.com/bitcoin/, take a look the latest block in Bitcoin. Select the hex string that is the block's header. Using whatever tools you like, convert this block header to binary and decimal. 

Walkthrough of this problem given in lectures, the block will start with a large number of leading zeros, such as '00000000000000a8...', when we express these in binary, for each 00 in hex we will have eight zeros in binary, so 00000000, resulting in a binary string of 256-bits, with a lot of 0s before the first 1 appears. In decimal, this number will be large, but significantly smaller than the maximum possible value of $2^{256}-1 = 115792089237316195423570985008687907853269984665640564039457584007913129639935$. 


* 0.C) Do the same for 0.B, as for block number 1 in Bitcoin, using https://blockchair.com/bitcoin/. How do the numbers compare between 0.B and 0.C? Why is this?

You will again see something similar to 0.B, but there will be fewer leading zeros. When converting the value to binary and decimal, we will see that the decimal equivalent will be far larger than the value from 0.B. This is because it is now harder to create a block in Bitcoin, and so as the difficulty has increased, the target value has decreased, so that now to create a block, the decimal equivalent of the hash output must be below a lower value.


---
## Part 1: Hash functions

Take a look at the following five text samples, A, B, C, D and E (taken from the works of A. Conan Doyle).

These texts may have been altered or manipulated, and our job is to discern the legitimate texts from the altered ones. Fortunately, to aid our task, we have the hash output (or message-digest) from one of the texts, and a partial hash output for another.

The hash output from one text is the SHA-256 digest: `a4a2f8a5 fb46f363 836a52d2 18711aa9 8b474bb9 0a6d756c 191b453e 2f63a027` \
From another text we have the partial digest: `154f7e42`, which is the last 4 bytes of the SHA-256 hash function applied to the original text.

### Task 
Using the online tool <a href="https://cryptii.com/"> cryptii</a>, identify all of the legitimate texts and all the illegitimate ones.
> Make sure to calibrate cryptii to take text input, apply the correct hash function, and produce hexadecimal output

Try to answer the questions: How can we be sure of the legitimacy? What is the purpose of the hash function in this case? 

What might we call a partial digest, and can we comment on its security? 

> Where have the identified illegitimate texts been changed?
Now that you know which text is the legitimate text, you can find the illegitimate one, by comparing the text in the lines (HINT: a famous Swedish group?)

To answer this question, we can note that A and C are very similar texts, and so are B, D and E. 
Using Cryptii we can identify that the sha-256 hash of C outputs the final four bits `154f7e42`, and that E produces the string: `a4a2f8a5 fb46f363 836a52d2 18711aa9 8b474bb9 0a6d756c 191b453e 2f63a027`.

In this case _legitimacy_ is defined on the hashes (message digests) that we are given. Since we know what the hashes are, we can say that any message that produces that hash is legitimate, based on the premise of the question. 

Th purpose of the hash function is message integrity. Since we have texts that are very similar, and hard to distinguish by hand, the hash function allows us to identify legitimate texts, and illegitimate ones. Even a small change in the text produces a vastly different output which is easy to recognise, even by human eyes. 

The `154f7e42` is a partial digest, and can sometimes be called a fingerprint, integrity check digits, or a checksum. In terms of security, it is not as secure as providing an entire hash output, but it is useful for checking the validity when the security is not the crucial issue, such as data formatting, or ensuring that a message has been entered correctly without error. Bitcoin address generation does this for example.

> Where have the identified illegitimate texts been changed?
One of the text contains a sentence about the band ABBA, the others are very minor changes. Can you find them? This is left as an exercise for the reader. 


---
## Part 2 Digital Signatures and Encryption

### 2.1:

Take a look at the shared module document on ELE, in Row 2, columns E, F, G, H, I. 

Using the software tool Kleopatra from https://gpg4win.org/download.html, or whichever tool you prefer, complete the following: 

* 1.A) Import the public key
* 1.B) Check the public key and the fingerprint, what is the process, what is the fingerprint?
* 1.C) Verify the signatures of the messages in G, and H. 
  * What does each message say?
  * Are they both valid messages?
* 1.D) Try to decrypt the message in column I. What problems do you encounter and why?

For those using Linux or Windows based operating systems Kleopatra should be supported. For those using MAC, you can use GPG Suite (or if you are happy with the terminal, we can work there using the gpg commands).
This is explained in the video lectures on Week 4.


### 2.2:

Now we are going to generate our own key-pair and share it (you will need to work with someone to do this task)

* 2.A) Generate a key pair
* 2.B) Export the public key, and share it on the shared module document on ELE under column E, and share your key fingerprint under column F
* 2.C) Sign a message -- it can be anything you want (keep it acceptable!) -- and publish the signed message under column G, have a colleague verify your message
* 2.D) Encrypt a message to a colleague of your choice -- it can be anything you want (keep it acceptable!) -- and answer the questions:
  * What process do you have to take to encrypt the message?
  * How is this different from the message signature aspect. 

The solutions for the tasks in Part 2 are to follow through the steps above. For the two questions at the end, you are expected to think about how you need the public key of the recipient before you can encrypt a message to them, whereas you can sign a message immediately.
Encryption is different as only the recipient can actually view the message, whereas the public nature of the signature is essential to the verifiability.

---

## Part 3 Smart Contracts in Bitcoin
This part of the tutorial focuses on Bitcoin smart contracts.

Bitcoin defines a stack based smart contract language, that is not turing complete! 

Note! You should be confident that you can give a reasonable answer the following questions:
> * What is Turing Completeness in simple terms? 
> * Why is Bitcoin's scripting language not turing complete?
> * Do we realistically expect to have turing completeness in any smart contract platform?

	
For the following problems we may wish to make use of the Bitcoin script reference guide: https://en.bitcoin.it/wiki/Script\
You should also use the following online graphical editor: https://siminchen.github.io/bitcoinIDE/build/editor.html


### 3.1:

Compute the following two prpblems below by hand, and write out the value in the stack at each step. 

-------------------------
Here is an example for: 4 2 op_mul

| Step	| Stack |	Explanation |
|-------|-------|---------------|
| 0 |  | Initail empty stack | 
| 1		| 4		| Added 4 to stack |
| 2		| 4 2	| Added 2 to stack |
| 3		| 4 2 op_mul	| Added op_mul to stack and exectuted op_mul multiplying 2 by 4 in that order |
|4		|8		 | Added result of op_mul to stack |

-------------------------
* 1.A)  4 7 3 op_max op_min

| Step	| Stack |	Explanation |
|-------|-------|---------------|
| 0     |       | Initail empty stack | 
| 1		  | 4		  | Added 4 to stack |
| 2		  | 4 7	  | Added 7 to stack |
| 3		  | 4 7 3 | Added 3 to stack |
| 4		  | 4 7 3 op_max	| Added op_max to stack and exectuted op_max for max of 3 and 7 retruning 7 to stack |
| 5		  | 4 7 op_min    | Added op_min to stack and exectuted op_min for min of 4 and 7 retruning 4 |
| 6		  | 4 	    |  |

-------------------------
* 1.B)  4 7 op_mul 5 op_mod 

| Step	| Stack |	Explanation  |
|-------|-------|---------------|
| 0   		  |       	  | Initial empty stack | 
| 1		  | 4		  | Added 4 to stack |
| 2		  | 4 7	  	  | Added 7 to stack |
| 3		  | 4 7 op_mul    | Added op_mul to stack and executed op_mul to multiply 4 by 7, returning 1C to stack |
| 4		  | 1C 5 op_mod   | Added op_mod to stack and executed op_mod to take 1C (or 28 in decimal), and return 28 Modulo 5 = 3 |
| 5		  | 3		  |  |

--------------------------
### 3.2:

Consider the function: (5×3) MOD 4 == 3
* 2.A) In words, explain what the function does
This function first multiples 5 by 3 then applied the modulo 4 function, before checking if this value is equal to 3. 

X modulo 4 ( or x mod 4) means that we continually reduce the number by 4, until we have a value within the range 0 to 3. So in this case, 15 MOD 4, means we reduce the value 15 by 4 three times, and the result is the value we are left with, giving: 15 – (4*3) = 3.
Modulo is used in mathematics and computer science frequently. We also use it in our everyday lives, such as the calendar: every 365 days we reset the day of the year to 1 Jan, and with the clock. We can represent 14.35 as 2.35 quite happily without having to add 2.35pm (as we usually don’t schedule events for 2.35 in the am).

* 2.B) Create a script using opcodes that executes the function.
The script would be 5 3 op_mul 4 op_mod 3 op_equalverify

* 2.C) Test your script using the online editor
Try to write a stack diagram of this solution. Can you solve this another way? 
	
### 3.3:

The following is a common script you might find in Bitcoin.

```
1. 304402205fc2ccf4a060cf860ad76b5933755f8ad1de54c35977fea56f3c4e0fc743990202204879136e0ad6244
1be86b9bafa831b622b63d592e859da80e3dd2cea79422560010373a3ee36354282bc8b6bd44ea4d2fcec4270f1d88
bcb8275028ae2e4dd1d2b45 
2. op_dup 
3. op_hash160
4. 66E955357C003F18D1669840924B78135784570A
5. op_equalverify
6. op_checksig
```

3.A) What is this kind of script usually called? 

P2PKH or Pay to Public Key Hash

3.B) write down what each text string represents at lines 1 and 4.

Line 1 represents the public key, line 4 represents the hash of the public key.

3.C) Write down what each function does at lines 2, 3, 5 and 6.

Line 2 duplicates the public key on line 1. \
Line 3 performs the address generation algorithm on the public key value that is now at the top of the stack. \
Line 5 checks to see if the two items on the top of the stack are equal, and only if so continues the execution of the script. \
Line 6 takes a signature and a public key as input and returns true only if the signature is a valid signature corresponding to that public key.

3.D) Is this script valid? If not, why not? 

No, the output of op_hash160 on the public key from Line 1, returns a different output to the one appearing on Line 4. This means that op_equalverify aborts the execution. 

3.E) What would happen if we changed line 4 to `2CB3A540E8CF726A3D563D7A0F350724FCDB34FC`, does the script now execute correctly? If not, why not?
It would get past line 5, op_equalverify, as the op_hash160 of the public key  is equal to the address at line 10, however it does not execute as valid. This is because op_checksig needs a signature parameter as well as a public key, and no signature is provided. 

## Extra

Consider the altered transaction from 3.3, what is this extra information on Line 1?
```
1. 304402205fc2ccf4a060cf860ad76b5933755f8ad1de54c35977fea56f3c4e0fc743990202204879136e0ad6244
1be86b9bafa831b622b63d592e859da80e3dd2cea7942256001
2. 0373a3ee36354282bc8b6bd44ea4d2fcec4270f1d88bcb8275028ae2e4dd1d2b45 
3. op_dup 
4. op_hash160
5. 66E955357C003F18D1669840924B78135784570A
6. op_equalverify
7. op_checksig
```

This extra information is the signature on the script, it is one of the inputs taken by the op_checksig command. This returns true, and so the transaction script is valid. 
-->
