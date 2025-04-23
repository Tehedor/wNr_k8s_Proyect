[atrás](./20-wazuh.md)

# install through  .deb
https://documentation.wazuh.com/current/installation-guide/packages-list.html

## Para ubuntu

+ **wazuh manager/server**
``` bash 
curl --insecure https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-manager/wazuh-manager_4.10.1-1_amd64.deb -o /tmp/wazuh-manager_4.10.1-1_amd64.deb
```

+ **wazuh agent**
```bash 
curl --insecure https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.10.1-1_amd64.deb -o /tmp/wazuh-agent_4.10.1-1_amd64.deb
```

```bash 
curl --insecure https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-manager/wazuh-manager_4.10.1-1_amd64.deb -o /tmp/wazuh-manager_4.10.1-1_amd64.deb
curl --insecure https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.10.1-1_amd64.deb -o /tmp/wazuh-agent_4.10.1-1_amd64.deb
```


---
### **Master**

+ **wazuh manager/server**
``` bash 
curl --insecure https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-manager/wazuh-manager_4.10.1-1_amd64.deb -o /tmp/wazuh-manager_4.10.1-1_amd64.deb
```

+ **wazuh agent**
```bash 
curl --insecure https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.10.1-1_amd64.deb -o /tmp/wazuh-agent_4.10.1-1_amd64.deb
```
```bash 
curl --insecure https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-manager/wazuh-manager_4.10.1-1_amd64.deb -o /tmp/wazuh-manager_4.10.1-1_amd64.deb
curl --insecure https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.10.1-1_amd64.deb -o /tmp/wazuh-agent_4.10.1-1_amd64.deb
```

```bash 
sudo dpkg -i /tmp/wazuh-manager_4.10.1-1_amd64.deb 
```
```bash 
sudo dpkg -i /tmp/wazuh-agent_4.10.1-1_amd64.deb
```


---
**Worker**

+ **wazuh agent**
```bash 
curl --insecure https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.10.1-1_amd64.deb -o /tmp/wazuh-agent_4.10.1-1_amd64.deb
```

```bash 
sudo dpkg -i /tmp/wazuh-agent_4.10.1-1_amd64.deb;
```




# Delete

```bash 
sudo apt remove --purge wazuh-manager -y
```

```bash 
sudo apt remove --purge wazuh-agent -y
```

```bash 
sudo systemctl daemon-reload
sudo systemctl reset-failed
```
```bash 
sudo systemctl restart wazuh-manager
```