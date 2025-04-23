[atrás](../README.md)
# Commands

## Normal
```bash
 vault kv put secret/box username=userAdmin passwrod=passAdmin
```


## Engine
```bash 
 vault secrets enable box
```

```bash 
 vault write box/config/connection \
    connection_url="http://box:888"
    username=userAdmin \  
    passwrod=passAdmin
```

```bash 
vault write box/roles/distribt-role \
    vhosts='{"/":{"write":".*", "read": ".*"}}'
```



---
```bash 
curl \
  --header "X-Vault-Token:aaaa" \
  --request GET \
  http://127.0.0.1:8200/v1/secret/data/yoquese
```