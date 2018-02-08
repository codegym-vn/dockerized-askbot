#!/bin/bash

# try to connect DB before setting up
echo "*****SET UP ASKBOT DB******"
until nc -z -v -w 5 db 3306
do
  echo "Attempting connect database connection..."
  sleep 2
done


askbot-setup --dir-name=. --db-engine=3 \
    --db-name="${ASKBOT_DB_NAME}" \
    --db-user="${ASKBOT_DB_USER}" \
    --db-password="${ASKBOT_DB_PASSWORD}" \
    --db-host="db" \
    --db-port="3306"

sed "s/ROOT_URLCONF.*/ROOT_URLCONF = 'urls'/"  settings.py -i

python manage.py migrate --noinput

python setup.py install

python manage.py runserver 0.0.0.0:8080
