# Vault RBAC Implementation — Summary

## Purpose
Provide least-privilege policies for humans and services, ensure machine/service separation, and validate access.

## Human roles
- DevOps: ...
- SRE: ...
- Backend: ...
- Auditor: ...

## Machine roles
- core_api: ...
- ai_gateway: ...
- notification_service: ...
- db_migrator: ...

## Policy files
Location: `vault-rbac/policies/`

## How to apply
1. Export VAULT_ADDR and login as admin.
2. Run `./apply_policies.sh`.

## Test tokens & validation
1. Run `./create_test_tokens.sh` to create tokens.
2. Run the validation scripts or curl calls in the Validation section.

## Acceptance checklist
- Tokens cannot access unauthorized paths.
- All policy violations produce 403 and are fixed.
- Documentation and RBAC matrix updated.

## Change log
- <date>: created policies by <author>

