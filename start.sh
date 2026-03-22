#!/bin/sh
set -eu

PORT="${PORT:-8080}"
NODE_ID="${NODE_ID:-1}"
BIND_HOST="${BIND_HOST:-0.0.0.0}"

echo "------------------------------------------"
echo "Starting Distributed Print Server ${NODE_ID}"
echo "Bind host: ${BIND_HOST}"
echo "Port: ${PORT}"
echo "------------------------------------------"

exec java ${JAVA_OPTS:-} -cp "build:lib/*" server.Main
