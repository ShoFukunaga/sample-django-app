#!/bin/sh

if [ "$DATABASE" = "mysql" ]; then
	echo "Waiting for mysql..."

	while ! nc -z $SQL_HOST $SQL_PORT; do
		sleep 0.1
	done

	echo "MySQL started"
fi

echo "Appling database migrations..."
python manage.py makemigrations
python manage.py migrate

exec "$@"
