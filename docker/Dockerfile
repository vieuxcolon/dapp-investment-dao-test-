FROM ubuntu:22.04

WORKDIR /workspace

# Install dependencies
RUN apt-get update -y && \
    apt-get install -y curl git build-essential python3 python3-pip jq && \
    rm -rf /var/lib/apt/lists/*

# Install Node.js 20
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

# Install global npm packages
RUN npm install -g typescript@5.2.2 ts-node@10.9.1 next@16.1.2 react@18.2.0 react-dom@18.2.0 ethers@6.9.0

# Avoid installing Hardhat globally to fix HH12 error
# Hardhat will be installed locally via package.json

# Copy run script
COPY run-all.sh /workspace/run-all.sh
RUN chmod +x /workspace/run-all.sh
