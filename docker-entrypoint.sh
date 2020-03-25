#!/bin/bash
# Created by https://github.com/olzv
set -e

if [[ "$DRY_RUN" == 'true' ]]; then
  echo
  echo "Running in DRY Mode!!!"

  echo
  echo "Cleaning up ruby gems"
  rm -rf vendor/bundle/*
  echo "Done."
  echo

  echo
  echo "Cleaning up node_modules"
  rm -rf node_modules
  echo "Done."
  echo
fi

bundle check || bundle install --path $BUNDLE_PATH
chmod -R a+rwX $BUNDLE_PATH

yarn install

until pg_isready; do
  >&2 echo "Postgres is not yet available - Waiting..."
  sleep 2
done

if [[ "$DRY_RUN" == 'true' ]]; then
  echo
  echo "Dropping the database"
  bundle exec rails db:drop
  echo "Done."
  echo
fi

if [ "$( psql -tAc "SELECT 1 FROM pg_database WHERE datname='${DB_NAME_PREFIX}_${RAILS_ENV}'" )" = '1' ]
then
    echo "Database already exists."
else
    if [ -z "$DATABASE_URL" ]; then
      echo "Database does not exist. Creating one..."
      bundle exec rails db:create

      echo "Seeding DB ..."
      bundle exec rails db:seed
    fi
fi

if [[ "$MIGRATE_ON_START" == 'true' ]]; then
  bundle exec rails db:migrate
else
    echo 'MIGRATE_ON_START disabled. Skipping migrations...'
fi

exec "$@"
