[atrás](../README.md)

# Velero

## Realizar backups
``` bash 
velero backup create default04 --include-namespaces default --wait
```

## Create a restore with the most recent Velero Backup
```bash 
velero restore create --from-backup <SCHEDULE NAME>-<TIMESTAMP>
```

## Get all backups
```bash 
velero get backups
```

## See a backup
```bash 
velero backup describe <BACKUP-NAME>
```

## Restore backup
```bash 
velero restore create --from-backup <BACKUP-NAME>
```
```bash 
velero restore create --from-backup default04
```

# Eliminar velero
```bash 
  kubectl delete namespace/velero clusterrolebinding/velero
  kubectl delete crds -l component=velero
```


# Disaster recovery
https://velero.io/docs/v1.7/disaster-case/

# Cluster migration
https://velero.io/docs/v1.7/migration-case/


## Delete all contenet for defautl namespace
```bash 
kubectl delete all --all --namespace=default
```