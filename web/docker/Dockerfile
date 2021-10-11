# Apple ARM BUG on old distros
# On Apple Silicon in native arm64 containers,
# older versions of libssl in:
# debian:buster, ubuntu:20.04 and centos:8
# will segfault when connected to some TLS servers,
# for example curl https://dl.yarnpkg.com.
# The bug is fixed in newer versions of libssl in:
# debian:bullseye, ubuntu:21.04 and fedora:35.
FROM hexpm/elixir:1.12.0-erlang-24.1-alpine-3.14.0

# Set timezone:
RUN ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && echo $CONTAINER_TIMEZONE > /etc/timezone

# alpine-sdk is the equivalent to ubunto build-essential
RUN apk add --no-cache \
alpine-sdk \
bash \
postgresql-client \
tzdata \
inotify-tools \
nodejs npm yarn

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
RUN mix do deps.get
RUN mix do compile

CMD ["/docker/entrypoint.sh"]
