#!/bin/sh
set -e

COMMAND="${1:-server}"

echo "Command: $COMMAND"

if [ "$COMMAND" = "server" ]; then
  echo "Starting server..."
  bundle exec puma -b tcp://0.0.0.0:3000 -t 5:5 -e ${RACK_ENV}
elif [ "$COMMAND" = "worker" ]; then
  echo "Starting worker..."
  bundle exec sidekiq -e ${RACK_ENV} -C config/sidekiq.yml
elif [ "$COMMAND" = "migrate" ]; then
  echo "Running migrations..."
  bundle exec rails db:migrate
elif [ "$COMMAND" = "console" ]; then
  echo "Starting console..."
  bundle exec rails c
else
  echo "Usage: entrypoint.sh [server|worker|migrate|console]"
  exit 1
fi
