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
sudo apt -y install libz-dev libssl-dev libpcre2-dev build-essential libsystemd-dev
```

```bash 
cat <<EOF > /tmp/ossec-hids-3.8.0/install.cfg.sh
USER_LANGUAGE="en"
USER_NO_STOP="y"
USER_INSTALL_TYPE="local"
USER_DIR="/var/ossec"
USER_ENABLE_EMAIL="n"
USER_ENABLE_SYSCHECK="y"
USER_ENABLE_ROOTCHECK="y"
USER_ENABLE_ACTIVE_RESPONSE="y"
USER_ENABLE_FIREWALL_RESPONSE="y"
USER_WHITE_LIST="127.0.0.1"
EOF
```

```bash 
sudo  /tmp/ossec-hids-3.8.0/install.sh
```


## Commands


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




``` bash 
sudo tail -f /var/ossec/logs/ossec.log
```

``` bash 
cat /var/log/ossec_block.log
```