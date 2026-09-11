#!/usr/bin/env bash
set -euo pipefail

export GIT_SHA="$(git rev-parse HEAD)"
export BUILD_TIME="$(date -u '+%Y-%m-%dT%H:%M:%SZ')"

docker compose up --build "$@"
