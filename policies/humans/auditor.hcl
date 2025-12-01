# Auditor read-only access
path "secret/metadata/*" {
  capabilities = ["read", "list"]
}
