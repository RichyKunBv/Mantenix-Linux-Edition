#!/bin/bash
# Asistente de Mantenimiento para Debian y Derivados v2.0
# Creado RichyKunBv

# --- Colores ---
VERDE='\033[0;32m'
AMA='\033[0;33m'
ROJO='\033[0;31m'
MAGENTA='\033[0;35m'
DEFAULT='\033[0m'

# --- Verificación de Privilegios ---
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo -e "${ROJO}Error: Ejecuta este script con sudo.${DEFAULT}"
    exit 1
fi

# --- Funciones ---

function actualizar_apt() {
    echo -e "\n${AMA}› Actualizando repositorios y paquetes APT (update & upgrade)...${DEFAULT}"
    apt-get update > /dev/null 2>&1 && apt-get upgrade -y
    echo -e "${VERDE}  APT actualizado.${DEFAULT}"
}

function actualizar_flatpak() {
    if ! command -v flatpak &> /dev/null; then return; fi
    echo -e "\n${AMA}› Actualizando paquetes Flatpak...${DEFAULT}"
    flatpak update -y
    echo -e "${VERDE}  Flatpak actualizado.${DEFAULT}"
}

function actualizar_snap() {
    if ! command -v snap &> /dev/null; then return; fi
    echo -e "\n${AMA}› Actualizando paquetes Snap...${DEFAULT}"
    snap refresh
    echo -e "${VERDE}  Snap actualizado.${DEFAULT}"
}

function limpiar_sistema() {
    echo -e "\n${AMA}› Limpiando sistema (autoremove & clean)...${DEFAULT}"
    apt-get autoremove -y > /dev/null 2>&1 && apt-get clean
    echo -e "${VERDE}  Sistema limpiado.${DEFAULT}"
}

function actualizacion_profunda() {
    echo -e "\n${AMA}› Realizando ACTUALIZACIÓN PROFUNDA del sistema (full-upgrade)...${DEFAULT}"
    echo -e "${AMA}  Esto puede instalar/eliminar paquetes para resolver dependencias del sistema.${DEFAULT}"
    apt-get update > /dev/null 2>&1 && apt-get full-upgrade -y
    echo -e "${VERDE}  Actualización profunda completada.${DEFAULT}"
}

function XD() {
    apt install cmatrix
    cmatrix -b
}

function web() {
    if [ -n "$SUDO_USER" ]; then
        sudo -u $SUDO_USER xdg-open https://github.com/RichyKunBv
    else
        xdg-open https://github.com/RichyKunBv
    fi
}


#Que haces leyendo mi codigo miamor?    U//w//U

# --- Menú Principal ---
while true; do
    echo -e "\n${VERDE}--- Asistente de Mantenimiento (v2.0) ---${DEFAULT}"
    echo "  1. Actualización Estándar"
    echo "  2. Limpiar Sistema"
    echo "  3. Actualización Profunda del Sistema"
    echo -e "  ${MAGENTA}A. MODO DIOS${DEFAULT}"
    echo -e "  ${ROJO}X. Salir${DEFAULT}"
    echo -e "  Y. PROXIMAMENTE"
    read -p "  Selecciona una opción: " opcion

    case $opcion in
        1)
            clear
            actualizar_apt
            actualizar_flatpak
            actualizar_snap
            echo -e "\n${VERDE}--- Tarea Completada ---${DEFAULT}"
            ;;
        2)
            clear
            limpiar_sistema
            echo -e "\n${VERDE}--- Tarea Completada ---${DEFAULT}"
            ;;
        3)
            clear
            actualizacion_profunda
            echo -e "\n${VERDE}--- Tarea Completada ---${DEFAULT}"
            ;;
        [aA])
            clear
            echo -e "${MAGENTA}--- INICIANDO MODO DIOS ---${DEFAULT}"
            actualizacion_profunda
            actualizar_flatpak
            actualizar_snap
            limpiar_sistema
            echo -e "\n${MAGENTA}--- SECUENCIA COMPLETA FINALIZADA ---${DEFAULT}"
            ;;
        [yY])
            clear
            echo -e "\n${AMA}Estate al pendiente desde aqui...${DEFAULT}"
            sleep 2
            web 
            ;; 
        [ñÑ])
            clear
            echo -e "\n${VERDE}Caiste XDDDDD...${DEFAULT}"
            sleep 2
            XD 
            ;; 
        [xX])
            break 
            ;;
        *)
            echo -e "\n${ROJO}  Opción no válida. Intenta de nuevo.${DEFAULT}"
            sleep 1
            ;;
    esac
done
