[atrás](../Readme)

# Wazuh

## Jerarquía

Manager -> Agentes

>[!NOTE]
>Solo puede haber un Manager, por lo tanto, dejaremos todo preparado para que, 
>cuando se detecte un intruso en el primer manager de cada uno de los masters, 
>uno de estos asuma automáticamente el rol de manager.


## Instalación de wazuh en cada nodo

1. Añadir repositorio 

```bash 
sudo apt-get install -y gnupg apt-transport-https
```
```bash 
sudo bash -c 'curl -s --insecure https://packages.wazuh.com/key/GPG-KEY-WAZUH | gpg --no-default-keyring --keyring gnupg-ring:/usr/share/keyrings/wazuh.gpg --import && chmod 644 /usr/share/keyrings/wazuh.gpg'
```
```bash 
sudo bash -c 'echo "deb [signed-by=/usr/share/keyrings/wazuh.gpg] https://packages.wazuh.com/4.x/apt/ stable main" | tee /etc/apt/sources.list.d/wazuh.list'
```
```bash 
sudo apt-get update
```


1. Instalación de wazuh manager o agente

+ **Master**
```bash 
sudo apt-get install wazuh-manager
```
```bash 
sudo apt-get install wazuh-agent
```


+ **Worker**
```bash 
apt-get install wazuh-agent
```



## Configuración básicas

+ **Manager**
file: /var/ossec/etc/ossec.conf

Añadir:
```xml 
<cluster>
  <name>wazuh-security</name>
  <node_name>master-01</node_name>
  <key>1234567890abcdef1234567890abcdef</key>  <!-- Clave de 32 caracteres -->
  <node_type>master</node_type>
  <port>1516</port>
  <bind_addr>0.0.0.0</bind_addr>
  <nodes>
      <node>IP_master-01</node>
  </nodes>
  <hidden>no</hidden>
  <disabled>no</disabled>
</cluster>
```

+ **Agentes**

file: /var/ossec/etc/ossec.conf

Añadir:
```xml
<server>
  <address>IP_del_Manager</address>
</server>
```


## Configuración de respuestas activas

+ **Master**

file: /var/ossec/etc/ossec.conf

Añadir:
```xml
<active-response>
  <command>run_worker_intruder.sh</command>
  <location>remote</location>
  <timeout>600</timeout>
</active-response>

```

+ **Worker**

file: /var/ossec/etc/ossec.conf

Añadir:
```xml
<active-response>
  <command>run_master_intruder.sh</command>
  <location>local</location>
  <timeout>600</timeout>
</active-response>
```


## Iniciar y verificar el servicio

+ **manger**

``` bash 
systemctl enable wazuh-manager
systemctl start wazuh-manager
```

+ **Agent**
```bash 
systemctl enable wazuh-agent
systemctl start wazuh-agent
```

> [!Note]
> Logs
> ```bash
> tail -f /var/ossec/logs/ossec.log
> ```
