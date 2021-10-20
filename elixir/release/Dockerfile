# --- build stage ---
FROM elixir:1.12-alpine AS build

RUN apk add --update alpine-sdk coreutils

RUN mkdir /app
WORKDIR /app

ENV MIX_ENV=prod

COPY mix.exs mix.lock ./
COPY config config
COPY priv priv
COPY lib lib

RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get && \
    mix deps.compile && \
    mix compile && \
    mix release

# --- application stage ---
FROM alpine:3.14

RUN apk add --update bash openssl libstdc++ ncurses-libs

RUN mkdir /app
WORKDIR /app

COPY --from=build /app/_build/prod/rel/my_app ./
RUN chown -R nobody: /app
USER nobody

ENV HOME=/app

CMD ["./bin/my_app", "start"]
