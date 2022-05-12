DOCKER_COMPOSE_FILE = srcs/docker-compose.yml

all : build

build : docker-compose -f ${DOCKER_COMPOSE_FILE} build

up : docker-compose -f ${DOCKER_COMPOSE_FILE} up

down : docker-compose -f ${DOCKER_COMPOSE_FILE} down --volumes

clean : down 
	docker system prune -a -f