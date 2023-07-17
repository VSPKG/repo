cd build
if [ -d "neovim" ]; then
    cd neovim
    git pull
    git checkout stable
else
    git clone https://github.com/vineelsai26/neovim
    git checkout stable
    cd neovim
fi

make CMAKE_BUILD_TYPE=Release
cd build
cpack -G DEB
mv nvim-linux64.deb nvim_$(echo `git tag --points-at HEAD` | sed 's/stable //' | sed 's/v//')_amd64.deb
cp nvim_${VERSION}_amd64.deb ../../pool/main
