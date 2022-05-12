DOCKER_COMPOSE_FILE = srcs/docker-compose.yml

all : up

up :
	mkdir -p /home/ayajrhou/data/wordpress
	mkdir -p /home/ayajrhou/data/mariadb
	docker-compose -f ${DOCKER_COMPOSE_FILE} up --build -d

down : 
	docker-compose -f ${DOCKER_COMPOSE_FILE} down --volumes

clean : down 
	docker system prune -a -f