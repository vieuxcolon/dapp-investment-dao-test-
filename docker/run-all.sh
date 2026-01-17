#!/bin/bash
set -e

echo "=== Docker Stack Test Container Started ==="
echo "Node version: $(node -v)"
echo "npm version: $(npm -v)"
echo "Hardhat version: $(hardhat --version)"
echo "Next.js version: $(next --version)"

# Keep container alive for inspection
tail -f /dev/null
