# clean up files that are not needed for deployment
rm -rf .devcontainer
rm -f .gitignore
rm -rf .git
rm -f docker-compose.yml
rm -f Dockerfile.*
rm -f entrypoint.*.sh
rm vercel.json
rf .editorconfig

# clean up files that are not needed for deployment on debian repo
cd linux/debian
make predeploy
cd ../..

# clean up files that are not needed for deployment on arch repo
cd linux/arch
make predeploy

rm -f predeploy.sh
