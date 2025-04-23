[atrás](../Readme)

# OSSEC
[documentation](https://www.ossec.net/docs/docs/manual/installation/index.html)

[download](https://www.ossec.net/download-ossec/)

[ossec/ossec-wui: OSSEC Web User Interface - Unmaintained!!](https://github.com/ossec/ossec-wui)

# Tutoriales
+ Como instalar y simular ataque
>[Monitor in Real-Time with OSSEC | See What's Taking Place in Your Server](https://www.youtube.com/watch?v=7c8xowHz0Ko&t=114s)

## Features
- Multi-platform
- Real time alerts
- Centralized management
- Monitoring with agents
- File integrity checking
- Log monitoring
- Rootkit detection
- Active response

## Instalar en linux

0. Dependencias
<!-- ``` bash 
sudo apt install -y php php-cli php-common libapache2-mod-php apache2-utils sendmail \
inotify-tools apache2 build-essential gcc make wget tar libssl1.0-dev libz-dev \
libssl-dev libpcre2-dev libevent-dev
```` -->
``` bash 
sudo apt install -y php php-cli php-common libapache2-mod-php apache2-utils sendmail \
inotify-tools apache2 build-essential gcc make wget tar libz-dev \
libssl-dev libpcre2-dev libevent-dev
```

> [!NOTE]
> puede que haga falta esta libreria libsystemd-dev


1. Descrage el repositorio
```bash 
git clone https://github.com/ossec/ossec-hids.git
cd ossec-hids

---
+ kmaster
```bash 
cat <<EOF > preloaded-vars.conf
USER_LANGUAGE="en"
USER_NO_STOP="y"
USER_INSTALL_TYPE="hybrid"
USER_DIR="/var/ossec"
USER_ENABLE_ACTIVE_RESPONSE="y"
USER_ENABLE_SYSCHECK="y"
USER_ENABLE_ROOTCHECK="y"
USER_ENABLE_OPENSCAP="n"
USER_ENABLE_CLOUD="n"
USER_WHITE_LIST="127.0.0.1"
EOF 
```

+ kworker
```bash 
cat <<EOF > preloaded-vars.conf
USER_LANGUAGE="en"
USER_NO_STOP="y"
USER_INSTALL_TYPE="server"
USER_DIR="/var/ossec"
USER_ENABLE_ACTIVE_RESPONSE="y"
USER_ENABLE_SYSCHECK="y"
USER_ENABLE_ROOTCHECK="y"
USER_ENABLE_OPENSCAP="n"
USER_ENABLE_CLOUD="n"
USER_WHITE_LIST="127.0.0.1"
EOF
```
---

Install command
```bash
sudo ./install.sh < preloaded-vars.conf
```


2. Iniciar OSSEC
``` bash 
sudo systemctl enable --now ossec-hids
```

3. Verificar que funciona
```bash
sudo systemctl status ossec-hids
sudo tail -f /var/ossec/logs/ossec.log
```

[!NOTE]
 puede que haga falta instalar: libsystemd-dev

## Instalar en docker
[oficial docker](https://hub.docker.com/r/atomicorp/ossec-docker/)

[github](https://github.com/ossec/ossec-docker)

``` bash
docker run -d -p 1514:1514/udp -p 1515:1515/tcp --name ossec-server atomicorp/ossec-docker
```
## Configuración

## Testear


