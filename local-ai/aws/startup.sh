#!/usr/bin/env bash
# ------------------------------------------------------------------
# Automated Docker & n8n Deployment Script for Ubuntu 22.04/24.04
# ------------------------------------------------------------------
set -euo pipefail
IFS=$'\n\t'

# --- CONFIGURATION ---
# Where your n8n Docker Compose file lives
COMPOSE_PATH="${HOME}/ai-automation-n8n"

# --- FUNCTIONS ---
info()  { printf "\033[1;34m[INFO]\033[0m %s\n" "$*"; }
error() { printf "\033[1;31m[ERROR]\033[0m %s\n" "$*" >&2; exit 1; }

# --- 1. INSTALL DOCKER ENGINE ---
info "Installing Docker Engine..."
# This script installs Docker CE, CLI, containerd, buildx & compose-plugin
curl -fsSL https://get.docker.com | sudo sh

# --- 2. ENABLE & START SERVICES ---
info "Enabling and starting Docker services..."
sudo systemctl enable --now docker containerd

# --- 3. POST-INSTALL FOR NON-ROOT USAGE ---
info "Ensuring current user is in 'docker' group..."
if ! getent group docker >/dev/null; then
  sudo groupadd docker
fi
# Add only if not already a member
if ! id -nG "${USER}" | grep -qw docker; then
  sudo usermod -aG docker "${USER}"
  info "User '${USER}' added to 'docker' group. You must log out & back in (or run: exec su -l ${USER})"
fi

# --- 4. CLONE & DEPLOY n8n ---
info "Cloning n8n repository (HTTPS)..."
if [ -d "${COMPOSE_PATH}" ]; then
  info "Directory ${COMPOSE_PATH} already exists—pulling latest changes"
  git -C "${COMPOSE_PATH}" pull --ff-only
else
  git clone https://github.com/qwedsazxc78/ai-automation-n8n.git "${COMPOSE_PATH}"
fi

info "Launching n8n with Docker Compose..."
cd "${COMPOSE_PATH}"
docker compose up -d

info "✅ Deployment complete!"
info "n8n is available at: http://localhost:5678 (or your configured host/port)"
