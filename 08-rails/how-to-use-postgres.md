
# Setting Up A Rails Project with Postgres

Postgres (or PostgreSQL) is an open-source database which can provide scalability to your application.  By default Rails development sites use sqlite3 which can work fine, but it can be easier to use the same database application in development & production.  

## SQLite vs Postgres

SQLite is a "serverless" database which means there isn't a separate database program running to manage access to the data, instead the application accesses an SQLite file directly, similar to how our previous Ruby programs accessed CSV files.  

The advantage is that there's almost no configuration involved in setting up an SQLite database and no access-control setup.  So SQLite is simple to get up and running.  

SQLite runs into trouble when multiple programs access the same database directly.  There's not a server coordinating access and keeping two users from writing to the same data.  Instead SQLite uses file blocks to keep one program from accessing the data while another is writing to it.  This is far less efficient than using a server to coordinate access.  So an SQLite database is not well suited to a site with lots of simultaneous accesses.  It can however serve for sites which receive low levels of traffic and which do not share a database with other applications.  For the most-part we do not use SQLite for a production website.  However it is a very easy-to-use database for development.

Postgres is a more traditional client-server database which runs a separate process that Rails will communicate with to access data.  

The downside is that we need to setup a Postgres server and deal with some configuration of the database before we can use it.  

On the upside using Postgres on both the development and production ends means reduces any chances of problems when deploying our app on the web via AWS or Heroku. AWS and Heroku separate the database & application and database servers, so the two services run on separate machines.  SQLite does not support this configuration, it has to be on the same server as your rails application.  


## Installing Postgres

To install Postgres you can use the Brew package manager, then set brew to start postgres to launch every time the machine reboots and set it up so that postgres is the default database.  

**These steps you only need perform once.**

```bash
$ brew install postgresql
...
$ brew services start postgresql
...
$ echo "-d postgresql" > ~/.railsrc
...
```

## To setup a rails project with Postgres

After Postgres is installed and configured you can create new rails apps with postgres this way.  `rails db:migrate` is an essential step because it sets up the required tables in the database for a successful start of the rails server.  

```bash
$ rails new my-rails-project
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

The database.yml file specifies how the Database is configured for the Rails application.  In the below example you can replace <APPLICATION_NAME> with the name of the database you choose.  For example in a database of books, you could name it.  `database:  library_development` etc.  

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
  database: <APPLICATION_NAME>_development
# ...
test:
  <<: *default
  database: <APPLICATION_NAME>_test

production:
  <<: *default
  database: <APPLICATION_NAME>_production
  username: <APPLICATION_NAME>
  password: <%= ENV['<APPLICATION_NAME>_DATABASE_PASSWORD'] %>
```

Then run `bundle install` and `rails db:reset` and `rails db:migrate`.  You can now use the Postgres database instead of the default SQLite3.

## Learning Summary
We use the Postgres database to ensure more reliable database performance and fewer issues once we deploy our applications to Heroku. Once we have completed these setup steps, the Rails configuration on our computer will choose Postgres for each new Rails application we create, so we won't need to run these steps again.

## Resources

-  [SQLite Wikipedia Page](https://en.wikipedia.org/wiki/SQLite)
-  [Postgres Wikipedia Page](https://en.wikipedia.org/wiki/PostgreSQL)
-  [Appropriate uses for SQLite3](https://www.sqlite.org/whentouse.html)
