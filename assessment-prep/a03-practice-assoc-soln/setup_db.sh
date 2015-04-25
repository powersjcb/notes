#!/usr/bin/env sh

bundle exec rake db:schema:load
bundle exec rake db:seed
RAILS_ENV=test bundle exec rake db:schema:load
RAILS_ENV=test bundle exec rake db:seed
