FROM mcr.microsoft.com/devcontainers/base:ubuntu

WORKDIR /workspace

RUN apt-get update && apt-get install -y \
    curl \
    git \
    python3 \
    python3-pip \
    sudo \
    && rm -rf /var/lib/apt/lists/*