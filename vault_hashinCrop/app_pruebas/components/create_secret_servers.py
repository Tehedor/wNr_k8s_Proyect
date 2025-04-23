import hvac
import json

VAULT_TOKEN = 'pruebas123'

def init_server():
    client = hvac.Client(
        url='http://localhost:8200', 
        token=VAULT_TOKEN,
    )

    # Crear o actualizar secretos para kmaster1
    create_response_kmaster1 = client.secrets.kv.v2.create_or_update_secret(
        path='master/kmaster1', 
        secret=dict(token="aaaa", ip="192.168.2.1")
    )

    # Crear o actualizar secretos para kmaster2
    create_response_kmaster2 = client.secrets.kv.v2.create_or_update_secret(
        path='master/kmaster2', 
        secret=dict(token="bbbb", ip="192.168.2.2")
    )

    # Crear o actualizar secretos para kmaster3
    create_response_kmaster3 = client.secrets.kv.v2.create_or_update_secret(
        path='master/kmaster3', 
        secret=dict(token="cccc", ip="192.168.2.3")
    )

    # Crear o actualizar secretos para worker1
    create_response_worker1 = client.secrets.kv.v2.create_or_update_secret(
        path='worker/worker1', 
        secret=dict(token="dddd", ip="192.168.2.4")
    )

    # Crear o actualizar secretos para worker2
    create_response_worker2 = client.secrets.kv.v2.create_or_update_secret(
        path='worker/worker2', 
        secret=dict(token="eeee", ip="192.168.2.5")
    )

    # Imprimir las respuestas completas
    print("Respuesta de kmaster1:")
    print(json.dumps(create_response_kmaster1, indent=4, sort_keys=True))
    print("Respuesta de kmaster2:")
    print(json.dumps(create_response_kmaster2, indent=4, sort_keys=True))
    print("Respuesta de kmaster3:")
    print(json.dumps(create_response_kmaster3, indent=4, sort_keys=True))
    print("Respuesta de worker1:")
    print(json.dumps(create_response_worker1, indent=4, sort_keys=True))
    print("Respuesta de worker2:")
    print(json.dumps(create_response_worker2, indent=4, sort_keys=True))

    # Verificar si los secretos se han creado correctamente
    if create_response_kmaster1 and 'data' in create_response_kmaster1:
        print("Secreto de kmaster1 creado con éxito")
    else:
        print("Error al crear el secreto de kmaster1")

    if create_response_kmaster2 and 'data' in create_response_kmaster2:
        print("Secreto de kmaster2 creado con éxito")
    else:
        print("Error al crear el secreto de kmaster2")

    if create_response_kmaster3 and 'data' in create_response_kmaster3:
        print("Secreto de kmaster3 creado con éxito")
    else:
        print("Error al crear el secreto de kmaster3")

    if create_response_worker1 and 'data' in create_response_worker1:
        print("Secreto de worker1 creado con éxito")
    else:
        print("Error al crear el secreto de worker1")

    if create_response_worker2 and 'data' in create_response_worker2:
        print("Secreto de worker2 creado con éxito")
    else:
        print("Error al crear el secreto de worker2")

# Llamar a la función para inicializar el servidor y crear los secretos
init_server()