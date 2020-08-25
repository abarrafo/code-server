#!/usr/bin/env sh
set -eu

if [ "$DOCKER_USER" ]; then
  sudo usermod --login "$DOCKER_USER" \
    --move-home --home "/home/$DOCKER_USER" \
    coder
fi

# This isn't set by default.
export USER="$(whoami)"

dumb-init fixuid -q /usr/bin/code-server "$@"
