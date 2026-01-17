#!/usr/bin/env bash
set -euo pipefail

APP_DIR="$HOME/cloud-devops-platform"
REPO_URL="https://github.com/NikMir15/Cloud-Devops-Platform.git"

if ! command -v docker >/dev/null 2>&1; then
  echo "Docker not found. Install Docker first."
  exit 1
fi

if ! docker compose version >/dev/null 2>&1; then
  echo "Docker Compose v2 not found. Install docker compose plugin."
  exit 1
fi

mkdir -p "$APP_DIR"
if [ ! -d "$APP_DIR/.git" ]; then
  git clone "$REPO_URL" "$APP_DIR"
fi

cd "$APP_DIR"
git pull origin main

echo "Pulling latest image and restarting..."
docker compose -f docker-compose.prod.yml pull
docker compose -f docker-compose.prod.yml up -d

echo "Done. Checking health..."
curl -i http://localhost:8081/health
