# Clonar libfprint
git clone https://gitlab.freedesktop.org/libfprint/libfprint.git
cd libfprint

# Aplicar parche
git apply patches/add-ft9201-driver.patch

# Compilar e instalar
meson setup build
ninja -C build
sudo ninja -C build install