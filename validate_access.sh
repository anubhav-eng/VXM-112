#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 2 ]; then
  echo "Usage: $0 <TOKEN> <TEST_NAME>"
  exit 1
fi

TOKEN="$1"
TEST="$2"

VAULT_ADDR="${VAULT_ADDR:-http://127.0.0.1:8200}"

# helper: perform a curl to read a KV v2 secret
read_secret() {
  local path="$1"
  curl -sS --header "X-Vault-Token: $TOKEN" "$VAULT_ADDR/v1/secret/data/$path" | jq -r '.'
}

write_secret() {
  local path="$1"
  local body="$2"
  curl -sS --header "X-Vault-Token: $TOKEN" \
    --request POST --data "$body" "$VAULT_ADDR/v1/secret/data/$path" | jq -r '.'
}

echo "Running test $TEST with token (first 8 chars): ${TOKEN:0:8}..."

case "$TEST" in
  devops_allowed)
    echo "DevOps: should be able to read infra secret"
    read_secret "prod/infra/some-key" || echo "READ failed as expected"
    ;;
  backend_denied_infra)
    echo "Backend: SHOULD be denied reading infra path"
    read_secret "prod/infra/some-key" && echo "ERROR: backend could read infra" || echo "DENIED (expected)"
    ;;
  ai_write_logs)
    echo "AI gateway: write log entry"
    write_secret "prod/services/ai_gateway/logs/$(date +%s)" '{"data":{"entry":"test"}}' && echo "WROTE (expected)"
    ;;
  audit_read)
    echo "Auditor: read metadata"
    curl -sS --header "X-Vault-Token: $TOKEN" "$VAULT_ADDR/v1/secret/metadata/prod" | jq -r '.'
    ;;
  *)
    echo "Unknown test"
    exit 2
    ;;
esac
