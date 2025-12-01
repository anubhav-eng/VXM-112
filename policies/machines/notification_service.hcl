# notification_service: only SMTP and provider API keys for notifications
path "secret/data/prod/services/notification/smtp" {
  capabilities = ["read"]
}
path "secret/data/prod/services/notification/api_keys" {
  capabilities = ["read"]
}
# No write or access to other services' keys
