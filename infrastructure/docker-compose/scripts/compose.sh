# Point shell context to the current environment's terraform host
export $(yarn --cwd ../terraform environment)

# Export cloud computer shell environment
export $(yarn --cwd ../cloud-computer environment)

# Export local git config
export $(yarn --cwd ../git environment)

# Make the cloud computer aware of its address
export CLOUD_COMPUTER_DEVELOPMENT_ENVIRONMENT_IP=$(yarn --cwd ../terraform ip)

yarn --cwd ../docker docker run \
  --env COMPOSE_PROJECT_NAME \
  --env DOCKER_CONFIG=$CLOUD_COMPUTER_DOCKER \
  --env GIT_AUTHOR_EMAIL \
  --env GIT_AUTHOR_NAME \
  --env GIT_COMMITTER_EMAIL \
  --env GIT_COMMITTER_NAME \
  --env IMAGE_TAG \
  --env CLOUD_COMPUTER_BACKEND \
  --env CLOUD_COMPUTER_CERTIFICATES \
  --env CLOUD_COMPUTER_CREDENTIALS \
  --env CLOUD_COMPUTER_DEVELOPMENT_ENVIRONMENT_IP \
  --env CLOUD_COMPUTER_CODE \
  --env CLOUD_COMPUTER_CODE_SERVER \
  --env CLOUD_COMPUTER_DOCKER \
  --env CLOUD_COMPUTER_FRONTEND \
  --env CLOUD_COMPUTER_GCLOUD \
  --env CLOUD_COMPUTER_GITHUB \
  --env CLOUD_COMPUTER_GITHUB_TOKEN \
  --env CLOUD_COMPUTER_HOME \
  --env CLOUD_COMPUTER_HOST_DNS \
  --env CLOUD_COMPUTER_HOST_ID \
  --env CLOUD_COMPUTER_HOST_NAME \
  --env CLOUD_COMPUTER_HOST_USER \
  --env CLOUD_COMPUTER_KUBECONFIGS \
  --env CLOUD_COMPUTER_NODEMON \
  --env CLOUD_COMPUTER_SLACKBOT \
  --env CLOUD_COMPUTER_TERRAFORM \
  --env CLOUD_COMPUTER_TMUX \
  --env CLOUD_COMPUTER_X11 \
  --env CLOUD_COMPUTER_XEPHYR_DISPLAY \
  --env CLOUD_COMPUTER_YARN \
  --env TERRAFORM_TARGET \
  --interactive \
  --rm \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  --volume $CLOUD_COMPUTER_BACKEND_VOLUME:$CLOUD_COMPUTER_BACKEND \
  --volume $CLOUD_COMPUTER_CERTIFICATES_VOLUME:$CLOUD_COMPUTER_CERTIFICATES \
  --volume $CLOUD_COMPUTER_DOCKER_VOLUME:$CLOUD_COMPUTER_DOCKER \
  --workdir $CLOUD_COMPUTER_BACKEND/infrastructure/docker-compose \
  wernight/docker-compose "$@"
