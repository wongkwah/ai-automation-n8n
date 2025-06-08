#!/usr/bin/env bash
set -xeuo pipefail

# --- VARIABLES ---
REPO_URL="https://github.com/qwedsazxc78/ai-automation-n8n.git"
BASE_DIR="${HOME}/ai-automation-n8n"
COMPOSE_PATH="${BASE_DIR}/local-ai/aws"

# --- 0. PREP: install git ---
sudo apt-get update -y
sudo apt-get install -y git apt-transport-https ca-certificates curl software-properties-common

# --- 1. INSTALL DOCKER ENGINE ---
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-cache policy docker-ce
sudo apt install -y docker-ce

# --- 2. ENABLE & START ---
sudo systemctl enable docker
info "Ensuring current user is in 'docker' group..."
if ! getent group docker >/dev/null; then
  sudo groupadd docker
fi
sudo usermod -aG docker $USER
sudo systemctl start docker

# --- 3. CLONE OR UPDATE YOUR REPO ---
if [ -d "${BASE_DIR}" ]; then
  echo "[INFO] ${BASE_DIR} exists → pulling latest"
  git -C "${BASE_DIR}" pull --ff-only
else
  echo "[INFO] Cloning repo into ${BASE_DIR}"
  git clone "${REPO_URL}" "${BASE_DIR}"
fi

# --- 4. LAUNCH n8n via Docker Compose ---
cd "${COMPOSE_PATH}"
sudo docker compose up -d

echo "✅ n8n deployed and running on port 5678"
