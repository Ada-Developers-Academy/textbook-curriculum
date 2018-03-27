# Nested Routes

## Learning Goals

- Use **nested routes** to make our webapp reflect the structure of our data
- Modify our controllers to take advantage of nested routes
- Build UI elements that interact with nested routes

## Introduction

Currently our library webapp does not reflect the new relation between `Author` and `Book` very well. Selecting from a drop-down menu when you create or edit a book is fine, but we could imagine a much more fluid user experience.

Here are some user stories to consider:
- As a librarian, I want to view the list of books for a specific author
- As a librarian, I want to see a link to add a book for a specific author on the details page for that author

Both these user stories break up the collection of books. They require us to consider the books written by _Octavia Butler_ separately from those written by _Ursula K. Le Guin_. One way to address this problem is by using **nested routes**.

## Nested Routes

The big idea behind nested routes is that we ought to be able to access our collection of books two ways: all the books, and only the books for one author.

Verb | Path                   | Description
---  | ---                    | ---
GET  | `/books`               | Show a list of all books
GET  | `/authors/7/books`     | Show books for author 7
GET  | `/books/new`           | Form to add a new book (needs author dropdown)
GET  | `/authors/7/books/new` | Form to add a new book for author 7 (no dropdown)

To nest routes in Rails, add a block to the `resources` in the route file. Note that we're only nesting the `index` and `new` actions.

```ruby
# config/routes.rb
resources :authors do
  resources :books, only: [:index, :new]
end

# We still want to be able to access the full collection,
# so books needs resources too
resources :books
```

**Activity:** Use `rails routes` to look at the route table. What do you notice about the new nested routes?

When we inspect our route table, we can see two new routes have been added.

```
$ rails routes
         Prefix Verb   URI Pattern                             Controller#Action
   author_books GET    /authors/:author_id/books(.:format)     books#index
new_author_book GET    /authors/:author_id/books/new(.:format) books#new
[... other routes ...]
```

We can make a few observations about these new routes:
- The URI pattern matches what we had in the table above
    - The parameter is called `:author_id`, not `:id`
- Since these routes have prefixes, we can use path helpers (`author_books_path`, `new_author_book_path`)
- These routes point to the same controller actions we were using before. This will help keep things DRY.

**Question:** So far we have only nested the `index` and `new` actions. Should we nest the other 5 RESTful routes? Why or why not?



## Putting it together

Now that we have established the relationship we are expecting and the route that will associate the two resources together, let's see how to get started on our controller implementation.

```ruby
# books_controller.rb
...
def index
  if params[:genre_id]
    # we are in the nested route
    # retrieve books based on the genre
  else
    # we are in our 'regular' route
    @books = Book.all
  end
end
```

Since we are retrieving the books based off of the genre, the query now gets a bit more complex. Since we don't have a `genre_id` directly on the book table, we have to look up the genre first and use that to find associated books.

```ruby
# books_controller.rb
...
def index
  if params[:genre_id]
    # we are in the nested route
    # retrieve books based on the genre
    genre = Genre.find_by(id: params[:genre_id])
    @books = genre.books
  else
    # we are in our 'regular' route
    @books = Book.all
  end
end
```

**Question:** What should our controller do if the user supplied a `genre_id` that doesn't match a genre?

## Additional Resources
- [Ruby on Rails: Nested Routes](http://guides.rubyonrails.org/routing.html#nested-resources)
