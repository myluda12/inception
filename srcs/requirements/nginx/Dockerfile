FROM debian:buster

RUN apt-get update && apt-get upgrade -y\
	&& apt-get install -y vim

RUN apt-get install -y nginx

RUN apt-get install -y openssl

RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=ayajrhou.42.fr" -addext "subjectAltName=DNS:ayajrhou.42.fr" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;

ADD conf/default /etc/nginx/sites-available/

ENTRYPOINT  nginx -g 'daemon off;'