#!/bin/bash

set -e

echo "Instalando driver FT9201 para libfprint..."

# Verificar dependencias
if ! command -v meson &> /dev/null; then
    echo "Instalando meson..."
    sudo apt update
    sudo apt install -y meson ninja-build
fi

if ! command -v git &> /dev/null; then
    echo "Instalando git..."
    sudo apt install -y git
fi

# Clonar libfprint
if [ ! -d "libfprint" ]; then
    git clone https://gitlab.freedesktop.org/libfprint/libfprint.git
fi

cd libfprint

# Aplicar parche
echo "Aplicando parche del driver FT9201..."
git apply ../patches/add-ft9201-driver.patch

# Copiar archivos del driver
echo "Copiando archivos del driver..."
cp ../drivers/ft9201.c drivers/
cp ../drivers/ft9201.h drivers/

# Compilar
echo "Compilando libfprint con soporte FT9201..."
meson setup build
ninja -C build

# Instalar
echo "Instalando..."
sudo ninja -C build install

echo "Instalación completada!"
echo "Reiniciando servicio fprintd..."
sudo systemctl restart fprintd

echo "Para verificar:"
echo "  fprintd-list"
echo "  fprintd-enroll"