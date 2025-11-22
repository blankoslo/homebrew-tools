#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: $0 <version>"
  exit 1
fi

VERSION="$1"

TEMPLATE_FILE="tim.template"
FORMULA_FILE="Formula/tim.rb"

MACOS_URL="https://github.com/blankoslo/tim/releases/download/$VERSION/tim-osx.tar.gz"
LINUX_URL="https://github.com/blankoslo/tim/releases/download/$VERSION/tim-linux.tar.gz"

if [ ! -f "$TEMPLATE_FILE" ]; then
  echo "Template file '$TEMPLATE_FILE' not found." >&2
  exit 1
fi

TMPDIR=$(mktemp -d)
cleanup() { rm -rf "$TMPDIR"; }
trap cleanup EXIT

# Check if gh CLI is available
if ! command -v gh &> /dev/null; then
  echo "Error: GitHub CLI (gh) is not installed." >&2
  echo "Install it with: brew install gh" >&2
  exit 1
fi

download() {
  local label="$1" asset="$2" out="$3"
  echo "Downloading $label tarball..."
  if ! gh release download "$VERSION" --repo blankoslo/tim --pattern "$asset" --output "$out"; then
    echo "Error: failed to download $label tarball ($asset)" >&2
    echo "Hint: verify the asset exists for version $VERSION." >&2
    exit 1
  fi
}

download "osx" "tim-osx.tar.gz" "$TMPDIR/tim-osx.tar.gz"
download "linux" "tim-linux.tar.gz" "$TMPDIR/tim-linux.tar.gz"

MACOS_SHA=$(shasum -a 256 "$TMPDIR/tim-osx.tar.gz" | awk '{print $1}')
LINUX_SHA=$(shasum -a 256 "$TMPDIR/tim-linux.tar.gz" | awk '{print $1}')

# Read template and replace placeholders
TEMPLATE_CONTENT=$(<"$TEMPLATE_FILE")
TEMPLATE_CONTENT=${TEMPLATE_CONTENT//\{\{VERSION\}\}/$VERSION}
TEMPLATE_CONTENT=${TEMPLATE_CONTENT//\{\{MACOS_SHA\}\}/$MACOS_SHA}
TEMPLATE_CONTENT=${TEMPLATE_CONTENT//\{\{LINUX_SHA\}\}/$LINUX_SHA}

# Write formula
mkdir -p "$(dirname "$FORMULA_FILE")"
printf "%s\n" "$TEMPLATE_CONTENT" > "$FORMULA_FILE"

echo "Updated $FORMULA_FILE for version $VERSION (osx + linux)."
