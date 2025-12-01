# Auditor: read-only access to metadata and allowed secret paths; no plaintext writes
path "secret/metadata/*" {
  capabilities = ["list", "read"]
}
path "secret/data/audit-logs/*" {
  capabilities = ["read", "list"]
}
# Allow reading read-only runbooks and ownership metadata
path "secret/data/common/runbooks/*" {
  capabilities = ["read", "list"]
}
# Deny write access to secret values by omission
