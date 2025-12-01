#!/bin/bash

VAULT_ADDR="http://127.0.0.1:8200"

echo "=== Testing Backend Policy ==="
TOKEN=$(vault token create -policy="backend" -ttl=1h -format=json | jq -r '.auth.client_token')

echo "Token created: $TOKEN"

echo "---- Allowed path test (backend) ----"
VAULT_TOKEN=$TOKEN vault kv get secret/data/dev/backend/test || echo "FAILED allowed path"

echo "---- Denied path test (core_api) ----"
VAULT_TOKEN=$TOKEN vault kv get secret/data/dev/core_api/test && echo "ERROR: Should have been denied"
