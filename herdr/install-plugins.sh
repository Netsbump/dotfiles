#!/usr/bin/env bash
set -euo pipefail

if ! command -v herdr >/dev/null 2>&1; then
  echo "herdr not found in PATH. Install it first: curl -fsSL https://herdr.dev/install.sh | sh" >&2
  exit 1
fi

# Review sidebar plugin. Pin to the currently tested commit for reproducible installs.
herdr plugin install persiyanov/herdr-reviewr --ref bfcf6b849f5cbacd08c5898cf89cd9674611c3c6 --yes
herdr server reload-config || true
