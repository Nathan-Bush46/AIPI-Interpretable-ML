FROM mcr.microsoft.com/vscode/devcontainers/python:3.12

# Make sure SSH client exists and perms look good for the mounted files
RUN apt-get update && apt-get install -y --no-install-recommends openssh-client && rm -rf /var/lib/apt/lists/*

# Known_hosts convenience (optional — avoids first-time prompt)
USER vscode
RUN mkdir -p /home/vscode/.ssh && touch /home/vscode/.ssh/known_hosts && \
    ssh-keyscan -H github.com >> /home/vscode/.ssh/known_hosts || true
