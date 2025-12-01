#!/usr/bin/env bash
set -euo pipefail

policies=(
  human_devops
  human_sre
  human_backend
  human_auditor
  svc_core_api
  svc_ai_gateway
  svc_notification
  svc_db_migrator
)

echo "Creating test tokens (prints token and policy). Keep tokens secure."
for p in "${policies[@]}"; do
  out=$(vault token create -policy="$p" -format=json)
  token=$(echo "$out" | jq -r '.auth.client_token')
  echo "POLICY=$p TOKEN=$token"
done
