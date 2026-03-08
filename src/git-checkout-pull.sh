#!/bin/bash
set -e

echo "Refreshing git environment..."

HEAD_BRANCH=$(git remote show origin | grep "HEAD branch" | cut -d':' -f2 | tr -d ' ')

if [ -z "$HEAD_BRANCH" ]; then
    echo "Error: could not determine HEAD branch!"
    exit 1
fi

echo "Checking out HEAD branch: $HEAD_BRANCH..."
git checkout "$HEAD_BRANCH"

echo "Pulling latest changes..."
git pull
