#!/bin/bash
set -e

echo "========================================="
echo " DAO Investment DApp – Contracts Pipeline "
echo "========================================="

CONTRACTS_DIR="/workspace/packages/contracts"

if [ ! -d "$CONTRACTS_DIR" ]; then
  echo "❌ Contracts directory not found: $CONTRACTS_DIR"
  exit 1
fi

cd $CONTRACTS_DIR

echo "📦 Installing npm dependencies..."
npm install

echo "🔨 Compiling smart contracts..."
npx hardhat compile

echo "🚀 Deploying contracts (Hardhat in-memory network)..."
npx hardhat run scripts/deploy.ts --network hardhat

echo "✅ Contracts compiled, deployed, and addresses saved!"
