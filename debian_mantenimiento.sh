#!/bin/bash
# Mantenimiento Debian Linux v1.0.0

# Comprobar si el script se ejecuta como root
if [[ $EUID -ne 0 ]]; then
    echo "Este script requiere permisos de administrador. Introduce tu contraseña:"
    exec sudo "$0" "$@"
fi

echo "--- Iniciando mantenimiento en Debian ---"

# Actualizar lista de paquetes y sistema
echo "Actualizando lista de paquetes..."
apt update -y
echo "Actualizando paquetes instalados..."
apt upgrade -y
echo "Eliminando paquetes innecesarios..."
apt autoremove -y
apt autoclean -y

# Limpiar cachés y archivos temporales
echo "Limpiando cachés y archivos temporales..."
rm -rf ~/.cache/*
rm -rf /var/tmp/*
rm -rf /tmp/*
journalctl --vacuum-time=7d

# Verificar y reparar disco (solo para sistemas con ext4 o similares)
echo "Verificando sistema de archivos..."
fsck -Af -M

# Limpiar memoria RAM y cachés del sistema
echo "Liberando memoria RAM..."
sync; echo 3 > /proc/sys/vm/drop_caches

# Verificar el estado del disco con SMART
echo "Verificando estado del disco..."
smartctl -H /dev/sda

# Cerrar procesos pesados
echo "Cerrando procesos de alto consumo..."
pkill -f "tracker|baloo|plasmashell|gnome-shell"

# Reiniciar servicios de red
echo "Reiniciando servicios de red..."
systemctl restart networking
systemctl restart NetworkManager

echo "--- Mantenimiento completado en Debian ---"