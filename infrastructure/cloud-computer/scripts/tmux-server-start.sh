# Export cloud computer shell environment
export $(yarn environment)

# The container that starts the tmux server will run all subsequent tmux commands, not the container that issued the command.
yarn tmux new-session -d -s tmux-server zsh 2>/dev/null

# Set environment for all sessions
yarn tmux set-environment -g DISPLAY $CLOUD_COMPUTER_XEPHYR_DISPLAY
yarn tmux set-environment -g CLOUD_COMPUTER_HOST_DNS $CLOUD_COMPUTER_HOST_DNS
