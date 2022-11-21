FROM ruby:3.0.0-buster

# skip apt key parsing warning
ARG APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1

ENV RAILS_ENV production
ENV RACK_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true
ENV BUNDLE_PATH /app/vendor/gems

WORKDIR /app

RUN echo "deb http://apt.postgresql.org/pub/repos/apt buster-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
    && wget --quiet -O - https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && apt-get update && apt-get install -y --no-install-recommends \
        nodejs \
        yarn \
        libpq-dev \
        ca-certificates \
        postgresql-client-10

COPY Gemfile* /app/
RUN bundle config --global frozen 1 \
    && bundle config --global set without 'development test' \
    && bundle config set force_ruby_platform true \
    && bundle install --jobs 4 --retry 2

COPY . /app
RUN DATABASE_URL=postgresql:null RAILS_ENV=production bundle exec rake assets:precompile

ENTRYPOINT [ "/app/entrypoint.sh" ]
EXPOSE 3000
CMD ["server"]
