# Nested Routes

## Learning Goals

- Use **nested routes** to make our webapp reflect the structure of our data
- Modify our controllers to take advantage of nested routes
- Build UI elements that interact with nested routes

## Introduction

Currently our library webapp does not reflect the new relation between `Author` and `Book` very well. Selecting from a drop-down menu when you create or edit a book is fine, but we could imagine a much more fluid user experience.

Here are some user stories to consider:
- As a librarian, I want to view the list of books for a specific author
- As a librarian, when viewing the details page for an author a user should see a link to add a book for that author

Both these user stories break up the collection of books. They require us to consider the books written by _Octavia Butler_ separately from those written by _Ursula K. Le Guin_.

One way to address this problem is by using **nested routes**.

## Nested Routes
Oftentimes we create nested routes when we have resources which are _children_ of other resources. In this case, we will have a _genre_ resource which will contain books. Ideally, we can configure routes to be _nested_ within one another to provide additional context about the request we are making. For example, if we want to retrieve the list of books associated with the genre "nonfiction" (where genre "nonfiction" has an ID of 1 in our database), then we would want a route like `/genres/1/books`. This example demonstrates **nested routes**. We utilize RESTful routes for `books` inside the `genres` RESTful routes.

**Question**: Do we want _all_ `books` routes to be nested inside `genres`? If not, which would we want to be nested and which wouldn't?

Let's take a look at our standard RESTful routes:
```ruby
resources :genres
resources :books
```

Now, let's take a look at how to configure the nested routes we decided on above:
```ruby
resources :genres do
  get '/books', to: 'books#index'
  # resources :books, only: [:index]
  # two ways to get the same nested route
end

resources :books
```

What did we gain here? We've created an additional books index route which will also contain an additional `param` value `:genre_id`. Since we are using a nested route, Rails uses a more specific parameter name rather than `:id` which we are used to.



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
