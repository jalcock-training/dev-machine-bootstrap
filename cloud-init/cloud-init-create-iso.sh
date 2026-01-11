#!/usr/bin/env bash
set -e

CLOUD_INIT_DIR="$(cd "$(dirname "$0")" && pwd)"
ISO_OUTPUT=~/Downloads/rocky-dev-cloud-init.iso

genisoimage \
  -output "$ISO_OUTPUT" \
  -volid cidata \
  -joliet -rock \
  -input-charset "utf-8" \
  "./user-data" \
  "./meta-data"

echo "Created cloud-init ISO at $ISO_OUTPUT"
