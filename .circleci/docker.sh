#!/bin/bash
set -euvo pipefail
IFS=$'\n\t'

CURL_URL="$DOCKER_PUSHURL"

if [[ $CIRCLE_TAG ]]; then
  CURL_DATA='{"source_type":"Tag","source_name":"'"$CIRCLE_TAG"'"}';
else
  CURL_DATA='{"source_type":"Branch","source_name":"'"$CIRCLE_BRANCH"'"}';
fi

curl -H "Content-Type: application/json" --data "$CURL_DATA" -X POST "$CURL_URL"
