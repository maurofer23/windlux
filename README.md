# Script de OSINT para análisis de sitios web

 _      __(_)___  ____/ / /_  ___  __
| | /| / / / __ \/ __  / / / / / |/_/
| |/ |/ / / / / / /_/ / / /_/ />  <
|__/|__/_/_/ /_/\__,_/_/\__,_/_/|_|

🛠 Descripción
Este script automatiza diversas tareas de **OSINT** en sitios web, permitiendo la recopilación de información relevante. Su propósito es facilitar el reconocimiento de dominios mediante múltiples técnicas de exploración.

⚡ Funcionalidades
- **Escaneo WHOIS**: Obtención de detalles del dominio, como fecha de creación y registrante.
- **Análisis con WhatWeb**: Identificación de tecnologías utilizadas en el sitio.
- **Enumeración de subdominios**: Descubrimiento de subdominios asociados al dominio principal.
- **Exploración de directorios**: Búsqueda de rutas y archivos accesibles.
- **Generación de archivos de salida**: Cada función almacena los resultados en archivos individuales.

📂 Requisitos
Antes de ejecutar el script, asegúrate de tener instaladas y actualizadas las siguientes herramientas en su sistema:
- sudo apt update //Actualiza los paquetes disponibles desde los repositorios 
- sudo apt upgrade //Instala las actualizaciones de los paquetes del sistema
- whois ---> sudo apt isntall whois 
- whatweb ---> sudo apt install whatweb
- subfinder ---> sudo apt install subfinder
- gobuster ---> sudo apt install gobuster

🚀Ejecución
Para utilizar este script en tu sistema, sigue los siguientes pasos:

1- Clonar el repositorio: Ejecuta el siguiente comando en la terminal para descargar el script:
git clone https://github.com/maurofer23/windlux.git

2-Una vez clonado, ingresa al directorio correspondiente:
cd windlux

3-Para permitir la ejecución del archivo windlux.sh, aplica los siguientes permisos:
chmod +x windlux.sh

4-Ejecutar el script: Puedes correrlo con uno de los siguientes comandos según tu preferencia:
sudo ./windlux.sh 
sudo bash windlux.sh
Con estos pasos, el script estará listo para ejecutarse correctamente en tu sistema. 
https://github.com/user-attachments/assets/7b131ff3-c490-45b3-92f8-a7b6e7505c34

🛡️ Aviso Legal
Este script está diseñado únicamente para fines educativos y/o evaluación ética. 
Usa este script únicamente en dominios que te pertenezcan, entornos controlado o sistemas que tengas permiso de evaluar.
El propietario no se hace responsable de su mal uso.
