# PLACEHOLDER POLICY UNTIL PATH STRUCTURE IS FINALIZED
# DevOps: manage infra secrets for staging & prod; NOT full root
path "secret/data/prod/infra/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
path "secret/data/staging/infra/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
# Allow listing the top-level staging/prod infra
path "secret/metadata/prod/infra/*" {
  capabilities = ["list"]
}
path "secret/metadata/staging/infra/*" {
  capabilities = ["list"]
}
# Allow token creation for service accounts that DevOps manages (but not root)
path "auth/token/create" {
  capabilities = ["update", "read"]
}
# Read-only access to ops runbooks
path "secret/data/common/runbooks/*" {
  capabilities = ["read", "list"]
}
# Prevent access to other apps