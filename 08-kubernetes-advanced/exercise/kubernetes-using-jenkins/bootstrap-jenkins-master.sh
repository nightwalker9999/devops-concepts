#!/usr/bin/env bash
set -euo pipefail

JENKINS_HTTP_PORT="${JENKINS_HTTP_PORT:-8080}"

echo "[1/7] Update apt + install Java"
sudo apt-get update -y
sudo apt-get install -y openjdk-17-jre ca-certificates curl gnupg lsb-release

echo "[2/7] Add Jenkins repo + key"
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key \
  | sudo tee /etc/apt/keyrings/jenkins-keyring.asc >/dev/null

echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" \
  | sudo tee /etc/apt/sources.list.d/jenkins.list >/dev/null

echo "[3/7] Install Jenkins"
sudo apt-get update -y
sudo apt-get install -y jenkins

echo "[4/7] Ensure Jenkins is started and enabled"
sudo systemctl enable --now jenkins

echo "[5/7] Verify port is listening"
sudo ss -lntp | grep -E ":${JENKINS_HTTP_PORT}\b" || true

echo "[6/7] Print initial admin password (for first login)"
if sudo test -f /var/lib/jenkins/secrets/initialAdminPassword; then
  echo "==== Jenkins Initial Admin Password ===="
  sudo cat /var/lib/jenkins/secrets/initialAdminPassword
  echo "========================================"
else
  echo "initialAdminPassword not found yet. Wait a few seconds and re-run:"
  echo "sudo cat /var/lib/jenkins/secrets/initialAdminPassword"
fi

echo "[7/7] Done."
echo "Open: http://<EC2_PUBLIC_IP>:${JENKINS_HTTP_PORT}"
