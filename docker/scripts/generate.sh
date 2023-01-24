#!/bin/bash

docker run -it --rm \
    -v "/etc/letsencrypt:/etc/letsencrypt" \
    certbot/certbot \
    certonly \
    -d *.sobekcore.com \
    --manual \
    --preferred-challenges dns \
    --server https://acme-v02.api.letsencrypt.org/directory
