#!/bin/bash
# Asistente de Mantenimiento para Debian, Fedora y Arch
# Creado RichyKunBv (ustedes pueden llamarme Dios)

clear

#VERZION
VERSION_LOCAL="3.0.6"

# --- Colores ---
DEFAULT='\033[0m'
ROJO='\033[0;31m'
VERDE='\033[0;32m'
AMA='\033[0;33m'
ASUL='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'

# --- Detectar distribución ---
DISTRO=""
DISTRO_FAMILIA=""

detectar_distribucion() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        DISTRO="$ID"
        
        # Detectar familia de distribución
        if [[ "$ID" == "debian" || "$ID_LIKE" == *"debian"* ]]; then
            DISTRO_FAMILIA="debian"
        elif [[ "$ID" == "fedora" || "$ID_LIKE" == *"fedora"* || "$ID" == "rhel" || "$ID" == "centos" ]]; then
            DISTRO_FAMILIA="fedora"
        elif [[ "$ID" == "arch" || "$ID_LIKE" == *"arch"* || "$ID" == "manjaro" ]]; then
            DISTRO_FAMILIA="arch"
        else
            DISTRO_FAMILIA="desconocida"
        fi
    elif [ -f /etc/redhat-release ]; then
        DISTRO="redhat"
        DISTRO_FAMILIA="fedora"
    elif [ -f /etc/arch-release ]; then
        DISTRO="arch"
        DISTRO_FAMILIA="arch"
    else
        DISTRO="desconocida"
        DISTRO_FAMILIA="desconocida"
    fi
    
    echo -e "${VERDE}Distribución detectada: $DISTRO (Familia: $DISTRO_FAMILIA)${DEFAULT}"
}

# --- SUDO obligatorio ---
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo -e "${ROJO}Error: Ejecuta este script con sudo.${DEFAULT}"
    exit 1
fi

# Detectar distribución al inicio
detectar_distribucion

# --- Comandos ---

function actualizar_sistema() {
    echo -e "\n${AMA}› Actualizando repositorios y paquetes del sistema...${DEFAULT}"
    
    case "$DISTRO_FAMILIA" in
        debian)
            apt-get update -qq && apt-get upgrade -y
            echo -e "${VERDE}  APT actualizado.${DEFAULT}"
            ;;
        fedora)
            if command -v dnf &> /dev/null; then
                dnf check-update -q
                dnf upgrade -y
            else
                yum check-update -q
                yum update -y
            fi
            echo -e "${VERDE}  Sistema actualizado.${DEFAULT}"
            ;;
        arch)
            pacman -Syyu --noconfirm
            echo -e "${VERDE}  Pacman actualizado.${DEFAULT}"
            
            # Actualizar AUR si hay un helper instalado
            if command -v yay &> /dev/null; then
                echo -e "\n${AMA}› Actualizando paquetes AUR con yay...${DEFAULT}"
                yay -Syu --noconfirm
                echo -e "${VERDE}  AUR actualizado.${DEFAULT}"
            elif command -v paru &> /dev/null; then
                echo -e "\n${AMA}› Actualizando paquetes AUR con paru...${DEFAULT}"
                paru -Syu --noconfirm
                echo -e "${VERDE}  AUR actualizado.${DEFAULT}"
            fi
            ;;
        *)
            echo -e "${ROJO}  Distribución no soportada para actualización.${DEFAULT}"
            ;;
    esac
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
    echo -e "\n${AMA}› Limpiando sistema...${DEFAULT}"
    
    case "$DISTRO_FAMILIA" in
        debian)
            # Limpiar paquetes huérfanos y caché
            apt-get autoremove -y
            apt-get autoclean
            apt-get clean
            
            # Limpiar kernels antiguos si existe purge-old-kernels
            if command -v purge-old-kernels &> /dev/null; then
                echo -e "${AMA}  Eliminando kernels antiguos...${DEFAULT}"
                purge-old-kernels --keep 2
            fi
            ;;
        fedora)
            if command -v dnf &> /dev/null; then
                dnf autoremove -y
                dnf clean all
            else
                yum autoremove -y
                yum clean all
            fi
            ;;
        arch)
            # Limpiar caché de pacman
            pacman -Sc --noconfirm
            
            # Eliminar paquetes huérfanos
            if pacman -Qtdq &> /dev/null; then
                pacman -Rns $(pacman -Qtdq) --noconfirm
            fi
            ;;
        *)
            echo -e "${ROJO}  Distribución no soportada para limpieza.${DEFAULT}"
            ;;
    esac
    
    # Limpiar journal si systemd está presente
    if command -v journalctl &> /dev/null; then
        echo -e "${AMA}  Limpiando logs del sistema...${DEFAULT}"
        journalctl --vacuum-time=7d > /dev/null 2>&1
    fi
    
    echo -e "${VERDE}  Sistema limpiado.${DEFAULT}"
}

function actualizacion_profunda() {
    echo -e "\n${AMA}› Realizando ACTUALIZACIÓN PROFUNDA del sistema...${DEFAULT}"
    echo -e "${AMA}  Esto puede instalar/eliminar paquetes para resolver dependencias del sistema.${DEFAULT}"
    
    case "$DISTRO_FAMILIA" in
        debian)
            apt-get update -qq
            apt-get full-upgrade -y
            ;;
        fedora)
            if command -v dnf &> /dev/null; then
                dnf upgrade --refresh --best --allowerasing -y
            else
                yum update --refresh -y
            fi
            ;;
        arch)
            pacman -Syyu --noconfirm
            ;;
        *)
            echo -e "${ROJO}  Distribución no soportada para actualización profunda.${DEFAULT}"
            ;;
    esac
    
    echo -e "${VERDE}  Actualización profunda completada.${DEFAULT}"
}


function XD() {
    echo -e "\n${MAGENTA}› Caiste xddddd ${DEFAULT}"
    sleep 2
    
    case "$DISTRO_FAMILIA" in
        debian)
            apt-get install -y cmatrix > /dev/null 2>&1
            ;;
        fedora)
            if command -v dnf &> /dev/null; then
                dnf install -y cmatrix > /dev/null 2>&1
            else
                yum install -y cmatrix > /dev/null 2>&1
            fi
            ;;
        arch)
            pacman -S --noconfirm cmatrix > /dev/null 2>&1
            ;;
        *)
            echo -e "${ROJO}  Papi usa algo mas comun como Arch, Fedora o Debian.${DEFAULT}"
            return 1
            ;;
    esac

    if command -v cmatrix &> /dev/null; then
        echo -e "${VERDE}  ¡viruz instalado! jijiji Ejecutando...${DEFAULT}"
        sleep 1
        cmatrix -b
    else
        echo -e "${ROJO}  Error: No se pudo instalar cmatrix.${DEFAULT}"
        echo -e "${AMA}  Pero aquí tienes un easteregg alternativo (el chiste es que salga algo):${DEFAULT}"
        echo -e "${VERDE}01010100 01110101 00100000 01100101 01110011 01110100 11100001 01110011 00100000 01100101 01101110 00100000 01101100 01100001 00100000 01101101 01100001 01110100 01110010 01101001 01111010${DEFAULT}"
    fi
}

function web() {
    if [ -n "$SUDO_USER" ]; then
        sudo -u $SUDO_USER xdg-open https://github.com/RichyKunBv
    else
        xdg-open https://github.com/RichyKunBv
    fi
}

# --- Funciones adicionales de mantenimiento ---
function optimizar_sistema() {
    echo -e "\n${AMA}› Optimizando el sistema...${DEFAULT}"
    
    # Verificar y reparar sistemas de archivos si es necesario
    if [ "$DISTRO_FAMILIA" == "debian" ] || [ "$DISTRO_FAMILIA" == "fedora" ]; then
        if command -v fsck &> /dev/null; then
            echo -e "${AMA}  Nota: Se recomienda ejecutar fsck en el próximo reinicio.${DEFAULT}"
            # No ejecutamos fsck directamente porque requiere sistema de archivos desmontado
        fi
    fi
    
    # Optimizar bases de datos de paquetes
    case "$DISTRO_FAMILIA" in
        debian)
            echo -e "${AMA}  Reconstruyendo bases de datos de paquetes...${DEFAULT}"
            apt-get update -qq
            ;;
        fedora)
            if command -v dnf &> /dev/null; then
                echo -e "${AMA}  Limpiando caché de metadatos...${DEFAULT}"
                dnf clean metadata
            fi
            ;;
        arch)
            echo -e "${AMA}  Optimizando bases de datos de pacman...${DEFAULT}"
            pacman -Fy
            ;;
    esac
    
    # Verificar paquetes corruptos
    case "$DISTRO_FAMILIA" in
        debian)
            echo -e "${AMA}  Verificando paquetes corruptos...${DEFAULT}"
            dpkg --audit
            apt-get check
            ;;
        fedora)
            if command -v dnf &> /dev/null; then
                echo -e "${AMA}  Verificando paquetes...${DEFAULT}"
                dnf check
            fi
            ;;
        arch)
            echo -e "${AMA}  Verificando archivos de paquetes...${DEFAULT}"
            pacman -Qk
            ;;
    esac
    
    echo -e "${VERDE}  Optimización completada.${DEFAULT}"
}


function actualizar_script() {
  echo -e "\n${AMA}› Verificando actualizaciones para el script...${DEFAULT}"

  local repos_posibles=("Mantenix-Linux-Edition")
  local scripts_posibles=("MantenixL.sh")

  local url_version_encontrada=""
  local url_script_encontrado=""
  local exito=false

  local download_tool=""
  if command -v curl >/dev/null 2>&1; then
    download_tool="curl -sfo"
  elif command -v wget >/dev/null 2>&1; then
    download_tool="wget -qO"
  else
    echo -e "${ROJO}  Error: Se necesita 'curl' o 'wget' para la auto-actualización.${DEFAULT}"
    return 1
  fi

  for repo in "${repos_posibles[@]}"; do
    local url_temp_version="https://raw.githubusercontent.com/RichyKunBv/${repo}/main/version.txt"
    if curl --output /dev/null --silent --head --fail "$url_temp_version"; then
      url_version_encontrada="$url_temp_version"
      for script_name in "${scripts_posibles[@]}"; do
        local url_temp_script="https://raw.githubusercontent.com/RichyKunBv/${repo}/main/${script_name}"
        if curl --output /dev/null --silent --head --fail "$url_temp_script"; then
          url_script_encontrado="$url_temp_script"
          exito=true
          break
        fi
      done
    fi
    [ "$exito" = true ] && break
  done

  if [ "$exito" = false ]; then
    echo -e "${ROJO}  Error: No se pudo encontrar un repositorio o script válido en GitHub.${DEFAULT}"
    return 1
  fi

  local version_remota
  version_remota=$($download_tool - "$url_version_encontrada")
  if [ -z "${version_remota}" ]; then
    echo -e "${ROJO}  Error: No se pudo obtener la versión remota.${DEFAULT}"
    return 1
  fi

  local version_es_nueva=false
  if [ "$(printf '%s\n' "$version_remota" "$VERSION_LOCAL" | sort -V | tail -n 1)" == "$version_remota" ] && [ "$version_remota" != "$VERSION_LOCAL" ]; then
    version_es_nueva=true
  fi

  if [ "$version_es_nueva" = true ]; then
    echo -e "${VERDE}  ¡Nueva versión ($version_remota) encontrada! La tuya es la $VERSION_LOCAL.${DEFAULT}"
    echo -e "${AMA}  Descargando actualización...${DEFAULT}"

    local script_actual="$0"
    local script_nuevo="${script_actual}.new"

    if $download_tool "$script_nuevo" "$url_script_encontrado"; then
      chmod +x "$script_nuevo"
      mv "$script_nuevo" "$script_actual"
      echo -e "${VERDE}  ¡Script actualizado con éxito!${DEFAULT}"
      echo -e "${AMA}  Por favor, vuelve a ejecutar el script para usar la nueva versión.${DEFAULT}"
      exit 0
    else
      echo -e "${ROJO}  Error al descargar el script actualizado.${DEFAULT}"
      rm -f "$script_nuevo"
      return 1
    fi
  else
    echo -e "${VERDE}  Ya tienes la última versión ($VERSION_LOCAL). No se necesita actualizar.${DEFAULT}"
  fi
}

#Que haces leyendo mi codigo miamor?    U//w//U

# --- Acerca De ---
function AD() {
    echo -e "\n${VERDE}----------------------------------${DEFAULT}"
    echo -e "\n${VERDE}---         Acerca De          ---${DEFAULT}"
    echo -e "\n${VERDE}----------------------------------${DEFAULT}"
    echo " "
    echo "Creador de esta majestuosidad: RichyKunBv"
    echo "Version: $VERSION_LOCAL"
    echo ""
    echo "Un script de terminal potente y"
    echo "amigable diseñado para simplificar el"
    echo "mantenimiento de tu sistema Linux."
    echo "Con un menú interactivo, automatiza"
    echo "las tareas de actualización, limpieza y"
    echo "optimización para las familias de"
    echo "distribuciones más populares: Debian,"
    echo "Fedora y Arch."
    echo ""


}
    
# --- Menú ---
while true; do
    echo -e "\n${VERDE}--- Asistente de Mantenimiento ($VERSION_LOCAL) ---${DEFAULT}"
    echo -e "${VERDE}--- Distribución: $DISTRO (Familia: $DISTRO_FAMILIA) ---${DEFAULT}"
    echo "  1. Actualización Estándar"
    echo "  2. Limpiar Sistema"
    echo "  3. Actualización Profunda del Sistema"
    echo "  4. Optimizar Sistema"
    echo -e "  ${MAGENTA}A. MODO DIOS${DEFAULT}"
    echo -e "  ${ROJO}X. Salir${DEFAULT}"
    echo -e "  ${AMA}Y. Actualizar Script${DEFAULT}"
    echo -e "  ${AMA}Z. Acerca De${DEFAULT}"
    read -p "  Selecciona una opción: " opcion

    case $opcion in
        1)
            clear
            actualizar_sistema
            actualizar_flatpak
            actualizar_snap
            echo -e "\n${VERDE}--- Tarea Completada ---${DEFAULT}"
            sleep 2
            clear
            ;;
        2)
            clear
            limpiar_sistema
            echo -e "\n${VERDE}--- Tarea Completada ---${DEFAULT}"
            sleep 2
            clear
            ;;
        3)
            clear
            actualizacion_profunda
            echo -e "\n${VERDE}--- Tarea Completada ---${DEFAULT}"
            sleep 2
            clear
            ;;
        4)
            clear
            optimizar_sistema
            echo -e "\n${VERDE}--- Tarea Completada ---${DEFAULT}"
            sleep 2
            clear
            ;;
        [aA])
            clear
            echo -e "${MAGENTA}--- INICIANDO MODO DIOS ---${DEFAULT}"
            actualizacion_profunda
            actualizar_flatpak
            actualizar_snap
            limpiar_sistema
            optimizar_sistema
            echo -e "\n${MAGENTA}--- SECUENCIA COMPLETA FINALIZADA ---${DEFAULT}"
            sleep 2
            clear
            ;;
        [yY])
            clear
            actualizar_script
            sleep 2
            clear
            ;; 
        [xX])
            break 
            ;;
        [zZ])
            clear
            AD
            read -p "Presiona [Enter] para continuar..."
            clear
            ;;
        [ñÑ])
            clear
            echo -e "\n${VERDE}Caiste XDDDDD...${DEFAULT}"
            sleep 2
            XD 
            clear
            ;; 
        *)
            echo -e "\n${ROJO}  Opción no válida. Intenta de nuevo.${DEFAULT}"
            sleep 1
            clear
            ;;

    esac
done
