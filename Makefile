scan:
	dpkg-scanpackages --arch amd64 apt-repo/pool/ > apt-repo/dists/stable/main/binary-amd64/Packages
	cat apt-repo/dists/stable/main/binary-amd64/Packages | gzip -9 > apt-repo/dists/stable/main/binary-amd64/Packages.gz

release:
	./generate-release.sh > ./apt-repo/dists/stable/Release

clean:
	rm ./*.deb