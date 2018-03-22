# Many-to-Many Relationships

So far, all the relationships we've see have been _one-to-many_. Books and authors are related in this way: a book has one author, an author has many books.

However, many real-world relationships are _many-to-many_. For example, a genre has many books, and a book may fit into more than one genre. Modeling this sort of relationship will require some new techniques.

## Learning Goals

- Define a _join table_
- Use a join table to set up a _many-to-many_ relation in ActiveRecord
- Explore ActiveRecord's model-level support for many-to-many relations
- Build UI elements that reflect many-to-many relations

## Setting up the Relation

Our running example for this lesson will be the many-to-many relation between books and genres. As an example, let's use two books:

1. **Bad Feminist** by _Roxane Gay_
    - Genres: Nonfiction, Feminism, Writing: Essays, Autobiography: Memoir

1. **Hidden Figures** by _Margot Lee Shetterly_
    - Genres: Nonfiction, History, Science, Biography, Historical

We will have a separate table `genres`, and an ActiveRecord model to match. Let's set that up now:

```
$ rails generate model genre name:string
$ rails db:migrate
```

If we had an instance of `Genre`, we might imagine getting a list of books with `genre.books`; similarly with an instance of `Book` we ought be able to call `book.genres`. How might we keep track of this information?

### Join Tables

Databases do not have an "array" data type, so we can't put a list of genres on each book. Instead we will use an intermediate table, referred to as a _join table_, where each row specifies one book-genre pair.

This means we'll need not two but _three_ tables: `books`, `genres` and `books_genres`. Here's how they might look:

**books**

id  | title          | author
--- | ---            | ---
1   | Bad Feminist   | Roxane Gay
2   | Hidden Figures | Margot Lee Shetterly

**genres**

id  | name
--- | ---
1   | Nonfiction
2   | Feminism
3   | History

**books_genres**

id  | book_id | genre_id
--- | ---     | ---
1   | 1       | 1
2   | 2       | 1
3   | 1       | 2
4   | 2       | 3

These tables indicate 4 relations between books and genres:
- Book 1 (Bad Feminist) and genre 1 (Nonfiction)
- Book 2 (Hidden Figures) and genre 1 (Nonfiction)
- Book 1 (Bad Feminist) and genre 2 (Feminism)
- Book 2 (Hidden Figures) and genre 3 (History)

An ERD for this setup might look like this

# TODO

![Many to many ERD](./images/many-to-many-erd.file)

### Building the Join Table

A join table is something that should appear at the database level only - ideally, the rest of our app won't even know it's there. With that in mind we will _not_ build an ActiveRecord model for our new table. Instead of `rails generate model`, we'll say `rails generate migration`:

```
$ rails g migration CreateBooksGenresJoin
```

```ruby
# new migration file
class CreateBooksGenresJoin < ActiveRecord::Migration[5.1]
  def change
    create_table :books_genres do |t|
      t.belongs_to :book, index: true
      t.belongs_to :genre, index: true
      t.timestamps
    end
  end
end
```

Note the `belongs_to` data type. This tells the database that this column is a foreign key, and which sets up some extra restrictions on what can be in this table. This will help prevent us linking a book to a genre that doesn't exist.

The name of the table (`books_genres`) is important - this is the name ActiveRecord will be looking for later. We could call it something else, but that wouldn't be the Rails Way&trade;.

Remember to `rails db:migrate` again.

### The Relation in the Model Layer

ActiveRecord has built-in support for many-to-many relationships using the join table pattern. Our last step is to set up our models to take advantage of this.

```ruby
# app/models/book.rb
class Book < ApplicationRecord
  has_and_belongs_to_many :genres

  # ... the rest of the class ...
end
```

```ruby
# app/models/genre.rb
class Genre < ApplicationRecord
  has_and_belongs_to_many :books
end
```

Just like the `has_many` and `belongs_to` lines we added when we related books and authors, `has_and_belongs_to_many` will give us a bunch of methods to manipulate our new relation.

## Many-to-Many in the Model

The syntax ActiveRecord provides for manipulating many-to-many relations is similar to that for one-to-many relations. Pull open the rails console, and do the following tasks:

1. Make sure your database contains the two books above: _Bad Feminist_ by Roxane Gay, and _Hidden Figures_ by Margot Lee Shetterly
1. Add three genres to your database: _Nonfiction_, _Feminism_, and _History_
1. Load the record for _Bad Feminist_ into a local variable `bad_feminist`, and the record for _Nonfiction_ into a local variable `nonfiction`
1. Set up a relation between the book and the genre
    - You can approach this from either the book side or the genre side. That is, either of these will work:
        - `bad_feminist.genres << nonfiction`
        - `nonfiction.books << bad_feminist`
    - Read the resulting SQL queries. What happened at the database level?
1. Add the other three relations from the tables above
1. Load the list of the genres for _Hidden Figures_
1. Challenge problem: load the list of _Nonfiction_ books, sorted alphabetically by author name

## Building UI Elements

## Summary

## Additional Resources
