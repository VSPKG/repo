all: clean generate scan release clean

generate:
	mkdir -p build
	sh scripts/checkout.build.sh
	sh scripts/eza.build.sh
	# sh scripts/rce.build.sh
	sh scripts/vmn.build.sh
	sh scripts/vmp.build.sh
	sh scripts/neovim.build.sh

scan:
	sh scripts/generate.scan.sh

release:
	rm -rf dists/stable/Release
	rm -rf dists/stable/InRelease
	sh scripts/generate.release.sh > dists/stable/Release
	cat dists/stable/Release | gpg --default-key "Vineel Sai" -abs > dists/stable/Release.gpg
	cat dists/stable/Release | gpg --default-key "Vineel Sai" -abs --clearsign > dists/stable/InRelease

clean:
	rm -rf build

predeploy:
	rm -rf scripts
	rm .gitignore
	rm Makefile
