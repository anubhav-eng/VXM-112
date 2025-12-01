# Vault RBAC Matrix (Human & Machine Roles)

This document defines the least-privilege access model for all human and machine roles interacting with HashiCorp Vault.  
All permissions follow the principle of minimizing read/write scope and isolating environments.

---

# 1. Human Roles

## **DevOps Engineer**
**Purpose:** manage infra secrets, deployments, CI/CD and token creation for automation.

| Path | Capability | Notes |
|------|------------|-------|
| secret/data/prod/infra/* | create, read, update, delete, list | Full infra management |
| secret/data/staging/infra/* | create, read, update, delete, list | Infra configuration |
| secret/metadata/* | list | Basic discovery |
| auth/token/create | update, read | Create service tokens |
| secret/data/common/runbooks/* | read, list | Reference-only |

---

## **SRE**
**Purpose:** runtime operational access and monitoring integrations.

| Path | Capability | Notes |
|------|------------|-------|
| secret/data/prod/runtime/* | read, list | Runtime secrets only |
| secret/data/staging/runtime/* | read, list | As above |
| secret/data/ops/service-tokens/* | read, list | Rotate/check service tokens |
| auth/token/create | update, read | Create temporary tokens |
| secret/data/common/monitoring/* | read, list | Metrics dashboards |

---

## **Backend Engineer**
**Purpose:** manage only their application's secrets.

| Path | Capability | Notes |
|------|------------|-------|
| secret/data/prod/apps/backend/* | create, read, update, delete, list | Application config only |
| secret/data/staging/apps/backend/* | create, read, update, delete, list | No infra/runtime access |

---

## **Auditor**
**Purpose:** compliance-driven read-only access.

| Path | Capability | Notes |
|------|------------|-------|
| secret/metadata/* | read, list | Metadata only |
| secret/data/audit-logs/* | read, list | No modifications |
| secret/data/common/runbooks/* | read, list | Read-only |

---

# 2. Machine Roles (Service Identities)

Machine roles are scoped strictly to their own service-specific paths.

---

## **core_api**
| Path | Capability | Notes |
|------|------------|-------|
| secret/data/prod/services/core_api/* | read, list | Main service secrets |
| secret/data/prod/services/core_api/ephemeral/* | create, read, update, delete, list | Session keys, temp secrets |
| auth/token/roles/core_api_role | read | Issue child tokens |

---

## **ai_gateway**
| Path | Capability | Notes |
|------|------------|-------|
| secret/data/prod/services/ai_gateway/keys | read | Model keys, API keys |
| secret/data/prod/services/ai_gateway/logs/* | create, read, update, list | Usage logs |

---

## **notification_service**
| Path | Capability | Notes |
|------|------------|-------|
| secret/data/prod/services/notification/smtp | read | SMTP credentials |
| secret/data/prod/services/notification/api_keys | read | Email/SMS provider keys |

---

## **db_migrator**
| Path | Capability | Notes |
|------|------------|-------|
| secret/data/prod/services/db_migrator/db_credentials | read | DB migration credentials |
| secret/data/prod/services/db_migrator/migration_status | create, read, update, list | Migration tracking |

---

# 3. General Rules
- No human has access to another team’s app secrets.  
- No service can access another service’s secret paths.  
- No write access is given to auditors under any condition.  
- DevOps does **not** have unrestricted root-like powers.  
- All policies must be validated using test tokens.  
- All violations must produce **HTTP 403**.

---

# 4. Validation Checklist
- [ ] Each policy HCL created and committed  
- [ ] Applied to Vault using `apply_policies.sh`  
- [ ] `create_test_tokens.sh` generates tokens for each role  
- [ ] Each token tested using `validate_access.sh`  
- [ ] Unauthorized access correctly results in 403  
- [ ] Final policies documented in Confluence  

---

# 5. Notes for Future Updates
- Update mounts (e.g., `kv/`, `secret/`) as infra changes  
- Add new services or environments (dev/qa/uat) as needed  
- Integrate AppRole or Kubernetes auth later  
- Ensure all changes go through PR-based reviews  

