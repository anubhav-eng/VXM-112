# core_api application placeholder policy
path "secret/data/<env>/core_api/*" {
  capabilities = ["read", "list"]
}
