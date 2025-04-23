import os
import hvac

# VAULT_TOKEN = os.environ['VAULT_TOKEN']
VAULT_TOKEN = 'pruebas123'



client = hvac.Client(
    url='https://localhost:8200',
    token=VAULT_TOKEN,
    # cert=(client_cert_path, client_key_path),
    # verify=server_cert_path,
)

print("A")
# client.is_authenticated()