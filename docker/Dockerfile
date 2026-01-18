FROM ubuntu:22.04

WORKDIR /workspace

# System dependencies
RUN apt-get update -y && \
    apt-get install -y curl git build-essential python3 && \
    rm -rf /var/lib/apt/lists/*

# Node.js 20
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

# Minimal global tooling
RUN npm install -g typescript ts-node

# Copy repo
COPY . /workspace

# Ensure entrypoint is executable
RUN chmod +x /workspace/docker/run-all.sh

# Default command
CMD ["/workspace/docker/run-all.sh"]
