# Database Seeds
## Learning Goals
- What are seeds?
- Why would we need seeds?
- How to create seeds?

## What and Why?
_Seeds_ are pieces of data that you configure to use as starter data for your web application. Seeds might be a few sample blog posts, or a few possible tasks for your task list.

Since "data" in a Rails application is accessed through Model objects, seeds create model objects. It's good to set up some seeds to start with so that you don't have to manually add Model objects through the `rails console` or wait until your object creation form works.

## Create Seeds
Rails applications come pre-installed with an empty seed file, `db/seeds.rb`. Once you populate this file and run the corresponding `rails` command, your database will be populated with the data you configured.

The seed file is a "normal" ruby file, and it has access to the Model objects that we set up in our application. If we want to create a number of seeded objects, we can create a list with the properties for each object, then iterate over it, creating objects as we go.

This is a simplified example which assumes that we have already created an `Author` model object which has a `name` and a `bio` field in the schema.
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

Once this seed file is ready to go, we run this rails command in the terminal to populate the database.

```bash
rails db:seed
```

If this command runs successfully, we can go into the `rails console` to verify that the data was set up successfully.

```bash
rails console
2.3.1 :001> Author.all
```

If you want to delete all the data in the database (be very very careful) and reseed you can also use reset.

```bash
rails db:reset
```

## Resources
Seeds can work with any number of Model objects that you have configured, not just one!

[RailsZilla Seed Example](http://www.railszilla.com/rails-seed-data-example/rails)
