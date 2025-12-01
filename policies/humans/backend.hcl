# Backend engineers should only read their own service
path "secret/data/<env>/backend/*" {
  capabilities = ["read", "list", "update"]
}
