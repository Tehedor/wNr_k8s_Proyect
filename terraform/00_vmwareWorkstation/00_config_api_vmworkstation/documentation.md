2. Pasos para usar Terraform con VMware Workstation
a) Instalar y configurar la API REST
Clona el repositorio :
```bash
git clone https://github.com/elsudano/vmware-workstation-api-client.git
cd vmware-workstation-api-client
```
Instala dependencias :
```bash
pip install -r requirements.txt
```
Configura la API :
Edita el archivo config.py para definir el host y puerto donde correrá la API (ej: 0.0.0.0:5000).
Asegúrate de que VMware Workstation esté instalado y funcione correctamente.
Ejecuta la API :

```bash
python api_server.py
```
La API estará disponible en http://localhost:5000 (o la IP/puerto que hayas configurado).