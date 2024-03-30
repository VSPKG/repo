arch_amd64:
	sed -i '' 's/platform: linux\/arm64/platform: linux\/amd64/g' docker-compose.yml
	sed -i '' 's/vineelsai\/arch:arm64/vineelsai\/arch/g' Dockerfile.arch

	docker compose up arch --build --force-recreate

arch_arm64:
	sed -i '' 's/platform: linux\/amd64/platform: linux\/arm64/g' docker-compose.yml
	sed -i '' 's/vineelsai\/arch/vineelsai\/arch:arm64/g' Dockerfile.arch

	docker compose up arch --build --force-recreate

	sed -i '' 's/platform: linux\/arm64/platform: linux\/amd64/g' docker-compose.yml
	sed -i '' 's/vineelsai\/arch:arm64/vineelsai\/arch/g' Dockerfile.arch


debian_amd64:
	sed -i '' 's/platform: linux\/arm64/platform: linux\/amd64/g' docker-compose.yml

	docker compose up debian --build --force-recreate

debian_arm64:
	sed -i '' 's/platform: linux\/amd64/platform: linux\/arm64/g' docker-compose.yml

	docker compose up debian --build --force-recreate

	sed -i '' 's/platform: linux\/arm64/platform: linux\/amd64/g' docker-compose.yml


fdroid:
	sed -i '' 's/platform: linux\/arm64/platform: linux\/amd64/g' docker-compose.yml

	docker compose up fdroid --build --force-recreate

build: debian_amd64 debian_arm64 arch_amd64 arch_arm64 fdroid
