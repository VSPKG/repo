generate:
	mkdir -p build
	sh scripts/rce-build.sh
	sh scripts/vmn-build.sh
	sh scripts/checkout-build.sh
	sh scripts/neovim-build.sh

scan:
	dpkg-scanpackages --arch amd64 ./pool/ > ./dists/stable/main/binary-amd64/Packages
	cat ./dists/stable/main/binary-amd64/Packages | gzip -9 > ./dists/stable/main/binary-amd64/Packages.gz

release:
	rm -rf ./dists/stable/Release
	rm -rf ./dists/stable/InRelease
	sh scripts/generate-release.sh > ./dists/stable/Release
	cat ./dists/stable/Release | gpg --default-key "Vineel Sai" -abs > ./dists/stable/Release.gpg
	cat ./dists/stable/Release | gpg --default-key "Vineel Sai" -abs --clearsign > ./dists/stable/InRelease

clean:
	rm -rf build

deploy:
	rm -rf build
	rm -rf scripts
	rm .gitignore
	rm Makefile
