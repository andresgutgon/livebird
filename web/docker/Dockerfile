# Use an official Elixir runtime as a parent image
FROM elixir:latest

RUN apt-get update && \
apt-get install -y postgresql-client

# Create app directory and copy the Elixir projects into it
RUN mkdir /app
RUN mkdir /docker
COPY ./code /app
COPY ./docker/entrypoint.sh /docker/entrypoint.sh
WORKDIR /app

# Install hex package manager
RUN mix local.hex --force
RUN mix local.rebar --force

# Compile the project
# RUN mix do deps.get
# RUN mix do compile

CMD ["/docker/entrypoint.sh"]
