import hvac
import json

VAULT_TOKEN = 'pruebas123'

def read_secret():
    client = hvac.Client(
        url='http://localhost:8200', 
        token=VAULT_TOKEN,
    )

    # Leer secretos de kmaster1, kmaster2, kmaster3
    kmaster_paths = ['master/kmaster1', 'master/kmaster2', 'master/kmaster3']
    worker_paths = ['worker/worker1', 'worker/worker2']

    kmaster_secrets = {}
    worker_secrets = {}

    for path in kmaster_paths:
        read_response = client.secrets.kv.v2.read_secret_version(path=path)
        if 'data' in read_response and 'data' in read_response['data']:
            secret_data = read_response['data']['data']
            kmaster_secrets[path.split('/')[-1]] = secret_data
        else:
            print(f"Error al leer el secreto de {path}")

    for path in worker_paths:
        read_response = client.secrets.kv.v2.read_secret_version(path=path)
        if 'data' in read_response and 'data' in read_response['data']:
            secret_data = read_response['data']['data']
            worker_secrets[path.split('/')[-1]] = secret_data
        else:
            print(f"Error al leer el secreto de {path}")

    # Imprimir los diccionarios de secretos
    print("Secretos de kmaster:")
    print(json.dumps(kmaster_secrets, indent=4, sort_keys=True))
    print("Secretos de worker:")
    print(json.dumps(worker_secrets, indent=4, sort_keys=True))

# Llamar a la función para leer los secretos
read_secret()