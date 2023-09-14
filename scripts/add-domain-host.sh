#!/bin/bash

# Verifica se o argumento foi fornecido
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <domain_name>"
    exit 1
fi

DOMAIN=$1

# Verifica se o domínio já existe em /etc/hosts, ignorando linhas comentadas
grep -q "^[^#].*\b$DOMAIN\b" /etc/hosts

# $? é uma variável especial que armazena o status da última execução de comando.
# Se grep não encontrar o domínio, retornará 1 (indicando falha).
if [ $? -eq 1 ]; then
    echo "127.0.0.1  $DOMAIN" | sudo tee -a /etc/hosts
    echo "Added $DOMAIN to /etc/hosts."
else
    echo "$DOMAIN already exists in /etc/hosts."
fi
