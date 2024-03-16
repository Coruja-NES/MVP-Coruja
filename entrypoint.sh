#!/bin/bash

set -e

echo "APPLICATION CONTAINER ENTRYPOINT STARTED"

while ! nc -zv database 3306; do
  echo "Waiting for database connection availability..."
  sleep 1
done

echo "Database connection established."

uwsgi --ini wsgi.ini


echo "APPLICATION CONTAINER ENTRYPOINT FINISHED"

exec "$@"
