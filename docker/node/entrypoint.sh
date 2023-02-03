#!/bin/sh
set -e

COMMAND="${1:-server}"

if [ $COMMAND == "server" ]; then
  echo "Starting server..."
  npm run start:prod
elif [ $COMMAND == "migrate" ]; then
  echo "Running migrations..."
  typeorm migration:run -d /app/dist/src/database/datasource.js
elif [ $COMMAND == "seed" ]; then
  echo "Seeding database..."
  node /app/dist/src/cli.js db-seed
else
  echo "Usage: entrypoint.sh [server|migrate|seed]"
  exit 1
fi
