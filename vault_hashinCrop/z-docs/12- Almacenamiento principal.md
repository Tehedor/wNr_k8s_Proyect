[atrás](../README.md)
# Keycloack main storage

## 1 Crear un Realm
1. En Keycloak, ve a Realms → Create .
2. Nombre: my-realm.
3. Schema: mysql (recomendado para producción) o h2 (desarrollo).
4. Clic en Crear .

## 2 Crear un Clinete para Almacenar las IPs
1. En my-realm, ve a Clients → Create .
2. Client ID : server-config.
3. Client Protocol : openid-connect.
4. Access Type : Confidential.
5. Valid Redirect URIs : * (solo para pruebas).
6. Clic en Guardar .

## 3 Almacenar IPs por Roles en el Cliente
1. En el cliente server-config, ve a Attributes .
2. Agrega atributos para cada rol:
Nombre : master_servers → Valor : ["10.0.0.1", "10.0.0.2"].
Nombre : worker_servers → Valor : ["10.0.0.3", "10.0.0.4"].
Nombre : proxy_servers → Valor : ["10.0.0.5", "10.0.0.6"].

## 4 Crear Roles y Asignar a Ususarios
1. En **my-realm**, ve a Roles → Add Role :
    Nombre : **master**.
    Nombre : **worker**.
    Nombre : **proxy**.
2. Asignar roles a un usuario:
    Crea un usuario (ej. **user1**).
    En Roles → Assigned Roles , asigna **master** o **worker** a **user1**.

## 5 Crear una cuenta de servicios (Machien User)
1. En my-realm, ve a Clients → server-config → Service Accounts .
2. Habilita Enable Service Account .
3. El Client ID del servicio será service-account/server-config.

## 6 Dar servicios al Service Account
1. En my-realm, ve a Roles → master → Composite .
2. Agrega el rol view-clients (permite leer clientes y atributos).
3. Repite para roles worker y proxy.

## 7 Integración en aplicación
En python
```python
import requests

# 1. Autenticar como el Service Account
def get_admin_token():
    response = requests.post(
        "http://localhost:8080/realms/master/protocol/openid-connect/token",
        data={
            "client_id": "server-config",
            "client_secret": "secret_del_cliente",  # Obtenlo en Keycloak → Clients → Credentials
            "grant_type": "client_credentials"
        }
    )
    return response.json()["access_token"]

# 2. Obtener IPs por rol
def get_servers_by_role(role, admin_token):
    response = requests.get(
        f"http://localhost:8080/admin/realms/my-realm/clients?clientId=server-config",
        headers={"Authorization": f"Bearer {admin_token}"}
    )
    client_id = response.json()[0]["id"]

    response = requests.get(
        f"http://localhost:8080/admin/realms/my-realm/clients/{client_id}/attributes",
        headers={"Authorization": f"Bearer {admin_token}"}
    )
    attributes = response.json()
    return attributes.get(f"{role}_servers", [])

# 3. Uso en la aplicación
admin_token = get_admin_token()
user_role = "master"  # Obtenido del token del usuario
servers = get_servers_by_role(user_role, admin_token)
print(f"Servers {user_role}: {servers}")
```