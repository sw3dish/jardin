FROM elixir:1.14.5
MAINTAINER Colin Burr <colin@colin.id>

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y inotify-tools

# Install node
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - &&\
    apt-get install -y nodejs

# Install hex + rebar
RUN mix local.hex --force && mix local.rebar --force

# Install Phoenix
RUN mix archive.install hex phx_new 1.7.3 --force

COPY . /srv/www

WORKDIR /srv/www/jardin

# Install Elixir dependencies
RUN mix deps.get

CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
