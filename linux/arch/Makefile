build:
	sh scripts/build.sh

release:
	sh scripts/release.sh

clean:
	find packages/*/* -type f -not -name 'PKGBUILD' -delete

predeploy:
	rm -rf scripts
	rm -rf packages
	rm .gitignore
	rm Makefile
