
[atrás](../README.md)
## Un bucket en cada master

[documentacion](https://stackoverflow.com/questions/70081871/minio-cluster-on-different-hosts-by-docker)

### kservice

[haproxy.cfg](../35-minio_multimode/haproxy_k8s_minios.cfg)

### kmaster01
``` bash 
cat > /tmp/minios1.yaml <<EOF
services:
  minio1: # rename on different nodes
    restart: always
    image:  minio/minio:RELEASE.2024-11-07T00-52-20Z-cpuv1
    command: server --console-address ":9001" http://minio{1...3}/data
    container_name: minio1 # rename on different nodes
    hostname: minio1 # rename on different nodes
    ports:
      - '9000:9000'
      - '9001:9001'
    environment:
      - MINIO_ROOT_USER=minio
      - MINIO_ROOT_PASSWORD=minio123
    extra_hosts:
      - "minio1:172.16.1.201"  # 1st node
      - "minio2:172.16.1.202"  # 2nd node
      - "minio3:172.16.1.203"  # 2nd node
    volumes:
      - /opt/docker/minio/data1:/data
    healthcheck:
      test: [ "CMD", "curl", "-f", "http://localhost:9000/minio/health/live" ]
      interval: 30s
      timeout: 20s
      retries: 3
EOF
```

### kmaster02
``` bash 
cat > /tmp/minios1.yaml <<EOF
services:
  minio2: # rename on different nodes
    restart: always
    image:  minio/minio:RELEASE.2024-11-07T00-52-20Z-cpuv1
    command: server --console-address ":9001" http://minio{1...3}/data
    container_name: minio2 # rename on different nodes
    hostname: minio2 # rename on different nodes
    ports:
      - '9000:9000'
      - '9001:9001'
    environment:
      - MINIO_ROOT_USER=minio
      - MINIO_ROOT_PASSWORD=minio123
    extra_hosts:
      - "minio1:172.16.1.201"  # 1st node
      - "minio2:172.16.1.202"  # 2nd node
      - "minio3:172.16.1.203"  # 2nd node
    volumes:
      - /opt/docker/minio/data2:/data
    healthcheck:
      test: [ "CMD", "curl", "-f", "http://localhost:9000/minio/health/live" ]
      interval: 30s
      timeout: 20s
      retries: 3
EOF
```

### kmaster03
``` bash 
cat > /tmp/minios1.yaml <<EOF
services:
  minio3: # rename on different nodes
    restart: always
    image:  minio/minio:RELEASE.2024-11-07T00-52-20Z-cpuv1
    command: server --console-address ":9001" http://minio{1...3}/data
    container_name: minio3 # rename on different nodes
    hostname: minio3 # rename on different nodes
    ports:
      - '9000:9000'
      - '9001:9001'
    environment:
      - MINIO_ROOT_USER=minio
      - MINIO_ROOT_PASSWORD=minio123
    extra_hosts:
      - "minio1:172.16.1.201"  # 1st node
      - "minio2:172.16.1.202"  # 2nd node
      - "minio3:172.16.1.203"  # 2nd node
    volumes:
      - /opt/docker/minio/data3:/data
    healthcheck:
      test: [ "CMD", "curl", "-f", "http://localhost:9000/minio/health/live" ]
      interval: 30s
      timeout: 20s
      retries: 3
EOF
```


### UP/DOWN
``` bash 
sudo docker compose -f /tmp/minios1.yaml up -d
```
``` bash 
sudo docker compose -f /tmp/minios1.yaml down
```


## Velero

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
## Conectado a un master
``` bash 
velero install \
    --provider aws \
    --plugins velero/velero-plugin-for-aws:v1.1.0 \
    --bucket velero \
    --backup-location-config region=minio,s3ForcePathStyle="true",s3Url=http://kmaster01.lab.local:9000  \
    --snapshot-location-config region=minio \
    --secret-file /tmp/credentials-velero
```

## Conectado al haproxy
``` bash 
velero install \
    --provider aws \
    --plugins velero/velero-plugin-for-aws:v1.1.0 \
    --bucket velero \
    --backup-location-config region=minio,s3ForcePathStyle="true",s3Url=http://kservice.lab.local:9000  \
    --snapshot-location-config region=minio \
    --secret-file /tmp/credentials-velero
```



## Hacer backup
``` bash 
velero backup create pruebas22 --include-namespaces default --wait
```

## Delete Velero
```bash 
  kubectl delete namespace/velero clusterrolebinding/velero
  kubectl delete crds -l component=velero
```