# core_api service: only its own secrets; can create ephemeral keys under its path
path "secret/data/prod/services/core_api/*" {
  capabilities = ["read", "list"]
}
path "secret/data/prod/services/core_api/ephemeral/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
# If core_api needs to create tokens via a role, expose only a specific endpoint (example)
path "auth/token/roles/core_api_role" {
  capabilities = ["read"]
}
