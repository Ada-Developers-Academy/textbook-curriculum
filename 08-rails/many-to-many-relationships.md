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

### Join Table

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

## Many-to-Many in the Model

## Building UI Elements

Let's use an example in our book application to classify books under certain genres.


To implement this feature we'll want to:
1. Add a genre resource & all CRUD functionality (controller, model, views, routes)
  ```bash
  rails g controller genres
  rails g model genre
  ```

  ```ruby
  create_table :genres do |t|
    t.string :name

    t.timestamps
  end
  ```
1. When books are created, allow them to be associated one to many genres
1. Have a view to see all books in a particular genre

## Summary

## Additional Resources
