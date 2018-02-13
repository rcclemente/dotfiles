#!/bin/bash

alias docker-container-stop-all='docker stop $(docker ps -a -q)'
alias docker-container-delete-all='docker rm $(docker ps -a -q)'
alias docker-container-delete-stopped=' docker rm $(docker ps -qa --no-trunc --filter "status=exited")'

alias docker-image-delete-all='docker rmi $(docker images -q)'
alias docker-image-delete-stopped='docker volume rm $(docker volume ls -qf dangling=true); docker rmi $(docker images | grep "none" | awk "/ / { print $3   }")'
