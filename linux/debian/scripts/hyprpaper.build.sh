VERSION="0.3.0"

CONTROL="Package: hyprpaper
Version: ${VERSION}
Architecture: amd64
Maintainer: Vineel Sai <mail@vineelsai.com>
Description: Debian Package Build for Hyprpaper
"

cd build
if [ -d "hyprpaper" ]; then
    cd hyprpaper
    git checkout main
    git pull
    git checkout v${VERSION}
else
    git clone https://github.com/hyprwm/hyprpaper
    cd hyprpaper
    git checkout v${VERSION}
fi

make all
mkdir -p hyprpaper_${VERSION}_amd64/usr/local/bin && mkdir -p hyprpaper_${VERSION}_amd64/DEBIAN
cp build/hyprpaper hyprpaper_${VERSION}_amd64/usr/local/bin
printf "$CONTROL" > hyprpaper_${VERSION}_amd64/DEBIAN/control
chmod -R 0775 hyprpaper_${VERSION}_amd64
dpkg-deb --build --root-owner-group hyprpaper_${VERSION}_amd64
cp hyprpaper_${VERSION}_amd64.deb ../../pool/main
