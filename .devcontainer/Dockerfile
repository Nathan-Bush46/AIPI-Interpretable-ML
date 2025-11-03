
# ============================================================
# ✅ BASE: NVIDIA CUDA 12.3 + cuDNN 9.3 + Ubuntu 22.04
# ============================================================
FROM nvidia/cuda:12.3.2-cudnn9-devel-ubuntu22.04

# Avoid interactive prompts during build
ENV DEBIAN_FRONTEND=noninteractive

# ============================================================
# 🧰 SYSTEM SETUP
# ============================================================
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 python3-pip python3-dev \
    build-essential git wget curl openssh-client \
    && ln -sf /usr/bin/python3 /usr/bin/python \
    && pip install --no-cache-dir --upgrade pip setuptools wheel \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# ============================================================
# 🔐 SSH + GITHUB ACCESS
# ============================================================
RUN mkdir -p /root/.ssh && touch /root/.ssh/known_hosts && \
    ssh-keyscan -H github.com >> /root/.ssh/known_hosts || true

# 🧱 Fix SSH key and known_hosts permissions (for rebuilds)
# If keys are copied or mounted later, this ensures correct perms.
RUN chmod 700 /root/.ssh || true && \
    find /root/.ssh -type f -name "id_*" -exec chmod 600 {} \; || true && \
    find /root/.ssh -type f -name "*.pub" -exec chmod 644 {} \; || true && \
    chmod 644 /root/.ssh/known_hosts* || true


# ============================================================
# 🧭 CUDA ENVIRONMENT
# ============================================================
ENV CUDA_HOME=/usr/local/cuda
ENV PATH=${CUDA_HOME}/bin:${PATH}
ENV LD_LIBRARY_PATH=${CUDA_HOME}/lib64:${LD_LIBRARY_PATH}

# ============================================================
# 🗂 PROJECT SETUP
# ============================================================
WORKDIR /workspaces/SOC-Machine-Learning-in-Causal-Inference
COPY . .
ENV PYTHONPATH=src/main_workspace

CMD ["bash"]

# FROM mcr.microsoft.com/vscode/devcontainers/python:3.12

# # Make sure SSH client exists and perms look good for the mounted files
# RUN apt-get update && apt-get install -y --no-install-recommends openssh-client && rm -rf /var/lib/apt/lists/*

# # Known_hosts convenience (optional — avoids first-time prompt)
# USER vscode
# RUN mkdir -p /home/vscode/.ssh && touch /home/vscode/.ssh/known_hosts && \
#     ssh-keyscan -H github.com >> /home/vscode/.ssh/known_hosts || true
