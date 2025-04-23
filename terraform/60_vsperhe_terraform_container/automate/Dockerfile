# Usa una imagen base Alpine Linux
FROM alpine:latest

# Actualiza los repositorios e instala las dependencias necesarias
RUN apk update && apk add --no-cache gnupg openssl curl bash

# Añade la clave GPG de HashiCorp
RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

# Añade el repositorio de HashiCorp
RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(cat /etc/os-release | grep ^VERSION_CODENAME | cut -d= -f2) main" | tee /etc/apk/repositories

# Actualiza los repositorios e instala Terraform
RUN apk update && apk add --no-cache terraform

# Copia tu script al contenedor (asumiendo que se llama "mi_script.sh")
COPY mi_script.sh /usr/local/bin/

# Copia el script de entrada al contenedor
COPY entrypoint.sh /usr/local/bin/

# Haz el script ejecutable
RUN chmod +x /usr/local/bin/entrypoint.sh

# Establece el script de entrada como el punto de entrada del contenedor
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Haz el script ejecutable
RUN chmod +x /usr/local/bin/mi_script.sh

# Establece el script como el comando por defecto para ejecutar al iniciar el contenedor
CMD ["/usr/local/bin/mi_script.sh"]