[atrás](./20-wazuh.md)

# Acrive response

[How to configure Active Response - Active Response](https://documentation.wazuh.com/current/user-manual/capabilities/active-response/how-to-configure.html)

```bash 
cat << 'EOF' > /home/develop/pruebas.sh
#!/bin/bash

current_date_time=$(date +"%Y-%m-%d_%H-%M-%S")

file_name="file_$current_date_time.txt"

mkdir -p /home/develop/control
touch /home/develop/control/$file_name

echo "Archivo creado: $file_name"
EOF
```

```bash 
chmod +x /home/develop/pruebas.sh
```
```bash 
sudo ln -s /home/develop/pruebas.sh /var/ossec/active-response/bin/pruebas.sh
```


## Agregar la configuración en el archivo ossec.conf

```bash 
sudo vim /var/ossec/etc/ossec.conf
```

- <ossec_config> agregar:

```xml
<active-response>
  <command>pruebas.sh</command>
  <location>local</location>
</active-response>
```

## Configurar regla para activar el script



```bash 
sudo mkdir /var/ossec/ruleset/rules
```


```bash 
sudo vim /var/ossec/ruleset/rules/local_rules.xml
```


```bash 
sudo -i
```
```bash 
cat << 'EOF' > /var/ossec/ruleset/rules/local_rules.xml
<group name="prueba_active_response">
  <rule id="100001" level="10">
    <if_sid>0</if_sid>
    <decoded_as>syslog</decoded_as>
    <description>Prueba de active response: Detención de intrusión</description>
    <!-- Se disparará si el mensaje contiene "TestIntrusion" -->
    <match>TestIntrusion</match>
    <!-- Llama al active response definido ("test_script") -->
    <active_response>pruebas.sh</active_response>
  </rule>
</group>
EOF
```

``` bash 
exit
```

```bash 
sudo systemctl restart wazuh-agent
```
 
```bash 
logger "TestIntrusion: simulación de intrusión"
```




``` xml
<ruleset>
  <rule_include>ruleset/rules/local_rules.xml</rule_include>
  <rule_dir pattern="_rules.xml$">ruleset/rules</rule_dir>
  <rule_exclude>0215-policy_rules.xml</rule_exclude>
  <decoder_include>ruleset/decoders/my_decoder.xml</decoder_include>
  <decoder_dir pattern=".xml$">ruleset/decoders</decoder_dir>
  <decoder_exclude>ruleset/decoders/my_decoder.xml</decoder_exclude>
  <list>etc/lists/blocked_hosts</list>
</ruleset>
```


## 2

```bash 
sudo vim /var/ossec/etc/ossec.conf
```

```xml
<rule id="100001" level="7">
  <if_sid>5700</if_sid> <pcre2>Failed password for .* from (\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})</pcre2>
  <regex>192\.168\.226\.134\d+</regex>  <description>Intrusion Detected - Failed SSH Login from 192.168.1.0/24 - Execute Script</description>
  <action>execute_script_on_intrusion</action>
</rule>
```


```xml
<action name="execute_script_on_intrusion">
  <script>/var/ossec/active-response/bin/pruebas.sh</script>
  <rule_id>100001</rule_id>
</action>
```


```xml
<command>
  <name>host-deny-alerta</name>
  <executable>host-deny</executable>
  <timeout_allowed>yes</timeout_allowed>
</command>

<active-response>
  <command>host-deny-alerta</command>
  <location>local</location>
  <rule_id>100001</rule_id> <level>7</level>
  <drop_duration>300</drop_duration>  </active-response>
</active-response>
```

``` bash
sudo cat /etc/hosts.deny
```

## check

```bash 
sudo journalctl -xeu wazuh-agent.service
```

```bash 
sudo tail /var/ossec/logs/alerts/alerts.log
```


## general alertas de pruebas
```bash 
sudo /var/ossec/bin/wazuh-logtest
```
dentro de la consola
```bash 
1.1.1.1 srcip=192.168.226.134
```



  <active-response>
    <disabled>no</disabled>
    <ca_store>etc/wpk_root.pem</ca_store>
    <ca_verification>yes</ca_verification>
  </active-response>



  <active-response>
  <!-- Firewall Drop response. Block the IP for
    - 600 seconds on the firewall (iptables,
    - ipfilter, etc).
    -->
  <disabled>no</disabled>
  <command>firewall-drop</command>
  <agent_id>001</agent_id>
  <location>local</location>
  <rules_id></rules_id>
  <level>6</level>
  <timeout>600</timeout>


</active-response>
  <active-response>
  <!-- Firewall Drop response. Block the IP for
    - 600 seconds on the firewall (iptables,
    - ipfilter, etc).
    -->
  <disabled>no</disabled>
  <command>host-deny-alerta</command>
  <agent_id>001</agent_id>
  <location>local</location>
  <rules_id></rules_id>
  <level>6</level>
  <timeout>600</timeout>
</active-response>




```bash 
sudo /var/ossec/active-response/bin/firewall-drop -a "192.168.226.134"
```

sudo iptables -L -n | grep 192.168.226.134