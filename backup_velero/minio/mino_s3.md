# MINIO

## AWS client

### 1. Instalar clinete de AWS

Manera 2

``` bash
sudo snap install aws-cli --classic
```

Manera 1

``` bash
mkdir waste_pruebas
cd waste_pruebas
curl --insecure "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
cd ..
rm -r waste_pruebas
```

Additionally enalbe AWS Signature Version '4' for MinIO server
``` bash
aws configure set default.s3.signature_version s3v4
```

### 2. Configurar el cliente AWS para user MINIO bucket

#### 2.1. Configuración de aws directamtne por comandos
``` bash
aws configure
```

``` bash 
export AWS_ACCESS_KEY_ID=admin
export AWS_SECRET_ACCESS_KEY=admin123
```

#### 2.2. Configuración de aws por perfiles




---
###  !!! S3 Commands
**_Para hacer un backet_**
``` bash 
aws --endpoint-url http://localhost:9000 s3 mb s3://mybucket
```

---
**_Para ver el bucket hecho antes_**
``` bash
aws  --endpoint-url http://localhost:9000 s3 ls
```

--- 
**_Para ver el contenido dentro de un bucket_**
``` bash
# aws  --endpoint-url http://localhost:9000 s3 ls s3://nombreDelBucket
# aws  --endpoint-url http://localhost:9000 s3 ls s3://veleromarcel
aws  --endpoint-url http://localhost:9000 s3 ls s3://mybucket
```

---
**_Para añadir un objeto al bucket_**
``` bash
# aws --endpoint-url https://localhost:9000 s3 cp simplejson-3.3.0.tar.gz s3://mybucket
aws --endpoint-url http://localhost:9000 s3 cp pruebas.txt s3://mybucket
```


