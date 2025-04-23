[atrás](../Readme)

# Wazuh

[user manual](https://documentation.wazuh.com/current/user-manual/index.html)


## Instalación de wazuh en cada nodo

+ Mediante repositorio (no funciona)

[install mediante repositorio](./21-install_Repository.md)

+ Mediante deb

[install mediante deb](./22-install_deb.md)

+ Mediante ssh

[install mediante ssh](23-install_ssh.md)

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
sudo systemctl enable wazuh-manager
sudo systemctl start wazuh-manager
```

+ **Agent**
```bash 
sudo systemctl enable wazuh-agent
sudo systemctl start wazuh-agent
```

> [!Note]
> Logs
> ```bash
> tail -f /var/ossec/logs/ossec.log
> ```



```bash 
systemctl daemon-reload
systemctl enable wazuh-agent
systemctl start wazuh-agent
```
```bash 
systemctl daemon-reload
systemctl enable wazuh-manager
systemctl start wazuh-manager
```