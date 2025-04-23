[atrás](../Readme)

# OSSEC

## install

```bash 
curl -L -o /tmp/ossec.3.8.0.tar.gz https://github.com/ossec/ossec-hids/archive/refs/tags/3.8.0.tar.gz
```
```bash 
tar -xzvf /tmp/ossec.3.8.0.tar.gz
```

##
```bash 
sudo apt install libz-dev libssl-dev libpcre2-dev build-essential libsystemd-dev
```

```bash 
sudo ./install.sh
```

opciones:
```bash 
cat << 'EOF' > /tmp/ossec-hids-3.8.0/install_config.sh
#!/bin/bash
# Script para automatizar la instalación de OSSEC HIDS v3.8.0 en modo local
# (manager y agente en la misma máquina).

{
  # Selección de idioma: en
  echo "en"
  # Tipo de instalación: local
  echo "local"
  # Directorio de instalación (presionamos ENTER para usar el valor por defecto, /var/ossec)
  echo ""
  # ¿Desea notificaciones por email? -> No
  echo "n"
  # ¿Desea ejecutar el daemon de integrity check? -> Sí
  echo "y"
  # ¿Desea ejecutar el detector de rootkits? -> Sí
  echo "y"
  # ¿Desea habilitar active response? -> Sí
  echo "y"
  # ¿Desea habilitar la respuesta firewall-drop? -> Sí
  echo "y"
  # ¿Desea añadir más IPs a la white list? -> No
  echo "n"
  # Finalmente, presionar ENTER para continuar con la configuración de logs (usa el valor por defecto)
  echo ""
} | ./install.sh
EOF
```




```bash
sudo chmod 775 /tmp/ossec-hids-3.8.0/install_config.sh
```
```bash
sudo /tmp/ossec-hids-3.8.0/install_config.sh
```


```bash
 - System is Debian (Ubuntu or derivative).
 - Init script modified to start OSSEC HIDS during boot.

 - Configuration finished properly.

 - To start OSSEC HIDS:
      /var/ossec/bin/ossec-control start

 - To stop OSSEC HIDS:
      /var/ossec/bin/ossec-control stop

 - To restart OSSEC HIDS:
      /var/ossec/bin/ossec-control restart

 - The configuration can be viewed or modified at /var/ossec/etc/ossec.conf


    Thanks for using the OSSEC HIDS.
    If you have any question, suggestion or if you find any bug,
    contact us at https://github.com/ossec/ossec-hids or using
    our public maillist at
    https://groups.google.com/forum/#!forum/ossec-list

    More information can be found at http://www.ossec.net

    ---  Press ENTER to fi
```