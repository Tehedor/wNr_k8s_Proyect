# Velero Backups

## Hacer backup

### Documentación

https://velero.io/docs/v1.7/backup-reference/
``` bash 
velero backup create backupName --include-cluster-resources=true --ordered-resources 'pods=ns1/pod1,ns1/pod2;persistentvolumes=pv4,pv8' --include-namespaces=ns1
```

``` bash 
velero backup create backupName --ordered-resources 'statefulsets=ns1/sts1,ns1/sts0' --include-namespaces=ns1
```

### Mios
https://velero.io/docs/main/backup-reference/
``` bash 
velero backup create pruebas2 --include-namespaces default --wait
```



