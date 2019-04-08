# Installfest for Rails

## Introduction

Ruby on Rails (or _RoR_, or _Rails_) is a framework used to create web applications. While we will continue to implement features in the Ruby programming language, Ruby on Rails has dependencies and patterns that will allow us to create more interesting programs, as long as we follow their conventions. Before we get to use Rails, we will need to install the world, again!

## Learning Goals

At the end of this lesson, you should be able to

- Have a list of dependencies to install in order to begin the Rails curriculum at Ada

### PostgresQL

The web applications we write will begin to use a [_database_](https://en.wikipedia.org/wiki/Database), or a mechanism to save, update, access, and manage a collection of data. In Ruby on Rails, our preferred database that we will use is [PostgreSQL](https://www.postgresql.org/) (or _Postgres_)

1. In any directory, run `$ brew install postgresql`
1. Run this command to make postgresql start at login:  `brew services start postgresql`
1. Verify that it gives a success message

### Ruby on Rails

[Ruby on Rails](https://en.wikipedia.org/wiki/Ruby_on_Rails) is distributed as a gem!

1. In any directory, run `$ gem install rails --no-rdoc --no-ri`
1. Verify that it gives a success message

## Related Topics

Related configuration/set-up steps include the following:

- Now is a good time to check that you're still using the preferred version of Ruby.
- [Rails template](https://guides.rubyonrails.org/rails_application_templates.html), which is one method to set-up how all new Rails applications should look on a local machine. In [the Ada curriculum](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/08-rails/rails-template-setup.md), we will go over this all together as a class, so that we may scaffold every Rails project with our preferred configurations at Ada.
  - If you aren't being guided in-class to go through installing the rails-template, you shouldn't follow this step. This information is being included in this guide for completeness
