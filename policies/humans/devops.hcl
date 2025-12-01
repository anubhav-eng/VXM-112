# PLACEHOLDER POLICY UNTIL PATH STRUCTURE IS FINALIZED
path "secret/data/<env>/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "secret/metadata/<env>/*" {
  capabilities = ["read", "list"]
}
