#!/bin/bash -l

if [ -z $AWS_ACCESS_KEY_ID ]; then
    echo 'Environment variable AWS_ACCESS_KEY_ID is missing';
    exit;
fi

if [ -z $AWS_SECRET_ACCESS_KEY ]; then
    echo 'Environment variable AWS_SECRET_ACCESS_KEY is missing';
    exit;
fi

docker run --rm \
    -v "/etc/letsencrypt:/etc/letsencrypt" \
    -e AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}" \
    -e AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}" \
    certbot/dns-route53 \
    certonly \
    -d *.sobekcore.com \
    --force-renew \
    --dns-route53

cd "${HOME}/side-projects-provider/docker"
docker compose restart server
