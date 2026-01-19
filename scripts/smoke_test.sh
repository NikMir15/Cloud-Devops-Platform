#!/usr/bin/env bash
set -euo pipefail

URL="http://localhost:80"
MAX_RETRIES=30
SLEEP_SECONDS=2

echo "Smoke test: waiting for Nginx to be ready at ${URL}"

for i in $(seq 1 $MAX_RETRIES); do
  if curl -sS -I "${URL}" >/dev/null; then
    echo "Nginx is reachable on attempt ${i}"
    echo "Response headers:"
    curl -sS -I "${URL}"
    exit 0
  fi

  echo "Attempt ${i}/${MAX_RETRIES} failed. Retrying in ${SLEEP_SECONDS}s..."
  sleep "${SLEEP_SECONDS}"
done

echo "Smoke test failed: Nginx not reachable at ${URL} after ${MAX_RETRIES} attempts"
echo "---- docker compose ps ----"
docker compose ps || true
echo "---- nginx logs ----"
docker logs cloud-devops-platform-nginx-1 || true
exit 1
