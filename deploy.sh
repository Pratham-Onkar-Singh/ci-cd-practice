#!/bin/bash
set -e

echo "Starting deployment..."

# Load nvm
export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"

# Use Node 22
nvm use 22

echo "Node version:"
node -v

# Go to project directory
cd ~/ci-cd-practice

# Pull latest code and merge both states in ec2 and github
git fetch origin main
git reset --hard origin/main

# Install dependencies and build
npm install
npm run build

# Start app
pm2 restart ci-cd-practice || pm2 start npm --name "ci-cd-practice" -- start

echo "Deployment finished"