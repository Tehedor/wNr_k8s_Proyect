[atrás](../README.md)
## Probar red dentro de k8s

``` bash 
kubectl run -n velero dns-test -image=busybox --restart=Never -- sleep 3600
```

``` bash 
kubectl exec -n default -it dns-test -- sh
```
 
Probar dns
``` bash
nslookup kmaster01.lab.local
```
``` bash
nslookup 172-16-1-201.kubernetes.default.svc.cluster.local
```


##  Conectar service a un puerto para pruebas rápidas
``` bash
kubectl port-forward service/minio -n velero 9000
```

## Elimianr todos los compoentenes de un namespace
```bash 
kubectl delete all --all -n velero
```

## Eliminar contenedores

```bash 
sudo docker stop $(sudo docker ps -a -q); sudo docker rm $(sudo docker ps -a -q)
```


## Exponer un servicio load balancer

``` bash 
kubectl expose deployment mysql-deployment --type=LoadBalancer --port 3306
``` 
``` bash 
kubectl delete service mysql-deployment
```

Acessar o banco de dados usando phpMyAdmin (exemplo)
http://<ip-do-loadbalancer>:3306/phpmyadmin