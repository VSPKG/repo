# clean up files that are not needed for deployment
rm -rf .devcontainer
rm -f .gitignore
rm -rf .git
rm -f docker-compose.yml
rm -f Dockerfile.*
rm -f entrypoint.*.sh
rm vercel.json

# clean up files that are not needed for deployment on debian repo
cd linux/debian
make deploy
cd ../..

# clean up files that are not needed for deployment on arch repo
cd linux/arch
make deploy

rm -f predeploy.sh
