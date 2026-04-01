#!/bin/bash
# usage: ./generate-log-remote.sh https://github.com/user/repo
set -euo pipefail

url="${1:?usage: generate-log-remote.sh <repo-url>}"
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

git clone --bare --filter=blob:none "$url" "$tmp/repo.git" >&2
git -C "$tmp/repo.git" log --pretty=format:'%ct|%aN|%H|%s' --name-status --no-renames --reverse
