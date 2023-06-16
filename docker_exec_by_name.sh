#!/bin/bash

# Config:
# alias dexec="bash $HOME/.myscripts/docker_exec_by_name.sh"

# Usage:
# dexec redis

docker_exec_cmd() {
	container_name=$1
	container_id=`docker ps | grep "$container_name" | awk '{print $1}'`
	if [ ${#container_id} -eq 12 ]; then
		echo "CONTAINER [$container_id $container_name]"
		docker exec -it $container_id bash
	elif [ ${#container_id} -gt 12 ]; then
		echo "MORE THEN ONE [$container_name]"
	else
		echo "NOT FOUND [$container_name]"
	fi
}

docker_exec_cmd $1
