#!/bin/bash
# Docker entrypoint script.

# Wait until Postgres is ready
while ! pg_isready -q -h $PGHOST -p $PGPORT -U $PGUSER
do
  echo "$(date) - waiting for database to start"
  sleep 2
done

# Create, migrate, and seed database if it doesn't exist.
if [[ -z `psql -Atqc "\\list $PGDATABASE"` ]]; then
  echo "Database $PGDATABASE does not exist. Creating..."
  createdb -E UTF8 $PGDATABASE -l en_US.UTF-8 -T template0
  mix ecto.migrate
  mix run /app/priv/repo/seeds.exs
  echo "Database $PGDATABASE created."
fi

# For debugging use `iex -S mix phx.server`
# Run only this service wihout Nginx
# docker-compose run -p 4000:4000 web
# Access localhost:4000 for example
echo "::::::::::::::::::::::"
echo "🚀 Running http://${WEB_URL}"
echo "::::::::::::::::::::::"
# exec iex -S mix phx.server
 exec mix phx.server
