cd build
if [ -d "VMN" ]; then
    cd VMN
    git pull
else
    git clone https://github.com/vineelsai26/VMN
    cd VMN
fi

VERSION="$(git tag --sort=committerdate | tail -1 | cut -c2-)"

CONTROL="Package: vmn
Version: ${VERSION}
Architecture: amd64
Maintainer: Vineel Sai <mail@vineelsai.com>
Description: A Program to manage Node.js versions
"

go build -buildvcs=false
mkdir -p vmn_${VERSION}_amd64/usr/local/bin && mkdir -p vmn_${VERSION}_amd64/DEBIAN
cp vmn vmn_${VERSION}_amd64/usr/local/bin
printf "$CONTROL" > vmn_${VERSION}_amd64/DEBIAN/control
chmod -R 0775 vmn_${VERSION}_amd64
dpkg-deb --build --root-owner-group vmn_${VERSION}_amd64
cp vmn_${VERSION}_amd64.deb ../../pool/main
