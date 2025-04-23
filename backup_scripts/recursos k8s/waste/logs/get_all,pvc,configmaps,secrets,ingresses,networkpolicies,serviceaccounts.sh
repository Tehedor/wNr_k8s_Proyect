NAME                                             READY   STATUS    RESTARTS      AGE    IP                NODE                  NOMINATED NODE   READINESS GATES
pod/backend-deployment-5dbb6ddd9d-8h6rl          1/1     Running   5 (27h ago)   19d    192.168.142.239   kworker02.lab.local   <none>           <none>
pod/backend-deployment-5dbb6ddd9d-dr2w5          1/1     Running   1 (27h ago)   7d2h   192.168.138.117   kworker01.lab.local   <none>           <none>
pod/frontend-deployment-7bb4fc6874-qx5sg         1/1     Running   3 (27h ago)   19d    192.168.142.242   kworker02.lab.local   <none>           <none>
pod/mongo-deployment-5bcb7cd78b-gtjbk            1/1     Running   2 (27h ago)   14d    192.168.138.71    kworker01.lab.local   <none>           <none>
pod/mysql-finances-deployment-77884f9658-jlmx4   1/1     Running   3 (27h ago)   19d    192.168.142.244   kworker02.lab.local   <none>           <none>
pod/mysql-users-deployment-b7c4ff976-nrcj8       1/1     Running   3 (27h ago)   19d    192.168.142.240   kworker02.lab.local   <none>           <none>

NAME                       TYPE           CLUSTER-IP       EXTERNAL-IP    PORT(S)        AGE   SELECTOR
service/app-backend        ClusterIP      10.111.189.56    <none>         5000/TCP       19d   app=backend
service/frontend-service   LoadBalancer   10.110.117.245   172.16.1.209   80:31790/TCP   19d   app=frontend-deployment
service/kubernetes         ClusterIP      10.96.0.1        <none>         443/TCP        21d   <none>
service/mongodb-service    ClusterIP      10.107.69.75     <none>         27017/TCP      19d   app=mongo
service/mysql-finances     ClusterIP      10.110.71.49     <none>         3306/TCP       19d   app=mysql-finances
service/mysql-users        ClusterIP      10.111.227.215   <none>         3306/TCP       19d   app=mysql-users

NAME                                        READY   UP-TO-DATE   AVAILABLE   AGE   CONTAINERS            IMAGES                            SELECTOR
deployment.apps/backend-deployment          2/2     2            2           19d   backend               stehedor/finance-backend-image    app=backend
deployment.apps/frontend-deployment         1/1     1            1           19d   frontend-deployment   stehedor/finance-frontend-image   app=frontend-deployment
deployment.apps/mongo-deployment            1/1     1            1           19d   mongo                 mongo:5.0                         app=mongo
deployment.apps/mysql-finances-deployment   1/1     1            1           19d   mysql-finances        mysql:8.0                         app=mysql-finances
deployment.apps/mysql-users-deployment      1/1     1            1           19d   mysql-users           mysql:8.0                         app=mysql-users

NAME                                                   DESIRED   CURRENT   READY   AGE   CONTAINERS            IMAGES                            SELECTOR
replicaset.apps/backend-deployment-5dbb6ddd9d          2         2         2       19d   backend               stehedor/finance-backend-image    app=backend,pod-template-hash=5dbb6ddd9d
replicaset.apps/frontend-deployment-7bb4fc6874         1         1         1       19d   frontend-deployment   stehedor/finance-frontend-image   app=frontend-deployment,pod-template-hash=7bb4fc6874
replicaset.apps/mongo-deployment-5bcb7cd78b            1         1         1       19d   mongo                 mongo:5.0                         app=mongo,pod-template-hash=5bcb7cd78b
replicaset.apps/mysql-finances-deployment-77884f9658   1         1         1       19d   mysql-finances        mysql:8.0                         app=mysql-finances,pod-template-hash=77884f9658
replicaset.apps/mysql-users-deployment-b7c4ff976       1         1         1       19d   mysql-users           mysql:8.0                         app=mysql-users,pod-template-hash=b7c4ff976

NAME                                       STATUS   VOLUME                    CAPACITY   ACCESS MODES   STORAGECLASS      VOLUMEATTRIBUTESCLASS   AGE   VOLUMEMODE
persistentvolumeclaim/mongo-pvc            Bound    mongo-pv-volume           1Gi        RWO            manual-mongo      <unset>                 19d   Filesystem
persistentvolumeclaim/mysql-finances-pvc   Bound    mysql-finance-pv-volume   1Gi        RWO            manual-finances   <unset>                 19d   Filesystem
persistentvolumeclaim/mysql-users-pvc      Bound    mysql-users-pv-volume     1Gi        RWO            manual-users      <unset>                 19d   Filesystem

NAME                                   DATA   AGE
configmap/kube-root-ca.crt             1      34d
configmap/mongo-init-config            1      19d
configmap/mysql-finances-init-config   1      19d
configmap/mysql-users-init-config      1      19d

NAME                  TYPE     DATA   AGE
secret/mi-secret      Opaque   1      21d
secret/mysql-secret   Opaque   3      19d

NAME                                            CLASS    HOSTS                   ADDRESS   PORTS   AGE
ingress.networking.k8s.io/productpage-ingress   <none>   productpage.lab.local             80      27d

NAME                     SECRETS   AGE
serviceaccount/default   0         34d
