VERSION="0.0.1"

CONTROL="Package: rce
Version: ${VERSION}
Architecture: amd64
Maintainer: Vineel Sai <mail@vineelsai.com>
Description: A Program to manage Node.js versions
"

cd build
if [ -d "RCE" ]; then
    cd RCE
    git pull
else
    git clone https://github.com/vineelsai26/RCE
    cd RCE
fi
go build -buildvcs=false
mkdir -p rce_${VERSION}_amd64/usr/local/bin && mkdir -p rce_${VERSION}_amd64/DEBIAN
cp rce rce_${VERSION}_amd64/usr/local/bin
printf "$CONTROL" > rce_${VERSION}_amd64/DEBIAN/control
chmod -R 0775 rce_${VERSION}_amd64
dpkg-deb --build --root-owner-group rce_${VERSION}_amd64
cp rce_${VERSION}_amd64.deb ../../pool/main
