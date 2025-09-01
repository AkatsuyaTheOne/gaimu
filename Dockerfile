FROM mcr.microsoft.com/devcontainers/base:ubuntu

ARG GODOT_VERSION=4.4.1

WORKDIR /workspace

# Install only necessary packages for Godot and the game
RUN apt-get update && apt-get install -y \
    curl \
    git \
    python3 \
    python3-pip \
    sudo \
    wget \
    unzip \
    # Essential graphics libraries for Godot
    libx11-6 \
    libxcursor1 \
    libxinerama1 \
    libgl1 \
    libglu1-mesa \
    libxrandr2 \
    # Essential audio libraries
    libasound2t64 \
    libpulse0 \
    # Node.js 20 setup
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Download and install Godot
RUN wget https://github.com/godotengine/godot/releases/download/${GODOT_VERSION}-stable/Godot_v${GODOT_VERSION}-stable_linux.x86_64.zip \
    && unzip Godot_v${GODOT_VERSION}-stable_linux.x86_64.zip \
    && mv Godot_v${GODOT_VERSION}-stable_linux.x86_64 /usr/local/bin/godot \
    && rm Godot_v${GODOT_VERSION}-stable_linux.x86_64.zip

# Install Qwen-Code globally
RUN npm install -g @qwen-code/qwen-code
