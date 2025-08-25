FROM ubuntu:latest

WORKDIR /worspace

RUN apt-get update && apt-get install -y \
    curl \
    git \
    python3 \
    python3-pip \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Create vscode user/group if not present, but only if UID 1000 is available
RUN if ! id -u vscode >/dev/null 2>&1; then \
      if ! getent passwd 1000 >/dev/null; then \
        groupadd -g 1000 vscode && \
        useradd -m -u 1000 -g 1000 -s /bin/bash vscode; \
      else \
        groupadd vscode && \
        useradd -m -g vscode -s /bin/bash vscode; \
      fi; \
    fi && \
    echo "vscode ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/vscode && \
    chmod 0440 /etc/sudoers.d/vscode

RUN chown 1000:1000 /worspace

USER vscode