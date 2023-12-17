echo insecure >> ~/.curlrc

cd /home/build/repo
make clean
make generate
make scan

gpg --batch --import ../gpg-private-key.asc

echo > ~/.gnupg/gpg-agent.conf <<EOF
max-cache-ttl 60480000
default-cache-ttl 60480000
allow-loopback-pinentry
EOF

echo > ~/.gnupg/gpg.conf <<EOF
pinentry-mode loopback
EOF

gpg-connect-agent reloadagent /bye

echo "$GPG_PRIVATE_KEY_PASSWORD" | gpg --pinentry-mode loopback --passphrase-fd 0 --sign ~/.gnupg/gpg.conf

make release
