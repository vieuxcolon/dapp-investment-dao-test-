FROM ubuntu:22.04

WORKDIR /workspace

# System dependencies
RUN apt-get update -y && \
    apt-get install -y curl git build-essential python3 && \
    rm -rf /var/lib/apt/lists/*

# Install Node.js 20
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

# Global tooling
RUN npm install -g typescript ts-node npm@10.8.2

# Copy repo
COPY . /workspace

# Ensure scripts are executable
RUN chmod +x /workspace/docker/run-all.sh

# Default command
CMD ["/workspace/docker/run-all.sh"]
