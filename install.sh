#!/bin/bash
set -e
echo "Instalando driver"

if ! command -v meson &> /dev/null; then
    echo "Instalando meson"
    sudo apt update
    sudo apt install -y meson ninja-build
fi

if ! command -v git &> /dev/null; then
    echo "Instalando git"
    sudo apt install -y git
fi

if [ ! -d "libfprint" ]; then
    git clone https://gitlab.freedesktop.org/libfprint/libfprint.git
fi

cd libfprint
echo "aplicando parche del driver FT9201"
git apply ../patches/add-ft9201-driver.patch
echo "copiando archivos del driver"
cp ../drivers/ft9201.c drivers/
cp ../drivers/ft9201.h drivers/

echo "compilando libfprint con soporte FT9201"
meson setup build
ninja -C build

echo "Instalando"
sudo ninja -C build install
echo "Instalación completada"
echo "Reiniciando servicio fprintd"
sudo systemctl restart fprintd
echo "Para verificar:"
echo "  fprintd-list"
echo "  fprintd-enroll"
