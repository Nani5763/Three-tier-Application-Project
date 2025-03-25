#!/bin/bash

# Update the system
sudo yum update -y

#install git
sudo yum install git -y 

# Remove existing Node.js and NPM versions (if needed)
sudo yum remove -y nodejs npm

# Install Node.js 20 from Nodesource (latest LTS)
curl -fsSL https://rpm.nodesource.com/setup_20.x | sudo bash -
sudo yum install -y nodejs

# Verify installation
node -v
npm -v

# Enable Corepack (fix missing command issue)
sudo npm install -g corepack
sudo corepack enable

# Verify Corepack installation
corepack -v || echo "Corepack installation failed!"

# Manually install Yarn as a fallback
sudo npm install -g yarn

# Verify Yarn installation
yarn -v || echo "Yarn installation failed!"

# Install PM2 globally using Yarn
yarn global add pm2 || sudo npm install -g pm2

# Ensure Yarn global bin directory is in PATH
export PATH="$(yarn global bin):$PATH"

# Final verification
echo "Installed versions:"
node -v
npm -v
yarn -v
pm2 -v



