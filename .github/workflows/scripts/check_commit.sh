#!/bin/bash

# make sure this script runs at the repo root
cd "$(dirname "$(realpath -e "$0")")/../../.."

set -euv

for SHA in $(curl -H "Authorization: token $GITHUB_TOKEN" "$GITHUB_CONTEXT" | jq -r '.[].sha')
do
  python3 .ci/scripts/validate_commit_message.py "$SHA"
done
