#!/bin/bash

# Actualizar la lista de paquetes
sudo apt update

# Instalar dependencias necesarias
sudo apt-get install -y apt-transport-https ca-certificates curl gpg

# Añadir la clave GPG del repositorio de Kubernetes
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.31/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

# Añadir el repositorio de Kubernetes a la lista de fuentes
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

# Actualizar la lista de paquetes nuevamente
sudo apt-get update

# Instalar kubelet, kubeadm y kubectl
sudo apt-get install -y kubelet kubeadm kubectl

# Marcar los paquetes para que no se actualicen automáticamente
sudo apt-mark hold kubelet kubeadm kubectl

# Instalar containerd
sudo apt install -y containerd

# Crear el directorio de configuración de containerd
sudo mkdir -p /etc/containerd

# Generar la configuración por defecto de containerd
sudo containerd config default | sudo tee /etc/containerd/config.toml

# Reiniciar el servicio de containerd
sudo systemctl restart containerd

# Habilitar el servicio de containerd para que inicie automáticamente al arrancar el sistema
sudo systemctl enable containerd