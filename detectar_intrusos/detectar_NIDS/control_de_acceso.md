# Control de acceos

## Ideas

### Sistemas de detección de intrusos (IDS)
    - Basaados en firmas: Comparan patrones de tráfico con una base de datos de ataques conocidos
    - Basados en aomalías: Detectan desviacions del comportamiento normal del simstema.
    - Ejemplos: Snort, sicate, OSSEC

### Snort

Se puede integrar Snort con el script de backups utilzando su sitema de alertas. Se puede conifugrar Snort para ejecutar un script personalizado al recibir esta alerta.
Este script, a su vez, iniciará la aplciación de backup y dedicará todos los recuros del sostema a esta tarea.

**1- Insatalacíon de snort**

``` bash
sudo apt install snort
```

**2- Conifguarciónd Snort**
    - Reglas: Carga las reglas de dirección qu emejro se adapte a las necesidades. Podemos encotrar una gran vairdad de reglas conofigracda sen línea
    - Alertas: Conifugra Snort para envíe una aleta a un archivo específico cuando se detecta una intrusín
    - Acciones: Conifurar Snort par que jecute un script personlaizado al recibir la alerta

**3- Creación del Script de Backup**
    - Método de trasnferencia: Elegir un método seguro para transferir los datos fuera del servidor (FTO, SFTP, rsync, mc, s3cli)
  - Priorización de recursos: Utilizar comandos como nice o onice para asingar una alerta de prioridad al proceso de backup y asegurar que se ejectue sin interrupciones

## Otras herramientas

+ Fail2ban -> Bloquea automáticamten las IP que intenten iniciar sesión de forma incorrecta
+ TripWire -> Para detectar los cambios no autoizados en los archivos del sistema
+ OSSEC -> Un IDS más completo con capacidades de análisis de logs y detección de rootkits