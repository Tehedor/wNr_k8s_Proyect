[atrás](../Readme)

# OSSEC
🔧 **Pasos para configurar OSSEC con respuesta activa**
-------------------------------------------------------

### 1️⃣ **Instalar OSSEC en la instancia**

En una máquina basada en Ubuntu/Debian, instala OSSEC:

bash
CopiarEditar

```bash 
sudo apt update && sudo apt install ossec-hids-server -y
```


### 2️⃣ **Configurar OSSEC para ejecutar un script ante una intrusión**

Edita el archivo de configuración principal de OSSEC:

bash
CopiarEditar

``` bash 
sudo nano /var/ossec/etc/ossec.conf
```


Busca la sección `<active-response>` y agrégale lo siguiente:

xml
CopiarEditar

``` xml
<active-response>
    <command>block_intruder</command>
    <location>local</location>
    <level>6</level>
    <timeout>600</timeout>
</active-response>
```

Ahora, define la acción en el mismo archivo:

xml
CopiarEditar

``` XML
<command>
    <name>block_intruder</name>
    <executable>block_intruder.sh</executable>
    <expect>srcip</expect>
</command>
```
```xml
<command>
    <name>block_intruder</name>
    <executable>block_intruder.sh</executable>
    <expect>srcip</expect>
</command>
<active-response>
    <command>block_intruder</command>
    <location>local</location>
    <level>6</level>
    <!-- <timeout>600</timeout> -->
</active-response>
```

Esto le indica a OSSEC que ejecute un script llamado `block_intruder.sh` cuando detecte actividad sospechosa.


### 3️⃣ **Crear el script para bloquear al intruso**

Crea el script en la carpeta de OSSEC:

bash
CopiarEditar

``` bash 
sudo nano /var/ossec/active-response/bin/block_intruder.sh
```

Pega lo siguiente:

bash
CopiarEditar

``` bash 
#!/bin/bash
IP="$1"

echo "Bloqueando la IP sospechosa: $IP" | tee -a /var/log/ossec_block.log
iptables -A INPUT -s "$IP" -j DROP
```

Dale permisos de ejecución:

bash
CopiarEditar

``` bash 
sudo chmod +x /var/ossec/active-response/bin/block_intruder.sh
```

### 4️⃣ **Configurar OSSEC para detectar intrusos**

Edita el archivo de reglas personalizadas:

bash
CopiarEditar

``` bash 
sudo nano /var/ossec/rules/local_rules.xml
```

Agrega la siguiente regla:

xml
CopiarEditar

``` xml
<group name="intrusion_detection">
    <rule id="100100" level="7">
        <decoded_as>ssh</decoded_as>
        <match>Failed password for invalid user</match>
        <description>Intento de acceso SSH con usuario inválido</description>
    </rule>
</group>
```

Guarda los cambios y reinicia OSSEC:

bash
CopiarEditar

``` bash 
sudo systemctl restart ossec-hids
```


🔥 **Pruebas para comprobar la detección de intrusos**
------------------------------------------------------

1️⃣ **Desde otra máquina, intenta acceder con un usuario incorrecto:**

bash
CopiarEditar

``` bash 
ssh usuariofalso@TU_IP
```
Después de unos intentos fallidos, OSSEC debería detectar la actividad y ejecutar el script, bloqueando la IP en `iptables`.


2️⃣ **Verifica si la IP fue bloqueada:**

bash
CopiarEditar

``` bash 
sudo iptables -L -n | grep DROP
```

Deberías ver la IP bloqueada.

3️⃣ **Revisa los logs de OSSEC:**

bash
CopiarEditar

``` bash 
sudo tail -f /var/ossec/logs/ossec.log
```

4️⃣ **Revisa el log del script:**

bash
CopiarEditar

``` bash 
cat /var/log/ossec_block.log
```

### **🔄 Cómo eliminar la IP bloqueada**

Si necesitas quitar una IP de la lista de bloqueos, usa:

bash
CopiarEditar

``` bash 
sudo iptables -D INPUT -s IP_A_DESBLOQUEAR -j DROP
```

💡 **Extras que puedes hacer:**

-   Puedes modificar el script para que te envíe una alerta por correo o Telegram.
-   Si usas otro método de seguridad (como `fail2ban`), puedes integrarlo con OSSEC.

¿Qué te parece esta configuración? ¿Quieres algo más avanzado? 🚀