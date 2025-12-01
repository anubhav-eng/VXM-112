# SRE: read runtime secrets and rotate service tokens (no app writes)
path "secret/data/prod/runtime/*" {
  capabilities = ["read", "list"]
}
path "secret/data/staging/runtime/*" {
  capabilities = ["read", "list"]
}
# Allow read/list of service tokens metadata (rotate via dedicated path)
path "secret/data/ops/service-tokens/*" {
  capabilities = ["read", "list"]
}
# Allow creating periodic tokens for monitoring tasks
path "auth/token/create" {
  capabilities = ["update", "read"]
}
# Read-only to runbooks and dashboards credentials
path "secret/data/common/monitoring/*" {
  capabilities = ["read", "list"]
}
