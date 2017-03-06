#!/bin/sh

set -e

if [ -z $BASIC_AUTH_USERNAME ]; then
  echo >&2 "BASIC_AUTH_USERNAME must be set"
  exit 1
fi

if [ -z $BASIC_AUTH_PASSWORD ]; then
  echo >&2 "BASIC_AUTH_PASSWORD must be set"
  exit 1
fi

if [ -z $PROXY_PASS ]; then
  echo >&2 "PROXY_PASS must be set"
  exit 1
fi

htpasswd -bBc /etc/nginx/.htpasswd $BASIC_AUTH_USERNAME $BASIC_AUTH_PASSWORD
sed \
  -e "s/##WORKER_PROCESSES##/$WORKER_PROCESSES/g" \
  -e "s/##SERVER_NAME##/$SERVER_NAME/g" \
  -e "s/##PORT##/${PORT:-80}/g" \
  -e "s|##PROXY_PASS##|$PROXY_PASS|g" \
  nginx.conf.tmpl > /etc/nginx/nginx.conf

nginx -g "daemon off;"
