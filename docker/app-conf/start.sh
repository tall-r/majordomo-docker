#!/bin/sh

echo ==========================
env
echo ==========================

echo "export MYSQL_HOST=$MYSQL_HOST" > /etc/apache2/majordomo && \
echo "export MYSQL_PORT=$MYSQL_PORT" >> /etc/apache2/majordomo && \
echo "export MYSQL_DATABASE=$MYSQL_DATABASE" >> /etc/apache2/majordomo && \
echo "export MYSQL_USER=$MYSQL_USER" >> /etc/apache2/majordomo && \
echo "export MYSQL_PASSWORD=\"$MYSQL_PASSWORD\"" >> /etc/apache2/majordomo && \
echo "export MJDM_TITLE=\"$MJDM_TITLE\"" >> /etc/apache2/majordomo && \
echo "export MJDM_BASE_URL=$MJDM_BASE_URL" >> /etc/apache2/majordomo && \

service apache2 start
#service supervisor start

#echo Check database existance...
#echo "mysql --host=$MYSQL_HOST --user=$MYSQL_USER --password=$MYSQL_PASSWORD --database $MYSQL_DATABASE 'SELECT 1'"
#mysql --host=$MYSQL_HOST --user=$MYSQL_USER --password=$MYSQL_PASSWORD --database $MYSQL_DATABASE "SELECT * FROM country WHERE COUNTRY_NAME = 'Russia'"
#status=$?
#echo "Returns: $status"
#[$status -eq 0] && echo "MajorDoMo database $MYSQL_DATABASE already exists." || mysql --host=$MYSQL_HOST --user=$MYSQL_USER --password=$MYSQL_PASSWORD --database $MYSQL_DATABASE < /var/www/db_terminal.sql

tail -f /var/logs/www/* & /usr/bin/php /var/www/cycle.php
