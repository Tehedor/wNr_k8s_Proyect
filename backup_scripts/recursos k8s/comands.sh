# Sacar todos los compontes de kuberenetes a lo bruto # namespace default
kubectl api-resources --verbs=list -o name | xargs -n 1 kubectl get -n default -o wide


# Con get eliginedo compoenentes
kubectl get all,pvc,configmaps,secrets,ingresses,networkpolicies,serviceaccounts -n default -o wide


# Con get eliginedo compoenentes mas
kubectl get all,pvc,configmaps,secrets,ingresses,networkpolicies,serviceaccounts,statefulSet,daemonSets,jobs,cronJobs -n default -o widez