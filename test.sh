#!/bin/bash

set -e

CONTAINER_NAME="blender-mcp"

echo "🔍 Linting the Dockerfile"
docker run --rm -i hadolint/hadolint < Dockerfile

echo "🏁 Starting the container"
docker compose -p "$CONTAINER_NAME" run --rm "$CONTAINER_NAME"