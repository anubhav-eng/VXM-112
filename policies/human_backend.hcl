# Backend engineers: read/write only to their app's secret path
path "secret/data/prod/apps/backend/*" {
  capabilities = ["read", "update", "create", "delete", "list"]
}
path "secret/data/staging/apps/backend/*" {
  capabilities = ["read", "update", "create", "delete", "list"]
}
# No ability to create tokens or read infra secrets