[atrás](../README.md)
## Instalar cliente de velero (todos los master)
``` bash
curl -L -o /tmp/velero.tar.gz https://github.com/vmware-tanzu/velero/releases/download/v1.15.1/velero-v1.15.1-linux-amd64.tar.gz 
```

``` bash
tar -C /tmp -xvf /tmp/velero.tar.gz
```

``` bash
sudo mv /tmp/velero-v1.15.1-linux-amd64/velero /usr/local/bin/velero
```

``` bash
sudo chmod +x /usr/local/bin/velero
```

``` bash
velero --help
```