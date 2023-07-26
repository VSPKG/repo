VERSION="0.27.2"

CONTROL="Package: hyprland
Version: ${VERSION}
Architecture: amd64
Maintainer: Vineel Sai <mail@vineelsai.com>
Description: Debian Package Build for Hyprland
"

cd build
rm -rf hyprwm
mkdir -p hyprwm
cd hyprwm

wget https://gitlab.freedesktop.org/wayland/wayland/-/releases/1.22.0/downloads/wayland-1.22.0.tar.xz
tar -xvJf wayland-1.22.0.tar.xz

cd wayland-1.22.0
mkdir build &&
cd    build &&

meson setup ..            \
      --prefix=/usr       \
      --buildtype=release \
      -Ddocumentation=false &&
ninja
ninja install

cd ../..

wget https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.31/downloads/wayland-protocols-1.31.tar.xz
tar -xvJf wayland-protocols-1.31.tar.xz

cd wayland-protocols-1.31

mkdir build &&
cd    build &&

meson setup --prefix=/usr --buildtype=release &&
ninja

ninja install

cd ../..

wget https://gitlab.freedesktop.org/emersion/libdisplay-info/-/releases/0.1.1/downloads/libdisplay-info-0.1.1.tar.xz
tar -xvJf libdisplay-info-0.1.1.tar.xz

cd libdisplay-info-0.1.1/

mkdir build &&
cd    build &&

meson setup --prefix=/usr --buildtype=release &&
ninja

ninja install

cd ../..

if [ -d "hyprland" ]; then
    cd hyprland
    git checkout main
    git pull
    git checkout v${VERSION}
else
    git clone https://github.com/hyprwm/hyprland
    chmod a+rw hyprland
    cd hyprland
    git checkout v${VERSION}
fi

git submodule update --init --recursive

make all
# mkdir -p hyprland_${VERSION}_amd64/usr/local/bin && mkdir -p hyprland_${VERSION}_amd64/DEBIAN
# cp build/hyprland hyprland_${VERSION}_amd64/usr/local/bin
# printf "$CONTROL" > hyprland_${VERSION}_amd64/DEBIAN/control
# chmod -R 0775 hyprland_${VERSION}_amd64
# dpkg-deb --build --root-owner-group hyprland_${VERSION}_amd64
# cp hyprland_${VERSION}_amd64.deb ../../pool/main
