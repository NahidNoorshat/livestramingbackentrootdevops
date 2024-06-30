#!/bin/sh

# Exit on error
set -e

# Apply database migrations
echo "Applying database migrations..."
python manage.py makemigrations
python manage.py migrate

# Collect static files
echo "Collecting static files..."
python manage.py collectstatic --noinput


# Start the Gunicorn server
echo "Starting Gunicorn server..."
exec gunicorn livestramingbackend.wsgi:application --bind 0.0.0.0:8000