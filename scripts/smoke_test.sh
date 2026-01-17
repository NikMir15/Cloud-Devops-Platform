#!/usr/bin/env bash
set -euo pipefail

echo "Starting stack..."
docker compose up -d --build

echo "Waiting for Nginx to be ready..."
for i in {1..30}; do
  if curl -fsS http://localhost:8081/health >/dev/null 2>&1; then
    echo " Health check passed"
    curl -i http://localhost:8081/health
    docker compose logs --no-color --tail=50
    docker compose down
    exit 0
  fi
  sleep 1
done

echo " Health check failed"
docker compose ps
docker compose logs --no-color
docker compose down
exit 1
