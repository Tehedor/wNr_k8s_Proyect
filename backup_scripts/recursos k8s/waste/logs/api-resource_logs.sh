NAME                 STATUS    MESSAGE   ERROR
scheduler            Healthy   ok        
controller-manager   Healthy   ok        
etcd-0               Healthy   ok        
NAME                         DATA   AGE
kube-root-ca.crt             1      34d
mongo-init-config            1      19d
mysql-finances-init-config   1      19d
mysql-users-init-config      1      19d
NAME               ENDPOINTS                                               AGE
app-backend        192.168.138.117:5000,192.168.142.239:5000               19d
frontend-service   192.168.142.242:80                                      19d
kubernetes         172.16.1.201:6443,172.16.1.202:6443,172.16.1.203:6443   21d
mongodb-service    192.168.138.71:27017                                    19d
mysql-finances     192.168.142.244:3306                                    19d
mysql-users        192.168.142.240:3306                                    19d
NAME              STATUS   AGE
default           Active   34d
ingress-nginx     Active   27d
kube-node-lease   Active   34d
kube-public       Active   34d
kube-system       Active   34d
metallb-system    Active   27d
nginx-example     Active   3d23h
velero            Active   26h
NAME                  STATUS   ROLES           AGE   VERSION   INTERNAL-IP    EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION     CONTAINER-RUNTIME
kmaster01.lab.local   Ready    control-plane   34d   v1.31.2   172.16.1.201   <none>        Ubuntu 24.04.1 LTS   6.8.0-50-generic   containerd://1.7.23
kmaster02.lab.local   Ready    control-plane   34d   v1.31.2   172.16.1.202   <none>        Ubuntu 24.04.1 LTS   6.8.0-49-generic   containerd://1.7.22
kmaster03.lab.local   Ready    control-plane   34d   v1.31.2   172.16.1.203   <none>        Ubuntu 24.04.1 LTS   6.8.0-49-generic   containerd://1.7.22
kworker01.lab.local   Ready    <none>          34d   v1.31.2   172.16.1.204   <none>        Ubuntu 24.04.1 LTS   6.8.0-49-generic   containerd://1.7.22
kworker02.lab.local   Ready    <none>          34d   v1.31.2   172.16.1.205   <none>        Ubuntu 24.04.1 LTS   6.8.0-50-generic   containerd://1.7.22
NAME                 STATUS   VOLUME                    CAPACITY   ACCESS MODES   STORAGECLASS      VOLUMEATTRIBUTESCLASS   AGE   VOLUMEMODE
mongo-pvc            Bound    mongo-pv-volume           1Gi        RWO            manual-mongo      <unset>                 19d   Filesystem
mysql-finances-pvc   Bound    mysql-finance-pv-volume   1Gi        RWO            manual-finances   <unset>                 19d   Filesystem
mysql-users-pvc      Bound    mysql-users-pv-volume     1Gi        RWO            manual-users      <unset>                 19d   Filesystem
NAME                      CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                        STORAGECLASS      VOLUMEATTRIBUTESCLASS   REASON   AGE   VOLUMEMODE
mongo-pv-volume           1Gi        RWO            Retain           Bound    default/mongo-pvc            manual-mongo      <unset>                          20d   Filesystem
mysql-finance-pv-volume   1Gi        RWO            Retain           Bound    default/mysql-finances-pvc   manual-finances   <unset>                          20d   Filesystem
mysql-users-pv-volume     1Gi        RWO            Retain           Bound    default/mysql-users-pvc      manual-users      <unset>                          20d   Filesystem
NAME                                         READY   STATUS    RESTARTS      AGE    IP                NODE                  NOMINATED NODE   READINESS GATES
backend-deployment-5dbb6ddd9d-8h6rl          1/1     Running   5 (27h ago)   19d    192.168.142.239   kworker02.lab.local   <none>           <none>
backend-deployment-5dbb6ddd9d-dr2w5          1/1     Running   1 (27h ago)   7d2h   192.168.138.117   kworker01.lab.local   <none>           <none>
frontend-deployment-7bb4fc6874-qx5sg         1/1     Running   3 (27h ago)   19d    192.168.142.242   kworker02.lab.local   <none>           <none>
mongo-deployment-5bcb7cd78b-gtjbk            1/1     Running   2 (27h ago)   14d    192.168.138.71    kworker01.lab.local   <none>           <none>
mysql-finances-deployment-77884f9658-jlmx4   1/1     Running   3 (27h ago)   19d    192.168.142.244   kworker02.lab.local   <none>           <none>
mysql-users-deployment-b7c4ff976-nrcj8       1/1     Running   3 (27h ago)   19d    192.168.142.240   kworker02.lab.local   <none>           <none>
NAME           TYPE     DATA   AGE
mi-secret      Opaque   1      21d
mysql-secret   Opaque   3      19d
NAME      SECRETS   AGE
default   0         34d
NAME               TYPE           CLUSTER-IP       EXTERNAL-IP    PORT(S)        AGE   SELECTOR
app-backend        ClusterIP      10.111.189.56    <none>         5000/TCP       19d   app=backend
frontend-service   LoadBalancer   10.110.117.245   172.16.1.209   80:31790/TCP   19d   app=frontend-deployment
kubernetes         ClusterIP      10.96.0.1        <none>         443/TCP        21d   <none>
mongodb-service    ClusterIP      10.107.69.75     <none>         27017/TCP      19d   app=mongo
mysql-finances     ClusterIP      10.110.71.49     <none>         3306/TCP       19d   app=mysql-finances
mysql-users        ClusterIP      10.111.227.215   <none>         3306/TCP       19d   app=mysql-users
NAME                            WEBHOOKS   AGE
ingress-nginx-admission         1          27d
metallb-webhook-configuration   7          27d
NAME                                                  CREATED AT
addresspools.metallb.io                               2024-11-20T09:14:32Z
backuprepositories.velero.io                          2024-12-13T13:15:10Z
backups.velero.io                                     2024-12-13T13:15:10Z
backupstoragelocations.velero.io                      2024-12-13T13:15:10Z
bfdprofiles.metallb.io                                2024-11-20T09:14:32Z
bgpadvertisements.metallb.io                          2024-11-20T09:14:32Z
bgpconfigurations.crd.projectcalico.org               2024-11-13T10:17:58Z
bgppeers.crd.projectcalico.org                        2024-11-13T10:17:58Z
bgppeers.metallb.io                                   2024-11-20T09:14:32Z
blockaffinities.crd.projectcalico.org                 2024-11-13T10:17:58Z
caliconodestatuses.crd.projectcalico.org              2024-11-13T10:17:58Z
clusterinformations.crd.projectcalico.org             2024-11-13T10:17:58Z
communities.metallb.io                                2024-11-20T09:14:32Z
datadownloads.velero.io                               2024-12-13T13:15:11Z
datauploads.velero.io                                 2024-12-13T13:15:11Z
deletebackuprequests.velero.io                        2024-12-13T13:15:10Z
downloadrequests.velero.io                            2024-12-13T13:15:10Z
felixconfigurations.crd.projectcalico.org             2024-11-13T10:17:58Z
globalnetworkpolicies.crd.projectcalico.org           2024-11-13T10:17:58Z
globalnetworksets.crd.projectcalico.org               2024-11-13T10:17:58Z
hostendpoints.crd.projectcalico.org                   2024-11-13T10:17:58Z
ipaddresspools.metallb.io                             2024-11-20T09:14:32Z
ipamblocks.crd.projectcalico.org                      2024-11-13T10:17:58Z
ipamconfigs.crd.projectcalico.org                     2024-11-13T10:17:58Z
ipamhandles.crd.projectcalico.org                     2024-11-13T10:17:58Z
ippools.crd.projectcalico.org                         2024-11-13T10:17:58Z
ipreservations.crd.projectcalico.org                  2024-11-13T10:17:58Z
kubecontrollersconfigurations.crd.projectcalico.org   2024-11-13T10:17:58Z
l2advertisements.metallb.io                           2024-11-20T09:14:32Z
networkpolicies.crd.projectcalico.org                 2024-11-13T10:17:58Z
networksets.crd.projectcalico.org                     2024-11-13T10:17:58Z
podvolumebackups.velero.io                            2024-12-13T13:15:10Z
podvolumerestores.velero.io                           2024-12-13T13:15:10Z
restores.velero.io                                    2024-12-13T13:15:10Z
schedules.velero.io                                   2024-12-13T13:15:10Z
serverstatusrequests.velero.io                        2024-12-13T13:15:10Z
volumesnapshotlocations.velero.io                     2024-12-13T13:15:10Z
NAME                                   SERVICE   AVAILABLE   AGE
v1.                                    Local     True        34d
v1.admissionregistration.k8s.io        Local     True        34d
v1.apiextensions.k8s.io                Local     True        34d
v1.apps                                Local     True        34d
v1.authentication.k8s.io               Local     True        34d
v1.authorization.k8s.io                Local     True        34d
v1.autoscaling                         Local     True        34d
v1.batch                               Local     True        34d
v1.certificates.k8s.io                 Local     True        34d
v1.coordination.k8s.io                 Local     True        34d
v1.crd.projectcalico.org               Local     True        34d
v1.discovery.k8s.io                    Local     True        34d
v1.events.k8s.io                       Local     True        34d
v1.flowcontrol.apiserver.k8s.io        Local     True        34d
v1.networking.k8s.io                   Local     True        34d
v1.node.k8s.io                         Local     True        34d
v1.policy                              Local     True        34d
v1.rbac.authorization.k8s.io           Local     True        34d
v1.scheduling.k8s.io                   Local     True        34d
v1.storage.k8s.io                      Local     True        34d
v1.velero.io                           Local     True        3d23h
v1alpha1.metallb.io                    Local     True        27d
v1beta1.metallb.io                     Local     True        27d
v1beta2.metallb.io                     Local     True        27d
v1beta3.flowcontrol.apiserver.k8s.io   Local     True        34d
v2.autoscaling                         Local     True        34d
v2alpha1.velero.io                     Local     True        3d23h
NAME                        READY   UP-TO-DATE   AVAILABLE   AGE   CONTAINERS            IMAGES                            SELECTOR
backend-deployment          2/2     2            2           19d   backend               stehedor/finance-backend-image    app=backend
frontend-deployment         1/1     1            1           19d   frontend-deployment   stehedor/finance-frontend-image   app=frontend-deployment
mongo-deployment            1/1     1            1           19d   mongo                 mongo:5.0                         app=mongo
mysql-finances-deployment   1/1     1            1           19d   mysql-finances        mysql:8.0                         app=mysql-finances
mysql-users-deployment      1/1     1            1           19d   mysql-users           mysql:8.0                         app=mysql-users
NAME                                   DESIRED   CURRENT   READY   AGE   CONTAINERS            IMAGES                            SELECTOR
backend-deployment-5dbb6ddd9d          2         2         2       19d   backend               stehedor/finance-backend-image    app=backend,pod-template-hash=5dbb6ddd9d
frontend-deployment-7bb4fc6874         1         1         1       19d   frontend-deployment   stehedor/finance-frontend-image   app=frontend-deployment,pod-template-hash=7bb4fc6874
mongo-deployment-5bcb7cd78b            1         1         1       19d   mongo                 mongo:5.0                         app=mongo,pod-template-hash=5bcb7cd78b
mysql-finances-deployment-77884f9658   1         1         1       19d   mysql-finances        mysql:8.0                         app=mysql-finances,pod-template-hash=77884f9658
mysql-users-deployment-b7c4ff976       1         1         1       19d   mysql-users           mysql:8.0                         app=mysql-users,pod-template-hash=b7c4ff976
NAME                                     AGE
kmaster01.lab.local-192-168-17-64-26     34d
kmaster02.lab.local-192-168-187-0-26     34d
kmaster03.lab.local-192-168-60-128-26    34d
kworker01.lab.local-192-168-138-64-26    34d
kworker02.lab.local-192-168-142-192-26   34d
NAME      AGE
default   34d
NAME      AGE
default   34d
NAME                 AGE
192-168-138-64-26    34d
192-168-142-192-26   34d
192-168-17-64-26     34d
192-168-187-0-26     34d
192-168-60-128-26    34d
NAME      AGE
default   34d
NAME                                                                               AGE
ipip-tunnel-addr-kmaster01.lab.local                                               34d
ipip-tunnel-addr-kmaster02.lab.local                                               34d
ipip-tunnel-addr-kmaster03.lab.local                                               34d
ipip-tunnel-addr-kworker01.lab.local                                               34d
ipip-tunnel-addr-kworker02.lab.local                                               34d
k8s-pod-network.0b2ebedbc9fc66845fced035dfe204e397c6521d71101866a3b2a5660ed143f9   27h
k8s-pod-network.253cea5a30024a2789f598dc41936083af1e848e40e3da9676040cb6c625186d   27h
k8s-pod-network.4e0fcb5231d3cda3a5adb0a55af3d9efbb2ddb4eae445e6457db59d8c1aa62c1   26h
k8s-pod-network.514d8bd7e7011bbc3ea82990aa7039d39f290d29aa7da158cab4c16052680e55   27h
k8s-pod-network.519b3fb704d3dc369e268a2d3a5e36be769a36317f529d76a0a42fb96e820df4   27h
k8s-pod-network.601f75cb6d1ea41b3e44dbdffff2b9cc8b41c1cd748bb3dde119c0ff28740ea1   27h
k8s-pod-network.74a46563fccb17f08c83a6c16c45788343b0c2e22b68f2fa08c1cc3fc60df7b7   27h
k8s-pod-network.7bd20ad142f03b76bebbc73357eab7ddcaccf2a5f4b21f8ded001412085c8b89   27h
k8s-pod-network.81dfbd51f865a66d2e7a9b988804fc182602f932e09a8077a7ac8c98f2bbe702   27h
k8s-pod-network.8b58457e4ef6bb8aaf8292a202ec31eb2b62216810fcf1810f2208a478465b98   27h
k8s-pod-network.9a2549224714ca276e92908ff7d25dc3d550d1224ba6a37a06debb63ff118ed8   27h
k8s-pod-network.a5d35235dafb52e2ce75ccef88a888519006bc3f773156425b1e8d875292c2d4   27h
k8s-pod-network.bc033b1df59218e03cd402f9f14d4b8ded412cbab0af51d5c01b6f3e76793984   27h
k8s-pod-network.d4cb46d8747402750fbc58120821ce154333f13e2ce5e49bd178d20d8a8e7bee   27h
k8s-pod-network.eda63a701557c9c10a352d11b14980f9ba1486ef5116ceeecc966e56bca27905   26h
NAME                  AGE
default-ipv4-ippool   34d
NAME      AGE
default   34d
NAME                     ADDRESSTYPE   PORTS   ENDPOINTS                                AGE
app-backend-469jw        IPv4          5000    192.168.138.117,192.168.142.239          19d
frontend-service-kmv7m   IPv4          80      192.168.142.242                          19d
kubernetes               IPv4          6443    172.16.1.201,172.16.1.202,172.16.1.203   34d
mongodb-service-tqchj    IPv4          27017   192.168.138.71                           19d
mysql-finances-xcshl     IPv4          3306    192.168.142.244                          19d
mysql-users-dl45f        IPv4          3306    192.168.142.240                          19d
NAME                           PRIORITYLEVEL     MATCHINGPRECEDENCE   DISTINGUISHERMETHOD   AGE   MISSINGPL
exempt                         exempt            1                    <none>                34d   False
probes                         exempt            2                    <none>                34d   False
system-leader-election         leader-election   100                  ByUser                34d   False
endpoint-controller            workload-high     150                  ByUser                34d   False
workload-leader-election       leader-election   200                  ByUser                34d   False
system-node-high               node-high         400                  ByUser                34d   False
system-nodes                   system            500                  ByUser                34d   False
kube-controller-manager        workload-high     800                  ByNamespace           34d   False
kube-scheduler                 workload-high     800                  ByNamespace           34d   False
kube-system-service-accounts   workload-high     900                  ByNamespace           34d   False
service-accounts               workload-low      9000                 ByUser                34d   False
global-default                 global-default    9900                 ByUser                34d   False
catch-all                      catch-all         10000                ByUser                34d   False
NAME              TYPE      NOMINALCONCURRENCYSHARES   QUEUES   HANDSIZE   QUEUELENGTHLIMIT   AGE
catch-all         Limited   5                          <none>   <none>     <none>             34d
exempt            Exempt    <none>                     <none>   <none>     <none>             34d
global-default    Limited   20                         128      6          50                 34d
leader-election   Limited   10                         16       4          50                 34d
node-high         Limited   40                         64       6          50                 34d
system            Limited   30                         64       6          50                 34d
workload-high     Limited   40                         128      6          50                 34d
workload-low      Limited   100                        128      6          50                 34d
NAME    CONTROLLER             PARAMETERS   AGE
nginx   k8s.io/ingress-nginx   <none>       27d
NAME                  CLASS    HOSTS                   ADDRESS   PORTS   AGE
productpage-ingress   <none>   productpage.lab.local             80      27d
NAME                                                            ROLE                                                                               AGE     USERS                            GROUPS                                            SERVICEACCOUNTS
calico-kube-controllers                                         ClusterRole/calico-kube-controllers                                                34d                                                                                        kube-system/calico-kube-controllers
calico-node                                                     ClusterRole/calico-node                                                            34d                                                                                        kube-system/calico-node
cluster-admin                                                   ClusterRole/cluster-admin                                                          34d                                      system:masters                                    
ingress-nginx                                                   ClusterRole/ingress-nginx                                                          27d                                                                                        ingress-nginx/ingress-nginx
ingress-nginx-admission                                         ClusterRole/ingress-nginx-admission                                                27d                                                                                        ingress-nginx/ingress-nginx-admission
kubeadm:cluster-admins                                          ClusterRole/cluster-admin                                                          34d                                      kubeadm:cluster-admins                            
kubeadm:get-nodes                                               ClusterRole/kubeadm:get-nodes                                                      34d                                      system:bootstrappers:kubeadm:default-node-token   
kubeadm:kubelet-bootstrap                                       ClusterRole/system:node-bootstrapper                                               34d                                      system:bootstrappers:kubeadm:default-node-token   
kubeadm:node-autoapprove-bootstrap                              ClusterRole/system:certificates.k8s.io:certificatesigningrequests:nodeclient       34d                                      system:bootstrappers:kubeadm:default-node-token   
kubeadm:node-autoapprove-certificate-rotation                   ClusterRole/system:certificates.k8s.io:certificatesigningrequests:selfnodeclient   34d                                      system:nodes                                      
kubeadm:node-proxier                                            ClusterRole/system:node-proxier                                                    34d                                                                                        kube-system/kube-proxy
metallb-system:controller                                       ClusterRole/metallb-system:controller                                              27d                                                                                        metallb-system/controller
metallb-system:speaker                                          ClusterRole/metallb-system:speaker                                                 27d                                                                                        metallb-system/speaker
system:basic-user                                               ClusterRole/system:basic-user                                                      34d                                      system:authenticated                              
system:controller:attachdetach-controller                       ClusterRole/system:controller:attachdetach-controller                              34d                                                                                        kube-system/attachdetach-controller
system:controller:certificate-controller                        ClusterRole/system:controller:certificate-controller                               34d                                                                                        kube-system/certificate-controller
system:controller:clusterrole-aggregation-controller            ClusterRole/system:controller:clusterrole-aggregation-controller                   34d                                                                                        kube-system/clusterrole-aggregation-controller
system:controller:cronjob-controller                            ClusterRole/system:controller:cronjob-controller                                   34d                                                                                        kube-system/cronjob-controller
system:controller:daemon-set-controller                         ClusterRole/system:controller:daemon-set-controller                                34d                                                                                        kube-system/daemon-set-controller
system:controller:deployment-controller                         ClusterRole/system:controller:deployment-controller                                34d                                                                                        kube-system/deployment-controller
system:controller:disruption-controller                         ClusterRole/system:controller:disruption-controller                                34d                                                                                        kube-system/disruption-controller
system:controller:endpoint-controller                           ClusterRole/system:controller:endpoint-controller                                  34d                                                                                        kube-system/endpoint-controller
system:controller:endpointslice-controller                      ClusterRole/system:controller:endpointslice-controller                             34d                                                                                        kube-system/endpointslice-controller
system:controller:endpointslicemirroring-controller             ClusterRole/system:controller:endpointslicemirroring-controller                    34d                                                                                        kube-system/endpointslicemirroring-controller
system:controller:ephemeral-volume-controller                   ClusterRole/system:controller:ephemeral-volume-controller                          34d                                                                                        kube-system/ephemeral-volume-controller
system:controller:expand-controller                             ClusterRole/system:controller:expand-controller                                    34d                                                                                        kube-system/expand-controller
system:controller:generic-garbage-collector                     ClusterRole/system:controller:generic-garbage-collector                            34d                                                                                        kube-system/generic-garbage-collector
system:controller:horizontal-pod-autoscaler                     ClusterRole/system:controller:horizontal-pod-autoscaler                            34d                                                                                        kube-system/horizontal-pod-autoscaler
system:controller:job-controller                                ClusterRole/system:controller:job-controller                                       34d                                                                                        kube-system/job-controller
system:controller:legacy-service-account-token-cleaner          ClusterRole/system:controller:legacy-service-account-token-cleaner                 34d                                                                                        kube-system/legacy-service-account-token-cleaner
system:controller:namespace-controller                          ClusterRole/system:controller:namespace-controller                                 34d                                                                                        kube-system/namespace-controller
system:controller:node-controller                               ClusterRole/system:controller:node-controller                                      34d                                                                                        kube-system/node-controller
system:controller:persistent-volume-binder                      ClusterRole/system:controller:persistent-volume-binder                             34d                                                                                        kube-system/persistent-volume-binder
system:controller:pod-garbage-collector                         ClusterRole/system:controller:pod-garbage-collector                                34d                                                                                        kube-system/pod-garbage-collector
system:controller:pv-protection-controller                      ClusterRole/system:controller:pv-protection-controller                             34d                                                                                        kube-system/pv-protection-controller
system:controller:pvc-protection-controller                     ClusterRole/system:controller:pvc-protection-controller                            34d                                                                                        kube-system/pvc-protection-controller
system:controller:replicaset-controller                         ClusterRole/system:controller:replicaset-controller                                34d                                                                                        kube-system/replicaset-controller
system:controller:replication-controller                        ClusterRole/system:controller:replication-controller                               34d                                                                                        kube-system/replication-controller
system:controller:resourcequota-controller                      ClusterRole/system:controller:resourcequota-controller                             34d                                                                                        kube-system/resourcequota-controller
system:controller:root-ca-cert-publisher                        ClusterRole/system:controller:root-ca-cert-publisher                               34d                                                                                        kube-system/root-ca-cert-publisher
system:controller:route-controller                              ClusterRole/system:controller:route-controller                                     34d                                                                                        kube-system/route-controller
system:controller:service-account-controller                    ClusterRole/system:controller:service-account-controller                           34d                                                                                        kube-system/service-account-controller
system:controller:service-controller                            ClusterRole/system:controller:service-controller                                   34d                                                                                        kube-system/service-controller
system:controller:statefulset-controller                        ClusterRole/system:controller:statefulset-controller                               34d                                                                                        kube-system/statefulset-controller
system:controller:ttl-after-finished-controller                 ClusterRole/system:controller:ttl-after-finished-controller                        34d                                                                                        kube-system/ttl-after-finished-controller
system:controller:ttl-controller                                ClusterRole/system:controller:ttl-controller                                       34d                                                                                        kube-system/ttl-controller
system:controller:validatingadmissionpolicy-status-controller   ClusterRole/system:controller:validatingadmissionpolicy-status-controller          34d                                                                                        kube-system/validatingadmissionpolicy-status-controller
system:coredns                                                  ClusterRole/system:coredns                                                         34d                                                                                        kube-system/coredns
system:discovery                                                ClusterRole/system:discovery                                                       34d                                      system:authenticated                              
system:kube-controller-manager                                  ClusterRole/system:kube-controller-manager                                         34d     system:kube-controller-manager                                                     
system:kube-dns                                                 ClusterRole/system:kube-dns                                                        34d                                                                                        kube-system/kube-dns
system:kube-scheduler                                           ClusterRole/system:kube-scheduler                                                  34d     system:kube-scheduler                                                              
system:monitoring                                               ClusterRole/system:monitoring                                                      34d                                      system:monitoring                                 
system:node                                                     ClusterRole/system:node                                                            34d                                                                                        
system:node-proxier                                             ClusterRole/system:node-proxier                                                    34d     system:kube-proxy                                                                  
system:public-info-viewer                                       ClusterRole/system:public-info-viewer                                              34d                                      system:authenticated, system:unauthenticated      
system:service-account-issuer-discovery                         ClusterRole/system:service-account-issuer-discovery                                34d                                      system:serviceaccounts                            
system:volume-scheduler                                         ClusterRole/system:volume-scheduler                                                34d     system:kube-scheduler                                                              
velero                                                          ClusterRole/cluster-admin                                                          3d23h                                                                                      velero/velero
NAME                                                                   CREATED AT
admin                                                                  2024-11-13T10:16:27Z
calico-kube-controllers                                                2024-11-13T10:17:58Z
calico-node                                                            2024-11-13T10:17:58Z
cluster-admin                                                          2024-11-13T10:16:27Z
edit                                                                   2024-11-13T10:16:27Z
ingress-nginx                                                          2024-11-19T12:54:06Z
ingress-nginx-admission                                                2024-11-19T12:54:06Z
kubeadm:get-nodes                                                      2024-11-13T10:16:30Z
metallb-system:controller                                              2024-11-20T09:14:32Z
metallb-system:speaker                                                 2024-11-20T09:14:32Z
system:aggregate-to-admin                                              2024-11-13T10:16:27Z
system:aggregate-to-edit                                               2024-11-13T10:16:27Z
system:aggregate-to-view                                               2024-11-13T10:16:27Z
system:auth-delegator                                                  2024-11-13T10:16:27Z
system:basic-user                                                      2024-11-13T10:16:27Z
system:certificates.k8s.io:certificatesigningrequests:nodeclient       2024-11-13T10:16:27Z
system:certificates.k8s.io:certificatesigningrequests:selfnodeclient   2024-11-13T10:16:27Z
system:certificates.k8s.io:kube-apiserver-client-approver              2024-11-13T10:16:27Z
system:certificates.k8s.io:kube-apiserver-client-kubelet-approver      2024-11-13T10:16:27Z
system:certificates.k8s.io:kubelet-serving-approver                    2024-11-13T10:16:27Z
system:certificates.k8s.io:legacy-unknown-approver                     2024-11-13T10:16:27Z
system:controller:attachdetach-controller                              2024-11-13T10:16:27Z
system:controller:certificate-controller                               2024-11-13T10:16:27Z
system:controller:clusterrole-aggregation-controller                   2024-11-13T10:16:27Z
system:controller:cronjob-controller                                   2024-11-13T10:16:27Z
system:controller:daemon-set-controller                                2024-11-13T10:16:27Z
system:controller:deployment-controller                                2024-11-13T10:16:27Z
system:controller:disruption-controller                                2024-11-13T10:16:27Z
system:controller:endpoint-controller                                  2024-11-13T10:16:27Z
system:controller:endpointslice-controller                             2024-11-13T10:16:27Z
system:controller:endpointslicemirroring-controller                    2024-11-13T10:16:27Z
system:controller:ephemeral-volume-controller                          2024-11-13T10:16:27Z
system:controller:expand-controller                                    2024-11-13T10:16:27Z
system:controller:generic-garbage-collector                            2024-11-13T10:16:27Z
system:controller:horizontal-pod-autoscaler                            2024-11-13T10:16:27Z
system:controller:job-controller                                       2024-11-13T10:16:27Z
system:controller:legacy-service-account-token-cleaner                 2024-11-13T10:16:27Z
system:controller:namespace-controller                                 2024-11-13T10:16:27Z
system:controller:node-controller                                      2024-11-13T10:16:27Z
system:controller:persistent-volume-binder                             2024-11-13T10:16:27Z
system:controller:pod-garbage-collector                                2024-11-13T10:16:27Z
system:controller:pv-protection-controller                             2024-11-13T10:16:27Z
system:controller:pvc-protection-controller                            2024-11-13T10:16:27Z
system:controller:replicaset-controller                                2024-11-13T10:16:27Z
system:controller:replication-controller                               2024-11-13T10:16:27Z
system:controller:resourcequota-controller                             2024-11-13T10:16:27Z
system:controller:root-ca-cert-publisher                               2024-11-13T10:16:27Z
system:controller:route-controller                                     2024-11-13T10:16:27Z
system:controller:service-account-controller                           2024-11-13T10:16:27Z
system:controller:service-controller                                   2024-11-13T10:16:27Z
system:controller:statefulset-controller                               2024-11-13T10:16:27Z
system:controller:ttl-after-finished-controller                        2024-11-13T10:16:27Z
system:controller:ttl-controller                                       2024-11-13T10:16:27Z
system:controller:validatingadmissionpolicy-status-controller          2024-11-13T10:16:27Z
system:coredns                                                         2024-11-13T10:16:31Z
system:discovery                                                       2024-11-13T10:16:27Z
system:heapster                                                        2024-11-13T10:16:27Z
system:kube-aggregator                                                 2024-11-13T10:16:27Z
system:kube-controller-manager                                         2024-11-13T10:16:27Z
system:kube-dns                                                        2024-11-13T10:16:27Z
system:kube-scheduler                                                  2024-11-13T10:16:27Z
system:kubelet-api-admin                                               2024-11-13T10:16:27Z
system:monitoring                                                      2024-11-13T10:16:27Z
system:node                                                            2024-11-13T10:16:27Z
system:node-bootstrapper                                               2024-11-13T10:16:27Z
system:node-problem-detector                                           2024-11-13T10:16:27Z
system:node-proxier                                                    2024-11-13T10:16:27Z
system:persistent-volume-provisioner                                   2024-11-13T10:16:27Z
system:public-info-viewer                                              2024-11-13T10:16:27Z
system:service-account-issuer-discovery                                2024-11-13T10:16:27Z
system:volume-scheduler                                                2024-11-13T10:16:27Z
view                                                                   2024-11-13T10:16:27Z
NAME                      VALUE        GLOBAL-DEFAULT   AGE
system-cluster-critical   2000000000   false            34d
system-node-critical      2000001000   false            34d
NAME                  DRIVERS   AGE
kmaster01.lab.local   0         34d
kmaster02.lab.local   0         34d
kmaster03.lab.local   0         34d
kworker01.lab.local   0         34d
kworker02.lab.local   0         34d
