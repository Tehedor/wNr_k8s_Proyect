import hvac
import json

VAULT_TOKEN='pruebas123'

def read_secret():


    client = hvac.Client(
        url='http://localhost:8200', 
        token=VAULT_TOKEN,
    )

    read_response = client.secrets.kv.v2.read_secret_version(path='hello')
    print(json.dumps(read_response,  indent=4, sort_keys=True))

read_secret()

print("B")
