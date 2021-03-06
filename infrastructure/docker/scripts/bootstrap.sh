# Point shell context to the current environment's docker host and volumes
export $(yarn environment)

# Create the CLOUD_COMPUTER_DOCKER volume and take ownership of it
docker run \
  --rm \
  --user root \
  --volume $CLOUD_COMPUTER_DOCKER_VOLUME:$CLOUD_COMPUTER_DOCKER \
  cloud-computer/cloud-computer:latest \
  chown -R cloud:cloud $CLOUD_COMPUTER_DOCKER
