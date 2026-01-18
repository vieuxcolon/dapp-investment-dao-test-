#!/bin/bash
set -e

echo "========================================="
echo " DAO Investment DApp – Contracts Pipeline "
echo "========================================="

# Absolute paths inside Docker
CONTRACTS_DIR="/workspace/packages/contracts"
DEPLOYMENTS_DIR="$CONTRACTS_DIR/deployments"
DEPLOY_JSON="$DEPLOYMENTS_DIR/addresses.json"

# Ensure contracts folder exists
if [ ! -d "$CONTRACTS_DIR" ]; then
  echo "❌ Contracts directory not found: $CONTRACTS_DIR"
  exit 1
fi

# Install npm dependencies with legacy peer deps to fix ERESOLVE
echo "📦 Installing npm dependencies (legacy peer deps)..."
npm --prefix "$CONTRACTS_DIR" install --legacy-peer-deps

# Compile contracts (force rebuild)
echo "🔨 Compiling smart contracts..."
npx hardhat --config "$CONTRACTS_DIR/hardhat.config.ts" compile --force --project "$CONTRACTS_DIR"

# Deploy contracts
echo "🚀 Deploying contracts (Hardhat in-memory network)..."
npx hardhat --config "$CONTRACTS_DIR/hardhat.config.ts" run "$CONTRACTS_DIR/scripts/deploy.ts" --network hardhat

# Verify deployment JSON exists
if [ -f "$DEPLOY_JSON" ]; then
  echo "✅ Deployment file exists: $DEPLOY_JSON"
  echo "📄 Contents:"
  cat "$DEPLOY_JSON"
else
  echo "❌ Deployment file not found! Something went wrong."
  exit 1
fi

echo "🎉 Contracts compiled, deployed, and verified successfully!"
