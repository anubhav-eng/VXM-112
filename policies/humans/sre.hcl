# SRE placeholder access
path "secret/data/<env>/ops/*" {
  capabilities = ["read", "list", "update"]
}

path "sys/health" {
  capabilities = ["read"]
}
