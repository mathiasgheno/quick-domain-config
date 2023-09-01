#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <domain_name>"
  exit 1
fi

DOMAIN=$1

if grep -q "^[^#].*\b$DOMAIN\b" /etc/hosts; then
  sudo sed -i "/\b$DOMAIN\b/ s/^/#/" /etc/hosts
  echo "Domain $DOMAIN has been commented out in /etc/hosts."
  else
      echo "Domain $DOMAIN is not found or is already commented out in /etc/hosts."
fi