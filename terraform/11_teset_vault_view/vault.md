
# Vault
## Vault config
Unseal Key: aVLNY5i2uzr9+3gc8R38wlhJA53tOmqpZfESu4Af0N4=
Root Token: pruebas123

export VAULT_ADDR='http://0.0.0.0:8200'
export VAULT_ADDR='http://172.16.1.201:8200'

export VAULT_TOKEN='pruebas123'


- Para habilitar el motor de secretos de tipo key-value
```bash
vault secrets enable -path=secret kv
```

- Create a secrets
```bash
vault kv put secret/myapp/database \
instance_name="pruebas_instance" \
instance_pass="pruebas123"
```

- JSON file
```bash 
vault secrets enable -path=terraform kv
```
```bash
vault kv put terraform/state @terraform.tfstate
```
verfiicar que el file se ha alamcenado
```bash
vault kv get terraform/state
```
ver contenido
```bash
vault kv get -format=json terraform/state
```

eliminar file del vault
```bash
vault kv delete terraform/state
```


## Todos los motores de secretos

1. **Key-Value (KV)**
   - **Descripción**: Almacena datos sensibles en un formato clave-valor.
   - **Comando**:
     ```bash
     vault secrets enable -path=secret kv
     ```

2. **Database**
   - **Descripción**: Gestiona credenciales dinámicas para bases de datos como MySQL, PostgreSQL, MongoDB, etc.
   - **Comando**:
     ```bash
     vault secrets enable database
     ```

3. **AWS**
   - **Descripción**: Gestiona credenciales dinámicas para servicios de AWS.
   - **Comando**:
     ```bash
     vault secrets enable aws
     ```

4. **Azure**
   - **Descripción**: Gestiona credenciales dinámicas para servicios de Azure.
   - **Comando**:
     ```bash
     vault secrets enable azure
     ```

5. **GCP (Google Cloud Platform)**
   - **Descripción**: Gestiona credenciales dinámicas para servicios de GCP.
   - **Comando**:
     ```bash
     vault secrets enable gcp
     ```

6. **PKI (Public Key Infrastructure)**
   - **Descripción**: Gestiona certificados y claves privadas.
   - **Comando**:
     ```bash
     vault secrets enable pki
     ```

7. **Transit**
   - **Descripción**: Proporciona servicios de cifrado y descifrado sin almacenar datos.
   - **Comando**:
     ```bash
     vault secrets enable transit
     ```

8. **SSH**
   - **Descripción**: Gestiona claves SSH dinámicas para acceso seguro.
   - **Comando**:
     ```bash
     vault secrets enable ssh
     ```

9. **TOTP (Time-Based One-Time Password)**
   - **Descripción**: Genera contraseñas de un solo uso basadas en tiempo.
   - **Comando**:
     ```bash
     vault secrets enable totp
     ```

10. **RabbitMQ**
    - **Descripción**: Gestiona credenciales dinámicas para RabbitMQ.
    - **Comando**:
      ```bash
      vault secrets enable rabbitmq
      ```

11. **Consul**
    - **Descripción**: Gestiona tokens dinámicos para Consul.
    - **Comando**:
      ```bash
      vault secrets enable consul
      ```

12. **Nomad**
    - **Descripción**: Gestiona tokens dinámicos para Nomad.
    - **Comando**:
      ```bash
      vault secrets enable nomad
      ```

13. **Cassandra**
    - **Descripción**: Gestiona credenciales dinámicas para Cassandra.
    - **Comando**:
      ```bash
      vault secrets enable cassandra
      ```

14. **MongoDB Atlas**
    - **Descripción**: Gestiona credenciales dinámicas para MongoDB Atlas.
    - **Comando**:
      ```bash
      vault secrets enable mongodb-atlas
      ```

15. **Key-Value Version 2 (KV v2)**
    - **Descripción**: Una versión mejorada del motor KV con soporte para versiones de datos.
    - **Comando**:
      ```bash
      vault secrets enable -path=kv2 kv-v2
      ```

### Nota:
Cada motor de secretos tiene configuraciones específicas que pueden requerir pasos adicionales después de habilitarlo. Consulta la [documentación oficial de Vault](https://www.vaultproject.io/docs/secrets) para más detalles.