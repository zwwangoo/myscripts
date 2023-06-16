#!/bin/bash

# Config:
# alias dlogs="bash $HOME/.myscripts/docker_logs_by_name.sh"

# Usage:
# dlog redis

docker_logs_cmd() {
	container_name=$1
	container_id=`docker ps | grep "$container_name" | awk '{print $1}'`
	if [ ${#container_id} -eq 12 ]; then
		echo "CONTAINER [$container_id $container_name]"
		docker logs -f --tail 100 $container_id
	elif [ ${#container_id} -gt 12 ]; then
		echo "MORE THEN ONE [$container_name]"
	else
		echo "NOT FOUND [$container_name]"
	fi
}

docker_logs_cmd $1
