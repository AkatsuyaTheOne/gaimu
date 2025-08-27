FROM mcr.microsoft.com/devcontainers/base:ubuntu

WORKDIR /workspace

RUN apt-get update && apt-get install -y \
    curl \
    git \
    python3 \
    python3-pip \
    sudo \
    libx11-6 \
    libxcursor1 \
    libxinerama1 \
    libgl1 \
    libglu1-mesa \
    libxrandr2 \
    libasound2t64 \
    libpulse0 \
    libfreetype6 \
    libssl3 \
    wget \
    unzip \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Download and install Godot
RUN wget https://github.com/godotengine/godot/releases/download/4.2.1-stable/Godot_v4.2.1-stable_linux.x86_64.zip \
    && unzip Godot_v4.2.1-stable_linux.x86_64.zip \
    && mv Godot_v4.2.1-stable_linux.x86_64 /usr/local/bin/godot \
    && rm Godot_v4.2.1-stable_linux.x86_64.zip

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash \
    && source ~/.bashrc \
    && nvm install 20 \
    && npm install -g @qwen-code/qwen-code