#!/bin/bash

(
  ssh $SSH_USERNAME@$SSH_HOSTNAME -o StrictHostKeyChecking=no <<-EOF
    cd /home/cheeseweasel/apps/mindfulnessreminder
    docker login --password $DOCKER_PASSWORD --username $DOCKER_USER
    docker stack deploy -c mindfulnessreminder-stack.yml mindfulnessreminder
EOF
)
