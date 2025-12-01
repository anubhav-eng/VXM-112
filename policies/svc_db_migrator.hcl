# db_migrator: read DB credentials; write a migration status key
path "secret/data/prod/services/db_migrator/db_credentials" {
  capabilities = ["read"]
}
path "secret/data/prod/services/db_migrator/migration_status" {
  capabilities = ["create", "read", "update", "list"]
}
