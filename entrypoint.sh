#!/usr/bin/env sh
set -e

echo "Waiting for Postgres at db:5432..."
until pg_isready -h db -p 5432 -U cinema_user >/dev/null 2>&1; do
  sleep 1
done
echo "Postgres is up. Applying migrations..."

python manage.py migrate --noinput

echo "Collecting static files..."
python manage.py collectstatic --noinput --clear

echo "Starting app: $@"
exec "$@"

