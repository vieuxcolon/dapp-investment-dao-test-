# Use a lightweight Ubuntu image
FROM ubuntu:22.04

# Set working directory
WORKDIR /workspace

# Install system dependencies
RUN apt-get update -y && \
    apt-get install -y curl git build-essential python3 && \
    rm -rf /var/lib/apt/lists/*

# Install Node.js 20
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

# Install global tooling for TypeScript
RUN npm install -g typescript@5.2.2 ts-node@10.9.1

# Copy Docker scripts (run-all.sh)
COPY docker/run-all.sh /workspace/docker/run-all.sh
RUN chmod +x /workspace/docker/run-all.sh

# Default command
CMD ["/workspace/docker/run-all.sh"]

