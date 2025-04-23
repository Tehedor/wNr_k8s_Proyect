[atrás](../README.md)
# Vault config

export te vault address
```bash 
export VAULT_ADDR='http://127.0.0.1:8200'
```

save unseal key
```bash 
echo "cO4C1JaOLSrj3ueyS0IGudFQW4y4+q/zQfdLDvtM9QM=" > unseal.key
```

export vault token
```bash 
export VAULT_DEV_ROOT_TOKEN_ID= "pruebas123"
```


``` bash 
docker exec -it vault vault kv put secret/app_username username=pepe password=abcd
```


```bash 
export VAULT_ADDR='http://127.0.0.1:8200'
echo "aaaaa" > unseal.key 
export VAULT_DEV_ROOT_TOKEN_ID="aaaaaaa"
```
