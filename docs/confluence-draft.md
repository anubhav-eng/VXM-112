# Confluence Draft — Vault RBAC Story

## Purpose
Create least-privilege Vault policies for all human and machine roles.
Story 0.2.1 (Path Structure) is pending — placeholder paths used.

## Placeholder Path Format
secret/data/<env>/<team>/<service>/*

## Human Roles
- DevOps
- SRE
- Backend Engineer
- Auditor

## Machine Roles
- core_api
- ai_gateway
- notification_service

## Policy Templates
Included from Git repo.

## Test Procedure
1. vault policy write ...
2. vault token create ...
3. vault kv get allowed and disallowed paths
4. Tests must show:
   - Allowed paths = success
   - Unauthorized paths = permission denied

## Next Steps After Story 0.2.1
- Replace placeholders in policies
- Update RBAC matrix
- Re-run tests
- Publish final version
