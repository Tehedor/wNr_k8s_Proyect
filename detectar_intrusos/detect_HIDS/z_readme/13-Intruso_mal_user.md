[atrás](../Readme)

# Mal Usuario
Configuración para cuando se intente iniciar sesión con usuario erroneo bloquear la ip


1. Decoded
    Mira los logs y compara
    /var/ossec/etc/decoder
    ```xml
    <decoder name="ssh-invfailed">
    <parent>sshd</parent>
    <prematch_pcre2>^Failed \S+ for invalid user|^Failed \S+ for illegal user</prematch_pcre2>
    <pcre2 offset="after_prematch">from (\S+) port \d+ \w+$</pcre2>
    <order>srcip</order>
    </decoder>
    ```

2. Rule
    Da un nivel de alerta en función del decoder
    ```xml
    <group name="sshd,">
    <rule id="100100" level="7">
        <decoded_as>ssh-invfailed</decoded_as>
        <description>Intento de acceso SSH con usuario inválido</description>
        <group>sshd,</group>
    </rule>
    </group>
    ```


3. Command
    Ejecutar comando
    ```xml
    <command>
        <name>block_intruder</name>
        <executable>host-deny.sh</executable>
        <expect>srcip</expect>
    </command>
    ```

4. Active response
    Dependiendo nivel de alerta activa command
    ```xml
    <active-response>
        <command>block_intruder</command>
        <location>local</location>
        <level>6</level>
    </active-response>
    ```

5. Reiniciar

```bash
/var/ossec/bin/ossec-control restart
```