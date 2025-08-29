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
    libxkbcommon0 \
    libxkbcommon-x11-0 \
    libxi6 \
    libxrender1 \
    libxss1 \
    libxt6 \
    libxtst6 \
    libgl1-mesa-dri \
    libegl1 \
    libegl-mesa0 \
    libgles2 \
    libgtk-3-0 \
    libasound2-dev \
    alsa-base \
    alsa-utils \
    pulseaudio \
    # Node.js 20 setup
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Download and install Godot
RUN wget https://github.com/godotengine/godot/releases/download/4.2.1-stable/Godot_v4.2.1-stable_linux.x86_64.zip \
    && unzip Godot_v4.2.1-stable_linux.x86_64.zip \
    && mv Godot_v4.2.1-stable_linux.x86_64 /usr/local/bin/godot \
    && rm Godot_v4.2.1-stable_linux.x86_64.zip

# Install Qwen-Code globally
RUN npm install -g @qwen-code/qwen-code
