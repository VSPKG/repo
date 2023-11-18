VERSION="0.0.1"
CPU_ARCH=$(dpkg --print-architecture)

CONTROL="Package: dwm
Version: ${VERSION}
Architecture: ${CPU_ARCH}
Maintainer: Vineel Sai <mail@vineelsai.com>
Description: dwm is an extremely fast, small, and dynamic window manager for X.
"

cd build
if [ -d "suckless" ]; then
    cd suckless/dwm
    git pull
else
    git clone https://github.com/vineelsai26/suckless
    cd suckless/dwm
fi

make all
mkdir -p dwm_${VERSION}_${CPU_ARCH}/usr/local/bin && mkdir -p dwm_${VERSION}_${CPU_ARCH}/DEBIAN
cp dwm dwm_${VERSION}_${CPU_ARCH}/usr/local/bin
printf "$CONTROL" > dwm_${VERSION}_${CPU_ARCH}/DEBIAN/control
chmod -R 0775 dwm_${VERSION}_${CPU_ARCH}
dpkg-deb --build --root-owner-group dwm_${VERSION}_${CPU_ARCH}
cp dwm_${VERSION}_${CPU_ARCH}.deb ../../../pool/main
