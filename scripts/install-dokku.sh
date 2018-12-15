#!/bin/bash

# Install dokku
wget https://raw.githubusercontent.com/dokku/dokku/v0.13.3/bootstrap.sh
sudo DOKKU_TAG=v0.13.3 bash bootstrap.sh

# Install Let's Encrypt plugin
sudo dokku plugin:install https://github.com/dokku/dokku-letsencrypt.git
dokku config:set --global DOKKU_LETSENCRYPT_EMAIL=hey@danreev.es
dokku letsencrypt:cron-job --add

# Done
echo
echo
echo "Now visit: $(curl -sS ifconfig.me)"
