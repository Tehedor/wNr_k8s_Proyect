[atrás](./20-wazuh.md)

# Install through repository
```bash 
sudo bash -c 'curl -s --insecure https://packages.wazuh.com/key/GPG-KEY-WAZUH | gpg --no-default-keyring --keyring gnupg-ring:/usr/share/keyrings/wazuh.gpg --import && chmod 644 /usr/share/keyrings/wazuh.gpg'
```

```bash 
sudo bash -c 'echo "deb [signed-by=/usr/share/keyrings/wazuh.gpg] https://packages.wazuh.com/apt/ stable main" | tee  /etc/apt/sources.list.d/wazuh.list'
```

```bash 
sudo apt-get update
```
```bash 
sudo apt-get install wazuh-manager wazuh-api
```
---
**Master**
```bash 
apt-get install wazuh-manager
```
```bash 
apt-get install wazuh-agent
```
---
**Worker**
```bash 
apt-get install wazuh-agent
```

