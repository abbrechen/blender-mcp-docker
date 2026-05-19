#!/bin/bash

set -e

CONTAINER_NAME="blender-mcp"
IMAGE_NAME="mcp/blender-mcp"

echo "🧨 Stopping container (if running)..."
docker stop "$CONTAINER_NAME" 2>/dev/null || true

echo "🗑️ Removing container..."
docker rm "$CONTAINER_NAME" 2>/dev/null || true

echo "🧼 Removing image: $IMAGE_NAME ..."
docker rmi "$IMAGE_NAME" 2>/dev/null || true

echo "🧽 Cleaning dangling build cache (optional)..."
docker builder prune -f

echo "🔨 Rebuilding container..."
docker compose build --no-cache

echo "✅ Done."
