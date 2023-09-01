#!/bin/bash

ROUTER_FILE="../router.json"

if [ ! -f "$ROUTER_FILE" ]; then
  echo "File $ROUTER_FILE not found!";
  exit 1
fi

jq -r 'keys[]' $ROUTER_FILE | while read domain; do
  ./add-domain-host.sh $domain
done