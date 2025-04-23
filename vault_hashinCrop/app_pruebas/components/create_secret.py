import hvac
import json

VAULT_TOKEN = 'pruebas123'

def init_server():
    client = hvac.Client(
        url='http://localhost:8200', 
        token=VAULT_TOKEN,
    )

    create_response = client.secrets.kv.v2.create_or_update_secret(
        path='hello', 
        secret=dict(walle="eve")
    )

    # Imprimir la respuesta completa
    print(json.dumps(create_response, indent=4, sort_keys=True))

    # Verificar si el secreto se ha creado correctamente
    if create_response and 'data' in create_response:
        print("Secreto creado con éxito")
    else:
        print("Error al crear el secreto")

# Llamar a la función para inicializar el servidor y crear el secreto
init_server()