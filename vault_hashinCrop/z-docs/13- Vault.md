[atrás](../README.md)
# Keycloak Vault

## Files de configuración
Se definie como keycloak accede a los secretos

vault-config.json
```json
{
  "vault": {
    "provider": "file",
    "file": {
      "path": "/opt/keycloak/data/vault/secrets.json"
    }
  }
}
```
file con los secreos

secrets.json
```json
{
  "db_password": "mi_contraseña_secreta",
  "admin_password": "contraseña_admin"
}
```

## Docker
```json
version: '3.9'
services:
    secrets.json:
        command: '| jq -r ".admin_password") \'
        image: secrets.json
        environment:
            - KEYCLOAK_ADMIN_PASSWORD=$(cat
            - KEYCLOAK_ADMIN=admin
        volumes:
            - '$(pwd)/secrets.json:/opt/keycloak/data/vault/secrets.json'
            - '$(pwd)/vault-config.json:/opt/keycloak/conf/vault-config.json'
        ports:
            - '8080:8080'
        container_name: keycloak
```
