#!/usr/bin/env bash
# Update a Homebrew Cask file's version + sha256 from the latest GitHub Release.
# Usage: scripts/update-cask.sh Casks/foo.rb
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "usage: $0 <cask-file>" >&2
  exit 2
fi

file="$1"
if [ ! -f "$file" ]; then
  echo "$file: not found" >&2
  exit 1
fi

slug=$(grep -oE 'github\.com/[^/"]+/[^/"]+' "$file" | head -1 | sed 's|github\.com/||')
if [ -z "$slug" ]; then
  echo "$file: no GitHub URL found" >&2
  exit 1
fi

release=$(gh release view --repo "$slug" --json tagName,assets)
new_version=$(echo "$release" | jq -r '.tagName' | sed 's/^v//')
cur_version=$(awk -F'"' '/^[[:space:]]+version[[:space:]]+"/ {print $2; exit}' "$file")

if [ "$cur_version" = "$new_version" ]; then
  echo "$file: already $cur_version"
  exit 0
fi

url_template=$(awk -F'"' '/^[[:space:]]+url[[:space:]]+"https:/ {print $2; exit}' "$file")
new_url=$(echo "$url_template" | sed "s|#{version}|$new_version|g")
asset_name=$(basename "$new_url")

sha=$(echo "$release" | jq -r --arg n "$asset_name" '.assets[] | select(.name == $n) | .digest // ""' | sed 's/^sha256://')
if [ -z "$sha" ] || [ "$sha" = "null" ]; then
  echo "$file: asset not found or missing digest: $asset_name" >&2
  exit 1
fi

sed -i '' \
  -e "s/^  version \"[^\"]*\"\$/  version \"$new_version\"/" \
  -e "s/^  sha256 \"[^\"]*\"\$/  sha256 \"$sha\"/" \
  "$file"

echo "$file: $cur_version -> $new_version"
