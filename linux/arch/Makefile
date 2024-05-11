all: build release clean

build:
	sh scripts/build.sh

release:
	sh scripts/release.sh

clean:
	rm -rf packages

predeploy:
	rm -rf scripts
	rm -rf packages
	rm .gitignore
	rm Makefile
