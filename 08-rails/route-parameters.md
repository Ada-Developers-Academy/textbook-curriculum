# Route Parameters

## Learning Goals

By the end of this lesson, students should be able to...
- Describe the role of a _route parameter_ in a web application
- Define a route with a parameter
- Use a route parameter in a controller action

## Introduction

We've already built a route, controller action and view for our `/books` resource, which generates HTML for a list of books. Our next step is to build a page to show details on an individual book.

**Question:** What should the URL for this page be?

The pattern followed in most web applications is to use the URL `/books/number`, where `number` is the ID of the book we're interested in. However, using what we know so far, to do that we would need to define a separate route for each book. This is where route parameters come in.

A route parameter is similar to a method parameter, in that part of the path of your URL is comes from outside. In this case, it will be whatever ID the user types into their address bar. Inside our controller action we'll be able to use that ID to find the book we need.

### Creating a Parameterized Route

**Question:** In which file do we define routes?

A parameterized route will look like this:

```ruby
get '/books/:id', to: 'books#show'
```

Note the `:id` in the path - this is the parameter. Remember that we've called it `:id` - we'll be using this name later.

Now any request that Rails gets with a path matching the pattern `/books/something` will be sent to the `show` action on the `BooksController`.

### Using a Route Parameter

The next step is to build the `show` action.

**Question:** How do you add a controller action?

Open up the `BooksController` - you should start with code like this:

```ruby
# app/controllers/books_controller.rb
BOOKS = [
  { title: "Hidden Figures", author: "Margot Lee Shetterly"},
  { title: "Practical Object-Oriented Design in Ruby", author: "Sandi Metz"},
  { title: "Kindred", author: "Octavia E. Butler"}
]

class BooksController < ApplicationController
  def index
    @books = BOOKS
  end
end
```

We'll need to add a new method, `show`. Inside that method we'll be able to access our route parameter via a special hash provided by Rails called `params`. The ID sent by the browser will be stored under the key `:id` (remember that this is the name we gave the parameter in the routefile).

```ruby
# app/controllers/books_controller.rb
def show
  book_id = params[:id]
  @book = BOOKS[book_id]
end
```

Here we read the book ID from the params and store it in a variable `book_id`, then use that as an index into our list of books. As before, we'll use an instance variable to communicate with the view, though this time we've only got one `@book`, not multiple `@books`.

### Exercise

Build a `show` view that shows details for this book.

## Summary

- Route parameters are a way to have a variable in a URL
- Define route parameters in the routefile with a symbol
  - `get '/books/:id', to: 'books#show'`
- Use route parameters through the special `params` hash
  - `book_id = params[:id]`
- The key in `params` **must match** the name of the parameter in the route

## Additional Resources

- [Rails guide on routing](https://guides.rubyonrails.org/routing.html)
- [Rails guide on params](https://guides.rubyonrails.org/action_controller_overview.html#parameters)
