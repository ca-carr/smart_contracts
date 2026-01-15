# Create and Configure Your Portfolio

## 1. Create Your Portfolio Site
Before we build smart contracts, we are going to create a place to showcase them. 
You will build a simple personal website to serve as your portfolio. Later in the course, you will link your decentralised applications (dApps) and group project here. You will be able to host it all h

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

4. Configure the website in the `portfolio` directory.
    - Start with `index.html` to have your name at the top, and a description of what you are doing today. 
    - Change the styling to have a white background, and different font. Pick something you like.
    - Adjust the javascript to add any functionality you like
    - When you are happy with it, go on to step 5.

5. Continue to [part2.md](./part2.md)

