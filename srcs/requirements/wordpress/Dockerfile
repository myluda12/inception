FROM debian:buster

RUN apt-get update && apt-get upgrade -y\
	&& apt-get install -y vim

RUN apt-get install -y php-fpm php-mysql

RUN apt-get install wget -y

RUN apt-get install -y unzip

ENTRYPOINT [ ! -d "/var/www/html/wordpress/" ] && wget -P /var/www/html https://wordpress.org/latest.zip \
            && unzip /var/www/html/latest.zip -d /var/www/html \
            && chown -R $FWORDPRESS_GRP /var/www/html/wordpress/ \
            && mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php \
			&& sed -i 's/database_name_here/'$WP_DATABASE_NAME'/g' /var/www/html/wordpress/wp-config.php \
    		&& sed -i 's/username_here/'$WP_DATABASE_USER'/g' /var/www/html/wordpress/wp-config.php \
    		&& sed -i 's/password_here/'$WP_DATABASE_PASSWORD'/g' /var/www/html/wordpress/wp-config.php \
    		&& sed -i 's/localhost/'$WP_HOSTNAME'/g' /var/www/html/wordpress/wp-config.php \
			&& rm -rf var/www/html/latest.zip \
			; echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf \
			; mkdir -p /run/php/ \
			; /usr/sbin/php-fpm7.3 -F -R