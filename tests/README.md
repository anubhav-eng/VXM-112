# Testing Vault Policies

Run a dev Vault:
vault server -dev

Apply policies:
vault policy write backend ../policies/humans/backend.hcl

Run tests:
chmod +x test-allow-deny.sh
./test-allow-deny.sh
