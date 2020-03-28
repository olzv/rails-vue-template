# Created by https://github.com/olzv
FROM ruby:2.6.5

RUN apt-get update && apt-get install -y postgresql-client

RUN apt-get update && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt install -y yarn


# throw errors if Gemfile has been modified since Gemfile.lock
#RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

COPY webpack-dev-server-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/webpack-dev-server-entrypoint.sh

COPY Gemfile Gemfile.lock ./
ARG bundle_on_build

RUN if [ "$bundle_on_build" != "false" ]; then bundle install; fi
RUN if [ "$bundle_on_build" != "false" ]; then yarn install; fi

COPY . .

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
