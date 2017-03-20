
# Setting Up A Rails Project with Postgres

Postgres (or PostgreSQL) is an open-source database which can provide scalability to your application.  By default Rails development sites use sqlite3 which can work fine, but it can be easier to use the same database application in development & production.  


## Installing Postgres

To install Postgres you can use the Brew package manager, then set brew to start postgres to launch every time the machine reboots and lastly install the pg gem to allow Ruby to talk to the database.  

These steps you only need perform once.

```bash
$ brew install postgresql
...
$ brew services start postgresql
...
$ gem install pg
...
```

## To setup a rails project with Postgres

After Postgres is installed and configured you can create new rails apps with postgres this way.  `rails db:migrate` is an essential step because it sets up the required tables in the database for a successful start of the rails server.  

```bash
$ rails new my-rails-project -d postgresql
...
$ rails db:reset
$ rails db:migrate
...
```

## Converting Rails Apps Using Sqlite3


If you have already created a Rails app using SQLite3 and want to use Postgres you can do so by editing the `Gemfile` and `config/database.yml` file.

### Editing the Gemfile
In the Gemfile convert:  

```ruby
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
``` 

to:

```ruby
# Use pg as the database for Active Record
gem 'pg'
```

### Editing the `config/database.yml` File

Convert `config/database.yml` from:

```ruby
default: &default
  adapter: sqlite3
  pool: 5
  timeout: 5000

development:
  <<: *default
  database: db/development.sqlite3
# ...
test:
  <<: *default
  database: db/test.sqlite3

production:
  <<: *default
  database: db/production.sqlite3
```

to:

```ruby
default: &default
  adapter: postgresql
  encoding: unicode
  # For details on connection pooling, see rails configuration guide
  # http://guides.rubyonrails.org/configuring.html#database-pooling
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>

development:
  <<: *default
  database: postgres-app2_development
# ...
test:
  <<: *default
  database: postgres-app2_test

production:
  <<: *default
  database: postgres-app2_production
  username: postgres-app2
  password: <%= ENV['POSTGRES-APP2_DATABASE_PASSWORD'] %>
```

Then run `bundle install` and `rails db:reset` and `rails db:migrate`.  You can now use the Postgres database instead of the default SQLite3.