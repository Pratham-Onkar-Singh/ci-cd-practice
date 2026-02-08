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

# Pull latest code
git pull origin main

# Install dependencies and build
npm install
npm run build

# Start app
npm run start
