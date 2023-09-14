#!/bin/bash

# Verify if there is already an uncommented line `/configs/*.conf` in the file `/etc/nginx/nginx.conf` inside `http` config
# if not, the script adds one
if [ $? grep -q "^[^#]*\\s*/configs/.*\\.conf" -eq 1 ]; then

  echo "Configuring the 'include /configs/*.conf;' at /etc/nginx/nginx.conf"

  current_dir=$(dirname "$(pwd)")
  sudo awk -v dir="$current_dir" '/http {/,/^[ \t]*}/ { if (/^[ \t]*}/) print "\tinclude " dir "/configs/*.conf;"; } 1' /etc/nginx/nginx.conf | sudo tee /etc/nginx/nginx.conf.temp
  sudo mv /etc/nginx/nginx.conf.temp /etc/nginx/nginx.conf

fi