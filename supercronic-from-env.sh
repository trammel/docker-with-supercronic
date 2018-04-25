#!/bin/sh -e

cd $(dirname $0)

if [ -z ${CRONTAB+x} ]; then
  echo "CRONTAB environment variable must be set"
  exit 1
fi

date # For debugging, so people know what TZ the container is running in.
echo "$CRONTAB" > ./crontab
echo "CRONTAB:"
cat ./crontab
exec /usr/local/bin/supercronic ./crontab
