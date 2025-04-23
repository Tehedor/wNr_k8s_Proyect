# # Usa una imagen base de Apache
# FROM httpd:latest

# # Crea el directorio para los certificados SSL
# RUN mkdir /usr/local/apache2/conf/ssl

# # Genera la clave privada y el certificado sin cifrado
# RUN openssl genpkey -algorithm RSA -out /usr/local/apache2/conf/ssl/server.key && \
#     openssl req -new -x509 -key /usr/local/apache2/conf/ssl/server.key -out /usr/local/apache2/conf/ssl/server.crt -days 10000 -subj "/C=US/ST=State/L=City/O=Organization/OU=Department/CN=localhost"

# # Copia el archivo de configuración SSL en el contenedor
# COPY develop-ssl.conf /usr/local/apache2/conf/extra/develop-ssl.conf

# # Habilita el módulo SSL y el sitio SSL
# RUN echo "LoadModule ssl_module modules/mod_ssl.so" >> /usr/local/apache2/conf/httpd.conf && \
#     echo "Include /usr/local/apache2/conf/extra/develop-ssl.conf" >> /usr/local/apache2/conf/httpd.conf


# # Exponer el puerto 443 para HTTPS
# EXPOSE 443

# # Comando para iniciar Apache en primer plano
# CMD ["httpd-foreground"]
# Usa una imagen base de Apache
# Usar la imagen oficial de Apache
# Usar la imagen oficial de Apache
FROM httpd:latest

# Instalar OpenSSL y habilitar el módulo SSL
RUN apt-get update && \
    apt-get install -y openssl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    # Habilitar el módulo SSL
    sed -i '/#LoadModule ssl_module/s/^#//' /usr/local/apache2/conf/httpd.conf && \
    # Crear los directorios necesarios para los certificados
    mkdir -p /usr/local/apache2/conf/ssl && \
    # Generar un certificado autofirmado
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /usr/local/apache2/conf/ssl/server.key \
    -out /usr/local/apache2/conf/ssl/server.crt \
    -subj "/C=US/ST=State/L=City/O=Organization/OU=Department/CN=localhost"

# Copiar el archivo de configuración de Apache con soporte SSL
COPY httpd-ssl.conf /usr/local/apache2/conf/extra/httpd-ssl.conf

# Incluir la configuración SSL en httpd.conf
RUN echo "Include conf/extra/httpd-ssl.conf" >> /usr/local/apache2/conf/httpd.conf

# Añadir la directiva ServerName para evitar el mensaje de advertencia
RUN echo "ServerName localhost" >> /usr/local/apache2/conf/httpd.conf


# Exponer el puerto 443 para HTTPS
EXPOSE 443

# Iniciar Apache en primer plano
CMD ["httpd-foreground"]

