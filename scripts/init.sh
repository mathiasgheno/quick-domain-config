#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Please, run it as root";
  exit 1
fi

ls ../ | grep router.json
if [ $? -ne 0 ]; then
  echo "You need to provide an router.json file"
  exit 1
fi

jq . ../router.json
if [ $? -ne 0 ]; then
  echo "File router.json has sintax error"
  exit 1
fi

echo "Making all scripts executable"

find ./ -type f -name "*.sh" -exec chmod +x {} \;
if [ $? -ne 0 ]; then
  echo "Error giving permissions to files"
  exit 1
fi

./generate-configs.sh
if [ $? -ne 0 ]; then
  echo "Error in execution of generate-configs.sh"
  exit 1
fi

./config-nginx.sh
if [ $? -ne 0 ]; then
  echo "Error in execution of config-nginx.sh"
  exit 1
fi

./config-hosts.sh
if [ $? -ne 0 ]; then
  echo "Error in execution of config-hosts.sh"
  exit 1
fi

echo "Restart nginx..."
sudo systemctl restart nginx
sudo nginx -s reload