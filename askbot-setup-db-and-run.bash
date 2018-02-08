#!/bin/bash
askbot-setup --dir-name=. --db-engine=3 \
    --db-name="${ASKBOT_DB_NAME}" \
    --db-user="${ASKBOT_DB_USER}" \
    --db-password="${ASKBOT_DB_PASSWORD}" \
    --db-host="db" \
    --db-port="3306"

sed "s/ROOT_URLCONF.*/ROOT_URLCONF = 'urls'/"  settings.py -i

python manage.py migrate --noinput
python manage.py collectstatic --noinput

python manage.py runserver 0.0.0.0:8080
