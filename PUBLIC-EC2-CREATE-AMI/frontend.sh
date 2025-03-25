#!/bin/bash

# Update the system
sudo yum update -y

#install git
sudo yum install git -y

# Install Apache
sudo yum install -y httpd

# Start and enable Apache service
sudo systemctl start httpd
sudo systemctl enable httpd

# Install Node.js 18 from Nodesource
curl -fsSL https://rpm.nodesource.com/setup_18.x | sudo bash -
sudo yum install -y nodejs

# Install NPM latest version
sudo npm install -g npm@latest

# Install Corepack and enable it
sudo npm install -g corepack
corepack enable

# Prepare and activate Yarn (fixing confirmation prompt)
yes | corepack prepare yarn@stable --activate

# Install Yarn globally
corepack yarn enable
yarn set version stable

# Install PM2 globally using Yarn
yarn global add pm2



