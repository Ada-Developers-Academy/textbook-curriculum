# Database Seeds

## Learning Goals

- What are database seeds?
- Why would we need seeds?
- How do we create database seeds?
- What does the `rails db:seed` command do?

## What and Why

> **Database seeding is the initial seeding of a database** with data. **Seeding a database** is a process in which an initial set of data is provided to a database when it is being installed . It is especially useful **when we want to populate the database** with data we want to develop in future.

- [_Wikipedia article on Database Seeding_](https://en.wikipedia.org/wiki/Database_seeding)

_Seeds_ are pieces of data that you configure to use as starter data for your web application. Seeds might be a few sample blog posts, or a few possible tasks for your task list.

Specifically in a Rails application, because "data" is typically accessed through Model objects, we'll use seeds to create model objects that save to the database. It's good to set up some seeds to start with so that you don't have to manually add Model objects through the `rails console` or wait until your object creation form works.

## Creating Database Seeds in Rails

Rails applications come pre-installed with an empty seed file located in each app at `db/seeds.rb`. This file, `db/seeds.rb`, is usually a Ruby script configured to populate the database with specific pieces of data. The script run with the command `$ rails db:seed`

The seed file is a "normal" ruby file, and it has access to the Model objects that we set up in our application. If we want to create a number of seeded objects, we can create a list with the properties for each object, then iterate over it, creating objects as we go.

### Reading Through an Example

This is a simplified example which assumes that we have already created an `Author` model object which has a `name` and a `bio_url` field in the schema.

```ruby
# db/seeds.rb
authors = [
  {
    name: "Margot Lee Shetterly",
    bio_url: "https://en.wikipedia.org/wiki/Roxane_Gay"
  },
  {
    name: "Sandi Metz",
    bio_url: "https://en.wikipedia.org/wiki/Sandi_Metz"
  },
  {
    name: "Octavia E. Butler",
    bio_url: "https://en.wikipedia.org/wiki/Octavia_E._Butler"
  }
]

authors.each do |author|
  Author.create(author)
end
```

Once this seed file is ready to go, we run the Rails seed command in the terminal to run the seed script, which populates the database.

```bash
$ rails db:seed
```

If this command runs successfully, we can go into the `rails console` to verify that the data was set up successfully.

```bash
$ rails console
```

```bash
Author.all
```

## More about Databases: Clearing the Database

Most seed files focus on adding new records of Models. If you want to delete all the data in the database (be very very careful) and reseed ,you can use reset command:

```bash
$ rails db:reset
```

## Resources

Seeds can work with any number of Model objects that you have configured, not just one!

[RailsZilla Seed Example](http://www.railszilla.com/rails-seed-data-example/rails)
