TARGET_GROUP=majestic

# Create a new tmux session
yarn tmux new-session \
  -d \
  -s $TARGET_GROUP

# Start the process in the tmux session
yarn tmux send-keys -t $TARGET_GROUP "yarn --cwd ../.. test:majestic" C-m
