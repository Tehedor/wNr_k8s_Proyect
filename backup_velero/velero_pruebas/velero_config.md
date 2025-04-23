# Velero Config

## Tutorial
https://www.youtube.com/watch?v=zybLTQER0yY

https://github.com/marcel-dempers/docker-development-youtube-series/tree/master/kubernetes/velero


## Deploy Velero for AWS

**_**Configure** aws credentials_**
``` bash 
export AWS_ACCESS_KEY_ID=admin
export AWS_SECRET_ACCESS_KEY=admin123
export BUCKET=veleromarcel
export REGION=us-east-1
```

_Create namespace for velero_
``` bash 
kubectl create namespace velero
```

_Credentials_
``` bash
cat > /tmp/credentials-velero <<EOF
[default]
aws_access_key_id=$AWS_ACCESS_KEY_ID
aws_secret_access_key=$AWS_SECRET_ACCESS_KEY
EOF
``` 

---
**_Velero_**
``` bash 
velero install \
    --provider aws \
    --plugins velero/velero-plugin-for-aws:v1.1.0 \
    --bucket $BUCKET \
    --backup-location-config region=$REGION \
    --snapshot-location-config region=$REGION \
    --secret-file /tmp/credentials-velero
``` 

Verificar si hay errores en el deploy hecho anteriormente
``` bash
kubectl logs deploy/velero -n velero
```

``` bash 
kubectl -n velero get pods
kubectl logs deployment/velero -n velero
```

```result
```


Default
``` bash 
# cat > /tmp/credentials-velero <<EOF
# [default]
# aws_access_key_id=$AWS_ACCESS_ID
# aws_secret_access_key=$AWS_ACCESS_KEY
# EOF

# velero install \
#     --provider aws \
#     --plugins velero/velero-plugin-for-aws:v1.1.0 \
#     --bucket $BUCKET \
#     --backup-location-config region=$REGION \
#     --snapshot-location-config region=$REGION \
#     --secret-file /tmp/credentials-velero

# kubectl -n velero get pods
# kubectl logs deployment/velero -n velero
```




velero install --provider aws --plugins velero/velero-plugin-for-aws:v1.1.0 --bucket $BUCKET --backup-location-config region=$REGION --snapshot-location-config region=$REGION --secret-file /tmp/credentials-velero



Default minios 
``` bash
velero install \
    --provider aws \
    --plugins velero/velero-plugin-for-aws:v1.1.0 \
    --bucket velero \
    --secret-file ./credentials-velero \
    --use-volume-snapshots=false \
    --backup-location-config region=minio,s3ForcePathStyle="true",s3Url=http://minio.velero.svc:9000    
```

Default minios 
``` bash
velero install \
    --provider aws \
    --plugins velero/velero-plugin-for-aws:v1.1.0 \
    --bucket velero \
    --secret-file ./credentials-velero1 \
    --use-volume-snapshots=false \
    --backup-location-config region=minio,s3ForcePathStyle="true",s3Url=http://localhost:9000
```


``` bash 
velero install \
    --provider aws \
    --plugins velero/velero-plugin-for-aws:v1.1.0 \
    --bucket $BUCKET \
    --backup-location-config region=minio,s3ForcePathStyle="true",s3Url=http://minio.velero.svc:9000   \
    --snapshot-location-config region=minio \
    --secret-file ./credentials-velero1
```

## Para elmininar velero de la maquina
https://velero.io/docs/v1.3.0/uninstalling/

``` bash 
kubectl delete namespace/velero clusterrolebinding/velero
kubectl delete crds -l component=velero
```