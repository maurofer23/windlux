#!/bin/bash

verde='\033[0;32m'
rojo='\033[0;31m'
reset='\033[0m'

echo "           _           ____
 _      __(_)___  ____/ / /_  ___  __
| | /| / / / __ \/ __  / / / / / |/_/
| |/ |/ / / / / / /_/ / / /_/ />  <
|__/|__/_/_/ /_/\__,_/_/\__,_/_/|_|
"

#BANNER DESCRIPCIÓN
echo -e "${rojo}########################################################################${reset}"
echo -e "${rojo}######################## BIENVENDOS A MI SCRIPT ########################${reset}"
echo -e "${rojo} Este programa automatiza tareas de escaneo de sitios webs, permitiendo ${reset}"
echo -e "${rojo} la recopilación de informacion valisosa. Entre sus funciones destacan: ${reset}"
echo -e "${rojo}  *ESCANEO WHOIS para obtener detalles del dominio                      ${reset}"
echo -e "${rojo}  *ANÁLISIS CON WHATWEB para identificar tecnologias                    ${reset}"
echo -e "${rojo}  *ENUMERACIÓN DE SUBDOMINIOS para mapear la infraestructura del sitio  ${reset}"
echo -e "${rojo}  *EXPLORACIÓN DE DIRECTORIOS en busca de archivos y rutas accesibles   ${reset}"
echo -e "${rojo}  *EL MISMO GENERA UN ARCHIVO DE SALIDA POR CADA UNA DE LAS FUNCIONES   ${reset}"
echo -e "${rojo}########################################################################${reset}"


#FUNCION PARA SOLICITAR AL USUARIO QUE INGRESE EL DOMINIO DEL SITIO WEB A ANALIZAR
function ingresar_dom(){
while [ -z "$dominio" ]; do
	echo -ne "${verde} [+] INGRESE UN DOMINIO (sin https:// y sin www. ) :  ${reset}"
	read -r dominio
	if [ -z "$dominio" ]; then
		echo -e "${rojo} [!] DOMINIO VACIO. INGRESE EL DOMINIO NUEVAMENTE  ${reset}"
	fi
done
export dominio
}

#FUNCIÓN PARA VERIFICAR QUE EL SITIOWEB RESPONDE
function def_conect(){
if ping -c 1 -w 2 "$dominio" &> /dev/null; then
	echo -e " ${verde}[+] EL DOMINIO RESPONDE CORRECTAMENTE ${reset}"
else
	echo -e "${rojo} [!] EL DOMINIO NO RESPONDE [!] ${reset}"
	echo -e "${rojo} [!] FINALIZANDO SCRIPT [!]${reset}"
	exit
fi
}

#FUNCION PARA OBTENER INFORMACIÓN DE UN DOMINIO(IP-FECHA DE CREACIÓN-NOMBRE DE PROPIETARIO)
function def_whois(){
whois "$dominio" > "${dominio}_whois.txt"
if [[ -s "${dominio}_whois.txt" ]]; then
	echo -e "${verde} [+] INFORMACIÓN DE WHOIS ALMACENADA CORRECTAMENTE EN: ${dominio}_whois.txt ${reset}"
else
	echo -e "${rojo} [!] NO SE PUDO ALMACENAR INFORMACION DE WHOIS [!]${reset}"
	rm "${dominio}_whois.txt"
fi
}

#FUNCION PARA BUSCAR INFORMACIÓN DEL SITIO WEB(IDENTIFICAR TECNOLOGÍAS/CONFIGURACIONES)
function def_whatweb(){
whatweb "https://$dominio" > "${dominio}_whatweb.txt"
if [[ -s "${dominio}_whatweb.txt" ]]; then
	echo -e "${verde} [+] INFORMACIÓN DE WHATWEB ALMACENADA CORRECTAMENTE EN: ${dominio}_whatweb.txt ${reset}"
else
	echo -e "${rojo} [!] NO SE PUDO ALMACENAR INFORMACION DE WHATWEB ${reset}"
	rm "${dominio}_whatweb.txt"
fi
}

#FUNCION PARA ENUMERAR SUBDOMINIOS DE FORMA PASIVA 
function def_subdom(){
subfinder -d "$dominio" -o "${dominio}_subdominios.txt" > /dev/null 2>&1
if [[ -s "${dominio}_subdominios.txt" ]]; then
	echo -e "${verde} [+] INFORMACIÓN DE SUBDOMINIOS ALMACENADA CORRECTAMENTE EN: ${dominio}_subdominios.txt ${reset}"
else
	echo -e "${rojo}[!] NO SE PUDO ALMACENAR INFORMACION DE SUBDOMINIOS ${reset}"
	rm "${dominio}_subdominios.txt"
fi
}

#FUNCION PARA BUSCAR DIRECTORIOS
function def_directorio(){
gobuster dir -u "https://$dominio" -w /usr/share/wordlists/dirb/common.txt -x php,json,php,txt,xml -o "${dominio}_directorios.txt"
if [[ -s "${dominio}_directorios.txt" ]]; then
	echo -e "${verde} [+] INFORMACIÓN DE DIRECTORIOS ALMACENADA CORRECTAMENTE EN: ${dominio}_directorios.txt ${reset}"
else
	echo -e "${rojo}[!] NO SE PUDO ALMACENAR INFORMACION DE DIRECTORIOS ${reset}"
	rm "${dominio}_directorios.txt"
fi
}

#--------EJECUCIÓN--------#
ingresar_dom
def_conect
def_whois
def_whatweb
def_subdom
def_directorio
