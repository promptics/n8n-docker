#!/bin/sh
set -e

# Start n8n in background
n8n start &
N8N_PID=$!

# Wait until n8n is reachable
until curl -sf http://localhost:5678/ > /dev/null; do
  echo "Waiting for n8n to start..."
  sleep 2
done

# Attempt owner setup if no user exists
node /create-user.js || true

# Wait for n8n to exit
wait $N8N_PID
