#!/usr/bin/env bash
set -euo pipefail

echo "[1/6] Update apt + install Java"
sudo apt-get update -y
sudo apt-get install -y openjdk-17-jre ca-certificates curl gnupg lsb-release

echo "[2/6] Install Docker (Ubuntu repo docker.io)"
sudo apt-get install -y docker.io
sudo systemctl enable --now docker

echo "[3/6] Add current user to docker group"
sudo usermod -aG docker "$USER"

echo "[4/6] Smoke test docker (may require re-login)"
docker --version || true

echo "[5/6] Create Jenkins workspace dir"
mkdir -p "$HOME/jenkins-agent-workdir"

echo "[6/6] Done."
echo "IMPORTANT: logout/login (or reboot) so docker group takes effect."
echo "Then run: docker ps"
