#!/usr/bin/env bash
set -euo pipefail

POL_DIR="$(dirname "$0")/policies"
if [ -z "${VAULT_ADDR:-}" ]; then
  echo "Please set VAULT_ADDR (e.g. export VAULT_ADDR='https://vault.company:8200')"
  exit 1
fi

echo "Applying policies from $POL_DIR ..."
for f in "$POL_DIR"/*.hcl; do
  name=$(basename "$f" .hcl)
  echo "Writing policy $name from $f"
  vault policy write "$name" "$f"
done

echo "All policies written."
