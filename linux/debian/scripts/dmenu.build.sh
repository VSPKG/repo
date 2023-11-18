VERSION="0.0.1"
CPU_ARCH=$(dpkg --print-architecture)

CONTROL="Package: dmenu
Version: ${VERSION}
Architecture: ${CPU_ARCH}
Maintainer: Vineel Sai <mail@vineelsai.com>
Description: dmenu is an efficient dynamic menu for X.
"

cd build
if [ -d "suckless" ]; then
    cd suckless/dmenu
    git pull
else
    git clone https://github.com/vineelsai26/suckless
    cd suckless/dmenu
fi

make all
mkdir -p dmenu_${VERSION}_${CPU_ARCH}/usr/local/bin && mkdir -p dmenu_${VERSION}_${CPU_ARCH}/DEBIAN
cp dmenu dmenu_${VERSION}_${CPU_ARCH}/usr/local/bin
printf "$CONTROL" > dmenu_${VERSION}_${CPU_ARCH}/DEBIAN/control
chmod -R 0775 dmenu_${VERSION}_${CPU_ARCH}
dpkg-deb --build --root-owner-group dmenu_${VERSION}_${CPU_ARCH}
cp dmenu_${VERSION}_${CPU_ARCH}.deb ../../../pool/main
