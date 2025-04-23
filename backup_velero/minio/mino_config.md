# MINIO

## Maneras de interactura con minio

### 1. Herraminetas S3 (CLI aws)

### 2. MC (clinete de MiniO)

#### 1. Instalar clinete de AWS

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

#### 2. Configurar el cliente AWS para user MINIO bucket

 
> environment:
> MINIO_ROOT_USER: admin
> MINIO_ROOT_PASSWORD: admin123
> MINIO_BROWSER_REDIRECT_URL: http://localhost:9001

> Access Key y Secret Key:
> MINIO_ROOT_USER: admin (es la Access Key).
> MINIO_ROOT_PASSWORD: admin123 (es la Secret Key)
> us-east-1


``` bash
aws configure
```
