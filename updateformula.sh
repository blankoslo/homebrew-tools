#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: $0 <version>"
  exit 1
fi

VERSION="$1"

TEMPLATE_FILE="tim.template"
FORMULA_FILE="Formula/tim.rb"

MACOS_URL="https://github.com/blankoslo/tim/releases/download/$VERSION/tim-macos.tar.gz"
LINUX_URL="https://github.com/blankoslo/tim/releases/download/$VERSION/tim-linux.tar.gz"

if [ ! -f "$TEMPLATE_FILE" ]; then
  echo "Template file '$TEMPLATE_FILE' not found." >&2
  exit 1
fi

TMPDIR=$(mktemp -d)
cleanup() { rm -rf "$TMPDIR"; }
trap cleanup EXIT

download() {
  local label="$1" url="$2" out="$3"
  echo "Downloading $label tarball..."
  if ! curl -fsSL -o "$out" "$url"; then
    echo "Error: failed to download $label tarball from $url" >&2
    # If GitHub returned 404, suggest checking release assets.
    echo "Hint: verify the asset exists for version $VERSION." >&2
    exit 1
  fi
}

download "macOS arm64" "$MACOS_URL" "$TMPDIR/tim-macos.tar.gz"
download "linux x64" "$LINUX_URL" "$TMPDIR/tim-linux.tar.gz"

MACOS_SHA=$(shasum -a 256 "$TMPDIR/tim-macos.tar.gz" | awk '{print $1}')
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
