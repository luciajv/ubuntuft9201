git clone https://gitlab.freedesktop.org/libfprint/libfprint.git
cd libfprint
git apply patches/add-ft9201-driver.patch
meson setup build
ninja -C build
sudo ninja -C build install
