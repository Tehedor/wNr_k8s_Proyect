[atrás](../README.md)
## MinIO Client

https://min.io/docs/minio/linux/reference/minio-mc.html

``` bash 
curl https://dl.min.io/client/mc/release/linux-amd64/mc \
  --create-dirs \
  -o $HOME/minio-binaries/mc

chmod +x $HOME/minio-binaries/mc
```

1. manera 1
``` bash 
export PATH=$PATH:$HOME/minio-binaries/
mc --help
```

2. manera 2
``` bash 
echo "" >> "$HOME/.bashrc"
echo "export PATH=$PATH:$HOME/minio-binaries/" >> "$HOME/.bashrc"
source $HOME/.bashrc
mc --help
```




## Crear un alias

create an alias
``` bash 
bash +o history
mc alias set myminio1 http://172-16-1-201.kubernetes.default.svc.cluster.local:9000 minio minio123
bash -o history
``` 
``` bash 
bash +o history
mc alias set myminio1 http://localhost:9000 minio minio123
bash -o history
``` 

``` bash 
mc admin info myminio1
```


## Crear un bucket

bucket velero
```bash 
mc mb -p myminio1/bucket1
```

## Meter un file bucket1
``` bash 
mc cp --recursive pruebas.txt myminio1/bucket1/
```

## Ver contenido de un bucket
```bash 
mc ls <nombre de alias>
    -> mc ls pruebasBQ
```