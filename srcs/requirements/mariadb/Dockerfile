FROM debian:buster


RUN apt-get update && apt-get upgrade -y\
	&& apt-get install -y vim

RUN apt-get install mariadb-server -y

RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

ADD conf/wordpress.sql .

ENTRYPOINT  service mysql start \
			; mysqlshow | grep $DB_NAME || \
 			sed -i "s/database_name_here/$DB_NAME/g" wordpress.sql \
            && sed -i "s/username_here/$DB_USER/g" wordpress.sql \
			&& sed -i "s/password_here/$DB_PASSWORD/g" wordpress.sql \
			&& mysql < wordpress.sql \
			&& mysql -e "USE mysql; ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}'; FLUSH PRIVILEGES;" \
			; mysqladmin -u root -p${DB_ROOT_PASSWORD} shutdown \
			; mysqld_safe

