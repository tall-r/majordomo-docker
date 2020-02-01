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

if [ -e /var/www/config.php ] 
then
	echo "/var/www/config.php found..."
else
	mkdir /root/majordomo
	cd /root/majordomo
	echo "Clone majordomo from github..."
	git clone https://github.com/tall-r/majordomo.git
	echo "Copy project files to /var/www/..."
	cp -Rpv /root/majordomo/majordomo/* /var/www/
	cp -f /root/majordomo/majordomo/.htaccess /var/www
	rm -Rf /root/majordomo
	cp /root/config.php /var/www/
	echo "Applying security settings on files in /var/www"
	chown -R www-data:www-data /var/www
 	find /var/www -type d -exec chmod 777 {} \;
    	find /var/www -type f -exec chmod 666 {} \;

	chmod -R +x /var/www/*.sh
	/var/www/install_linux.sh
	usermod -a -G audio www-data

	if [ $MJDM_CREATEDB -eq "YES" ] 
	then
		echo "Creating database structure..."
		mysql --host=$MYSQL_HOST --port $MYSQL_PORT --user=$MYSQL_USER --password=$MYSQL_PASSWORD --database $MYSQL_DB < /var/www/db_terminal.sql
	fi
fi

service apache2 start
#service supervisor start

#echo Check database existance...
#echo "mysql --host=$MYSQL_HOST --user=$MYSQL_USER --password=$MYSQL_PASSWORD --database $MYSQL_DATABASE 'SELECT 1'"
#mysql --host=$MYSQL_HOST --user=$MYSQL_USER --password=$MYSQL_PASSWORD --database $MYSQL_DATABASE "SELECT * FROM country WHERE COUNTRY_NAME = 'Russia'"
#status=$?
#echo "Returns: $status"
#[$status -eq 0] && echo "MajorDoMo database $MYSQL_DATABASE already exists." || mysql --host=$MYSQL_HOST --user=$MYSQL_USER --password=$MYSQL_PASSWORD --database $MYSQL_DATABASE < /var/www/db_terminal.sql

tail -f /var/logs/www/* & /usr/bin/php /var/www/cycle.php
