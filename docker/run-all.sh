#!/bin/bash
set -e

echo "========================================="
echo " DAO Investment DApp – Contracts Pipeline "
echo "========================================="

CONTRACTS_DIR="/workspace/packages/contracts"

# Check contracts directory exists
if [ ! -d "$CONTRACTS_DIR" ]; then
  echo "❌ Contracts directory not found: $CONTRACTS_DIR"
  exit 1
fi

cd $CONTRACTS_DIR

# Clean old node_modules (ignore errors)
echo "🧹 Cleaning old node_modules..."
rm -rf node_modules || true

# Install npm dependencies with legacy peer deps
echo "📦 Installing npm dependencies (legacy peer deps)..."
npm install --legacy-peer-deps

# Compile contracts
echo "🔨 Compiling smart contracts..."
npx hardhat compile

# Deploy contracts to Hardhat in-memory network
echo "🚀 Deploying contracts..."
npx hardhat run scripts/deploy.ts --network hardhat

echo "✅ Contracts compiled, deployed, and addresses saved!"
