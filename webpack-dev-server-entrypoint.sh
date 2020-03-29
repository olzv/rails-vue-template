#!/bin/bash
# Created by https://github.com/olzv
set -e

while [[ "$(curl -s -o /dev/null -w '%{http_code}' app:3000)" != "200" ]]; do
  echo "App not ready, waiting ..."
  sleep 2;
done

exec "$@"
