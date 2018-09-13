# Nested Routes

## Learning Goals

- Use **nested routes** to make our webapp reflect the structure of our data
- Modify our controllers to take advantage of nested routes

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
[... author routes ...]
          books GET    /books(.:format)                        books#index
                POST   /books(.:format)                        books#create
       new_book GET    /books/new(.:format)                    books#new
[... other book routes ...]
```

We can make a few observations about these new routes:
- The URI pattern matches what we had in the table above
    - The parameter is called `:author_id`, not `:id`
- Since these routes have prefixes, we can use path helpers (`author_books_path`, `new_author_book_path`)
- The original routes (`/books` and `/books/new`) are still there
- These routes point to the same controller actions we were using before. This will help keep things DRY.

**Question:** So far we have only nested the `index` and `new` actions. Should we nest the other 5 RESTful routes? Why or why not?

## Controllers and Views

### Index

Because our routes are more complex, we now need to make our controllers and views a little more intelligent. A request for the book list may now come in with or without an author ID; we need to handle both cases.

```ruby
# app/controllers/books_controller.rb
class BooksController < ApplicationController
  # ...
  def index
    if params[:author_id]
      # This is the nested route, /author/:author_id/books
      author = Author.find_by(id: params[:author_id])
      @books = author.books

    else
      # This is the 'regular' route, /books
      @books = Book.all
    end
  end
  # ...
end
```

**Question:** Do we need to make any changes to the `books#index` view template? Why or why not?

**Question:** What should our code do if the author is not found, that is, if the user goes to `/authors/789012/books` or `/authors/toaster/books`?

### New

The `new` action will be very similar. In the past we've seen that the `form_with` view helper will automatically insert any attributes on the model into the form. We will take advantage of this functionality by filling in the `author` on the new model.

```ruby
# app/controllers/books_controller.rb
class BooksController < ApplicationController
  # ...
  def new
    if params[:author_id]
      # This is the nested route, /author/:author_id/books/new
      author = Author.find_by(id: params[:author_id])
      @books = author.books.new

    else
      # This is the 'regular' route, /books/new
      @books = Book.new
    end
  end
  # ...
end
```

Now if we go to `/authors/2/books/new`, we should see that the dropdown menu starts with the second author selected.

**Question:** Can we omit the dropdown entirely when the author is already filled in? How will this affect editing a book?

## Over-nesting

A common mistake is to use nested routes when they aren't required. For an example of why this is problematic, consider a nested version of the route to show a book, `/authors/:author_id/books/:id`.

What should our `BooksController` do with the `author_id` parameter? Looking up a book requires the book ID, so we don't need it for that. Moreover, what if the `author_id` we loaded from the database doesn't match what was typed in the URL? Is this an error? The same questions come up with the `edit`, `update` and `destroy` paths.

The central issue here is that the `author_id` parameter is _redundant_. We could already figure out the author given the book. Asking the user to send it to us again only creates an opportunity for confusion.

**In general, if your route specifies a resource by ID (e.g. `/books/:id`), it probably should not be nested.**

### Create

The decision on whether to nest the `create` route is a little more nuanced.

In our library example we have the author ID in the form data, so including the author ID in the `create` URL would introduce redundancy. This is similar to what we say above for the individual routes. What if we get a `POST /authors/7/books`, but the form data indicates the `author_id` should be 13? Is this an error? If not, which one should we trust?

However, sometimes you need to do a `POST` without using a form, or the form doesn't have the information you need. In this case, nesting the `create` route might be the right way to go.

## Summary

- Nested routes are a tool to reflect model relations in the user's experience
- Nested routes are created by adding a block to the call to `resources` of the parent route
- Our controller actions need to be aware of nested routes, but we can usually re-use view code
- Be careful not to over-nest routes
    - Only `index`, `new` and sometimes `create` should be nested

## Additional Resources
- [Ruby on Rails: Nested Routes](http://guides.rubyonrails.org/routing.html#nested-resources)
