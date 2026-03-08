#!/bin/bash

# git-cp
#
# Purpose:
#   Quickly switch to the repository's default branch (origin HEAD)
#   and pull the latest changes.
#
# Installation:
#   Copy this script to a location in your $PATH and name it `git-cp`,
#   for example:
#       /usr/local/bin/git-cp
#
#   Git automatically exposes executables named `git-*` as subcommands,
#   allowing this script to be run as:
#
#       git cp
#
# Usage:
#       git cp

set -e

echo "Refreshing git environment..."

HEAD_BRANCH=$(git remote show origin | grep "HEAD branch" | cut -d':' -f2 | tr -d ' ')

if [ -z "$HEAD_BRANCH" ]; then
    echo "Error: could not determine HEAD branch."
    exit 1
fi

echo "Checking out HEAD branch: $HEAD_BRANCH..."
git checkout "$HEAD_BRANCH"

echo "Pulling latest changes..."
git pull
