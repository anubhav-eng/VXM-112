# ai_gateway: read model/API keys and write usage logs to its own path
path "secret/data/prod/services/ai_gateway/keys" {
  capabilities = ["read"]
}
path "secret/data/prod/services/ai_gateway/logs/*" {
  capabilities = ["create", "read", "update", "list"]
}
