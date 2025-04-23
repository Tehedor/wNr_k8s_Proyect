import hvac

VAULT_TOKEN='pruebas123'
# useal = 4/AfSggoU+i6iZAS48OeY+dnP6XlfzNzpBCZFS2Qt40=

def init_server():

    # client = hvac.Client(url='https://localhost:8200')

    client = hvac.Client(
        url='http://localhost:8200', 
        token=VAULT_TOKEN,
        # cert=(client_cert_path, client_key_path),
        # verify=server_cert_path,
    )
    print(f"Is client authenticated? {client.is_authenticated()}")

    if not client.is_authenticated():
        raise Exception("Error: No se pudo autenticar con Vault.")
init_server()




print("B")