#!/bin/bash

rm -rf ../configs
mkdir ../configs

# Lê cada chave e valor do router.json
jq -r 'to_entries[] | "\(.key) \(.value)"' ../router.json | while read -r domain redirect_url; do
    # Gera a configuração para o Nginx
    config_content="server {
    listen 80;
    server_name $domain;

    location / {
        return 301 $redirect_url;
    }
}
"
    # Escreve a configuração em um arquivo .conf
    echo "$config_content" > "../configs/$domain.conf"
done
