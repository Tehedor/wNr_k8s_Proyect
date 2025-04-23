[atrás](../README.md)
## Velero minios fuera del cluster
``` bash 
cat > /tmp/minios.yaml <<EOF
services:
  minio:
    image:  minio/minio:RELEASE.2024-11-07T00-52-20Z-cpuv1
    container_name: minio-bucket
    hostname: minioBucket
    environment:
      MINIO_ROOT_USER: minio
      MINIO_ROOT_PASSWORD: minio123
      MINIO_BROWSER_REDIRECT_URL: http://localhost:9001
      AWS_ACCESS_KEY_ID: minio
      AWS_SECRET_ACCESS_KEY: minio123
    volumes:
      - minio-data:/data
    ports:
      - "9000:9000"
      - "9001:9001"
    healthcheck:
      test: ["CMD", "mc", "ready", "local"]
      interval: 5s
      timeout: 5s
    command: ["server", "/data", "--console-address", ":9001"]   

volumes:
  minio-data:
EOF
```
``` bash 
cat > /tmp/minios.yaml <<EOF
services:
  minio:
    image: minio/minio@sha256:a8213a7c2d7a05813bdee6306886fd09378b516f11ef47022c95073add80d4ef
    container_name: minio
    environment:
      MINIO_ACCESS_KEY: minio
      MINIO_SECRET_KEY: minio123
    ports:
      - "9000:9000"
    volumes:
      - minio-storage:/storage
      - minio-config:/config
    command: server /storage --config-dir=/config

volumes:
  minio-storage:
    driver: local
  minio-config:
    driver: local
EOF
```

``` bash 
docker compose -f /tmp/minios.yaml up -d
```
``` bash 
docker compose -f /tmp/minios.yaml down
```

[minio-client](./21-minioClient.md)

configuración del bucket de minIO


1. o
``` bash 
# Configurar el host de MinIO
mc alias set velero http://localhost:9000 minio minio123
```
```bash 
# Crear el bucket "velero" con la política de creación de carpetas
mc mb -p velero/velero
```

1. 0
``` bash 
  mc --config-dir=/config config host add velero http://localhost:9000 minio minio123 && mc --config-dir=/config mb -p velero/velero
```


``` bash 
export AWS_ACCESS_KEY_ID=admin
export AWS_SECRET_ACCESS_KEY=admin123
export BUCKET=veleromarcel
export REGION=us-east-1
```


``` bash 
cat > /tmp/credentials-velero <<EOF
[default]
aws_access_key_id = minio       
aws_secret_access_key = minio123
EOF
```

```bash 
kubectl create namespace velero
```

``` bash 
velero install \
    --provider aws \
    --plugins velero/velero-plugin-for-aws:v1.1.0 \
    --bucket velero \
    --backup-location-config region=minio,s3ForcePathStyle="true",s3Url=http://kmaster01.lab.local:9000  \
    --snapshot-location-config region=minio \
    --secret-file /tmp/credentials-velero
```

``` bash 
velero install \
    --provider aws \
    --plugins velero/velero-plugin-for-aws:v1.1.0 \
    --bucket velero \
    --backup-location-config region=minio,s3ForcePathStyle="true",s3Url=http://172-16-1-201.kubernetes.default.svc.cluster.local:9000  \
    --snapshot-location-config region=minio \
    --secret-file /tmp/credentials-velero
```



``` bash 
velero backup create pruebas5 --include-namespaces default --wait
```