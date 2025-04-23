

# Main

Inicializar :  (descarga plugins necesarios)
```bash 
terraform init
```

Planificar :  (muestra qué cambios se aplicarán).
```bash 
terraform plan
```

Aplicar : (crea/actualiza la infraestructura).
```bash 
terraform apply
```

Destruir : (elimina todo lo creado).
```bash 
terraform destroy
``` 



## Schema 
```bash 
mi-proyecto-terraform/
├── main.tf          # Configuración principal (recursos de VMware)
├── variables.tf     # Variables para personalizar la configuración
├── outputs.tf       # Salidas útiles (ej: IP de la VM creada)
├── providers.tf     # Configuración del proveedor (VMware)
└── terraform.tfvars # Valores de las variables (ej: credenciales)
``` 