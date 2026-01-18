#!/bin/bash
set -e

echo "========================================="
echo " DAO Investment DApp – Contracts Pipeline "
echo "========================================="

# Contracts directory inside container
CONTRACTS_DIR="/workspace/packages/contracts"

# Check contracts directory exists
if [ ! -d "$CONTRACTS_DIR" ]; then
  echo "❌ Contracts directory not found: $CONTRACTS_DIR"
  exit 1
fi

cd $CONTRACTS_DIR

# Install npm dependencies if not already present
echo "📦 Installing npm dependencies..."
npm install

# Compile contracts (force rebuild)
echo "🔨 Compiling smart contracts (force rebuild)..."
npx hardhat compile --force

# Deploy contracts using Hardhat in-memory network
echo "🚀 Deploying contracts (Hardhat in-memory network)..."
npx hardhat run scripts/deploy.ts --network hardhat

# Verify deployment JSON exists
DEPLOY_JSON="$CONTRACTS_DIR/deployments/addresses.json"

if [ -f "$DEPLOY_JSON" ]; then
  echo "✅ Deployment file exists: $DEPLOY_JSON"
  echo "📄 Contents:"
  cat "$DEPLOY_JSON"
else
  echo "❌ Deployment file not found! Something went wrong."
  exit 1
fi

echo "🎉 Contracts compiled, deployed, and verified successfully!"

