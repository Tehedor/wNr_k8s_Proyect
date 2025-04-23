[atrás](../README.md)
## Velero minios dentro del cluster

``` bash
scp -r 10-minio develop@kmaster01.lab.local:~/Music
```

```bash 
cd
cd Music
```

``` 
kubectl apply -f 10-minio
```
``` 
kubectl delete -f 10-minio
```



``` bash 
export AWS_ACCESS_KEY_ID=minio
export AWS_SECRET_ACCESS_KEY=minio123
export BUCKET=veleromarcel
export REGION=minio
```

``` bash 
cat > /tmp/credentials-velero <<EOF
[default]
aws_access_key_id = minio       
aws_secret_access_key = minio123
EOF
```

``` bash 
velero install \
    --provider aws \
    --plugins velero/velero-plugin-for-aws:v1.1.0 \
    --bucket velero \
    --backup-location-config region=minio,s3ForcePathStyle="true",s3Url=http://minio.velero.svc:9000   \
    --snapshot-location-config region=minio \
    --secret-file /tmp/credentials-velero
```


``` bash 
velero backup create pruebas6 --include-namespaces default --wait
```