# Relations Exercise: Authors and Books

## Objective

Let's update our Books application from our previous lectures to adopt the new `Author` model and create a relationship between `Book`s and `Author`s. In this activity, we will execute the steps in order to introduce and establish this relationship in a Rails app.

## Before We Get Started

Before we get started, let's all start from the same code base with the same models, commit history, and database configuration.

If you have a copy of the class Books application with **no commits or work written by yourself** on your computer, `cd` to that project and execute `git pull origin master`.

If you **do not** have a copy of the class Books application with no extra work or commits, follow these steps:

1. Find the github link for your class Books repo
1. `mkdir active-record-relationships`
1. `cd active-record-relationships`
1. `git clone <YOUR-CLASS-BOOKS-REPO>`
1. `cd <your-class-books-directory>`
1. `bundle install`
1. `rails db:drop db:create db:migrate`

### Verify

For both cases, verify that your rails app is as expected... or at least, that you can make `Book`s.

1. run `rails c`
1. in rails console, execute this or something like this (your instructors should verify this command based on variations that the Books app could go): `Book.create(title: '99 Bottles of OOP', author: 'Sandi Metz', description: 'A practical guide to writing cost-effective, maintainable, and pleasing object-oriented code')`
1. Run `Book.all` to see that the new book was saved into the database

## Intro

Now that we are all working from the same codebase and same understanding of what our `Book` model is currently, we will complete the following steps to modify our application to support the new **one-to-many** relationship with `Author`s.

Note: We will lose some data in this process and that is OK for now.

1. Remove the existing `author` column on the books table
1. Create a new `authors` table and `Author` model.
1. Add an `author_id` column to the `books` table to relate to the two tables
1. Set up the model relationship
1. Set up some test data
1. Test it out!
1. Update the controllers and views

## Step One

In this step, we will remove the existing `author` column from the `books` table.

1. Create a new migration where we will modify the existing table.

    `rails g migration remove_author_from_books`

1. Open the corresponding migration file and add the contents using the Rails migration syntax for removing an existing column in the database.

    `remove_column :table_name, :column_name`

    ```ruby
    def change
      remove_column :books, :author
    end
    ```

1. Save and run the migration

    `rails db:migrate`

1. Verify: examine the `schema.rb` file and ensure the author field on the books table is gone.

## Step Two

In this step, we will create a new, separate table for authors.

1. Create a new authors table and model via the following command

    `rails g model Author`

1. Open the corresponding migration file and add a new string column for `name`

    ```ruby
    def change
      create_table :authors do |t|
        t.string :name

        t.timestamps
      end
    end
    ```

1. Save and run the migration

    `rails db:migrate`

1. Verify: examine the `schema.rb` file and ensure the new `authors` table has appeared.

## Step Three

In this step, we will link the `authors` and `books` tables.

1. Create a new migration where we will modify the existing books table to add the author relationship.

    `rails g migration AddAuthorIdToBooks`

1. Open the corresponding migration file and add the contents using the Rails migration syntax for adding a new relationship/reference.

    ```ruby
    def change
      add_reference :books, :author, foreign_key: true
    end
    ```

1. Save and run the migration

    `rails db:migrate`

1. Verify: examine the `schema.rb` file and ensure that there is now some additional information on the `books` table related to the `author`.

## Step Four

In order for ActiveRecord to establish this relationship with the "dot methods" we want to use, we must modify the model objects to contain the relationship reference.

1. Update the `Book` model
    ```ruby
    # app/models/book.rb
    class Book < ApplicationRecord
      belongs_to :author   # singular
    end
    ```

1. Update the `Author` model
    ```ruby
    # app/models/author.rb
    class Author < ApplicationRecord
      has_many :books   # plural
    end
    ```

## Step Five

To set up some test data, let's dive into the Rails console to create some database and model associations.

1. Create a new `Author`
1. Set a `Book` instance to have the `Author` we created in step #1
1. Repeat!

## Step Six

How would you do each of the following?

1. Get the author for book 3
1. Get all the books written by author 7
1. Get the number of books written by author 7
1. Create a new book and associate it with author 4 in one go

Investigate some of the dot methods in the previous notes. Find something wacky you can do!

## Step Seven

Since we have updated the way that the data is retrieved within our books application, we need to update the views that go along with this data.

1. Locate the views where the author name is displayed. Update the view code to use the author's name rather than an author field directly.

    From `book.author` to `book.author.name`

1. Locate the view where the new book form is located. Switch the form from using a `text_field` for the author to using a `select`. You can read more about the different types of select tags Rails provides [here](http://guides.rubyonrails.org/form_helpers.html#making-select-boxes-with-ease).

    Within a `form_with` you can use:
    `<%= f.select :author_id, Author.all.map{ |auth| [auth.name, auth.id] } %>`

1. Since we're now sending the `author_id` instead of the author's name, we'll need to update the strong params in our `BooksController`.

    ```ruby
    # app/controllers/books_controller.rb
    class BooksController < ApplicationController
      # ... all the actions ...
      private
      def book_params
        # Fill in other field names as appropriate
        return params.require(:book).permit(:title, :author_id)
      end
    end
    ```

## Conclusion

ActiveRecord provides powerful tools for building relations between different models. Taking advantage of these tools has three main steps:

- Use migrations to set up the database
- Add the relations to the model classes
- Use the relations in your controllers and views

Relations are a key part of what makes databases great - they're the **R** in RDB. The skills and techniques we learn for managing them will apply in many settings. Being able to use relations effectively is an essential part of working with Rails, and we will continue to practice them over the coming weeks.
