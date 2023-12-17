build:
	sed -i '' 's/platform: linux\/arm64/platform: linux\/amd64/g' docker-compose.yml
	sed -i '' 's/vineelsai\/arch:arm64/vineelsai\/arch/g' Dockerfile.arch

	docker compose up debian --build --force-recreate
	docker compose up arch --build --force-recreate

	sed -i '' 's/platform: linux\/amd64/platform: linux\/arm64/g' docker-compose.yml
	sed -i '' 's/vineelsai\/arch/vineelsai\/arch:arm64/g' Dockerfile.arch

	docker compose up debian --build --force-recreate
	docker compose up arch --build --force-recreate

	sed -i '' 's/platform: linux\/arm64/platform: linux\/amd64/g' docker-compose.yml
	sed -i '' 's/vineelsai\/arch:arm64/vineelsai\/arch/g' Dockerfile.arch

	docker compose up fdroid --build --force-recreate
