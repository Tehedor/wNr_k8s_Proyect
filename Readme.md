# wNr_k8s_Proyect

## app_microservicios_pruebas
Aplicación de microservicios para probar el cluster de k8s.

## backup_scripts
Scirpts para hacer backup de todos los componentes de un cluster de k8s sin ninguna apliación externa.

## backup_velero
Aplicación que nos permite hacer copias de seguridad de un clúster de k8s y almacenarlas en cualquier almacenamiento compatible con S3.

## detectar_Intrusos  
Este direcotrio se compone de diferentes configuraciones de IDS para detectar intrusos en una instancia. Se ha decidido utilizar el HIDS **Ossec**, el cual se desplegará en cada una de las máquinas del clúster de k8s. Cuando se detecte un intruso, se enviará una señal con información de la instancia afectada a uno de los másteres. Estos másteres tendrán un daemon que estará a la escucha de esta petición y, al recibirla, creará una copia de seguridad de todo el clúster con Velero y ejecutará, a través de un contenedor que contiene todos los scripts necesarios de Terraform, la eliminación de la máquina afectada para crear una nueva.

## k8s
Contiene todo lo necesario para configurar un cluster de k8s con ansible.

## terraform
Scripts de configuración de las diferentes instancias del clúster que puede trabajar de manera descentralizada gracias a que va almacenando los datos y el terraform.tfstate en el vault.

Estos se ejecutan a través de un contenedor de Docker que se encontrará en cada uno de los másteres del clúster. Cuando el IDS detecte algún intruso en una de las instancias del clúster, mandará una señal al daemon ids_daemonServer (*./detectar_intrusos/ids_daemonServer*), el cual ejecutará el comando del contenedor para eliminar la instancia y crear una nueva con una nueva contraseña.

## vault_hashinCrop
Vault en el que se almacenará todos los datos de los difernetes componentes del cluster k8s.
