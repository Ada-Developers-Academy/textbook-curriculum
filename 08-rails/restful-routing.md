# Restful Routing

## Learning Goals
By the end of this lesson, students should be able to...

- Define the acronym REST
- List the 7 RESTful routes
  - HTTP verb, path, controller action
- Define RESTful routes for a Rails application

## HTTP Request
HTTP is the language of the internet. Browsers send HTTP requests to our servers. Here's a simplified HTTP request:

    GET /books HTTP/1.1
    Host: adadevelopersacademy.org
    User-Agent: Web-sniffer/1.0.46 (+http://web-sniffer.net/)
    Referer: http://web-sniffer.net/

The two most important parts of this request are:

- `GET`, which is the _request method_. As we have seen, the most common request methods are `get`, `post`, `put`, `patch`, and `delete`.
- `/books`, which is the _path_.

In a Rails app when a request comes in for a specific _path_ the Rails router	matches it with a controller and passes the request to the appropriate method in that controller.

## What is REST?

REST (Representational State Transfer) is a pattern to help us provide a consistent method of accessing and managing our resources on the web. Many different languages and frameworks implement some sort of RESTful routing.

At its simplest, REST is a process in which a web server uses the combination of the requested __URL__ and __HTTP VERB__ to decide how to respond. The goal is a normalized, predictable structure for handling web requests. Rails formalizes this approach with a special file just for routes.

### Characteristics of a RESTful Architecture
Aside from a specific pattern for laying out a web server's routes, REST also implies a certain philosophy of web development:

- Uses client-server model for separation of concerns
- Stateless: server does not track client state
- Has a uniform interface
- Resource identification with each request
- Returned resources are data
- Allows for caching

### Pseudo-code Example of RESTful Routes
__Assumption__: We've got a resource called `book` that can be recalled/manipulated by a unique identifier called `id`. In Rails, we'd represent getting a single instance of this resource with something like `get "/books/:id", to: "books#show"`.

We can extrapolate the entire RESTful suite of actions from this basic pattern. It'd look something like...

Verb   | URI Pattern       | Controller#Action | Description
---    | ---               | ---               | ---
GET    | `/books`          | `books#index`     | List of all books
GET    | `/books/new`      | `books#new`       | Form to add a new book
POST   | `/books`          | `books#create`    | Send form data to the server and save a new book
GET    | `/books/:id`      | `books#show`      | Show details for one book
GET    | `/books/:id/edit` | `books#edit`      | Form to edit details for an existing book
PATCH  | `/books/:id`      | `books#update`    | Send form data to the server to update an existing book
DELETE | `/books/:id`      | `books#destroy`   | Destroy an existing book

The combination of __VERB__ and __URL__ tell our web server (Rails, in this example) everything it needs to know to formulate an action and response. The methods we're calling on the `books` object follows a convention common to the Ruby community.

## Anatomy of `routes.rb`

The combination of _request method_ and _path_ comprise the first half of a Rails _route_. The second half is the route _action_, the Ruby class and method that will handle the incoming request.

_Routes_ are analogous to an old-timey telephone switch board. When Rails receives a new HTTP request, the _routes_ connect the request data to the correct _controller action_.

We define routes in our `config/routes.rb` file, which is generated when we run the `rails new` command.

```ruby
Rails.application.routes.draw do
  # verb 'path', to: 'controller#action'
  get '/books', to: 'books#index'
end
```

Let's break down this code:

- `Rails.application.routes.draw do`: This method's responsibility is knowing about all the _routes_ to which the application can respond.
- The **route definition**:
  - **request method**: `get` in this example
  - **path**: what will be matched with the URL in the HTTP request, `'/books'` in this example
  - **controller and action**: defining the controller and action, split by the `#`. `'books#index'` in this case this would point to the `index` method in the `BooksController` class.
- We use single quotes `'` because the controller/action are separated by an octothorp `#`. If we used double quotes Atom would try to auto-complete curly braces after each one, and it would get really annoying!

### The Seven RESTful Routes

A `routes.rb` file which lists all the RESTful routes would look like this:

```ruby
# config/routes.rb
Rails.application.routes.draw do

  # Routes that operate on the book collection
  get '/books', to: 'books#index', as: 'books'
  get '/books/new', to: 'books#new', as: 'new_book'
  post '/books', to: 'books#create'

  # Routes that operate on individual books
  get '/books/:id', to: 'books#show', as: 'book'
  get '/books/:id/edit', to: 'books#edit', as: 'edit_book'
  patch '/books/:id', to: 'books#update'
  delete '/books/:id', to: 'books#destroy'
end
```

You may be saying, "Wait what's that `as: <STUFF>` part?"  This allows us to name a path.  It's very helpful to give each path for a resource, like books, a name.  The name can then be used later in your code to link actions together without having to give a hardcoded path like `'/books/new'` each time.  That way if we change a path, we only have to edit the `routes.rb` file instead of each line in our code where we use the route.  So `edit_book` is the name of the `/books/:id/edit` path.

You will see how these named paths are used when we delve into view helpers.

You can always view the routes in your application by typing `rails routes` in the terminal.  Given the `routes.rb` file above, typing `rails routes` will result in the following:

```bash
$ rails routes
        Prefix Verb   URI Pattern               Controller#Action
         books GET    /books(.:format)          books#index
      new_book GET    /books/new(.:format)      books#new
               POST   /books(.:format)          books#create
          book GET    /books/:id(.:format)      books#show
     edit_book GET    /books/:id/edit(.:format) books#edit
               PATCH  /books/:id(.:format)      books#update
   delete_book DELETE /books/:id(.:format)      books#destroy
```

Notice that the name of each route is listed in the `Prefix` column.  Using the `rails routes` command allows you to quickly verify your routes and check the `routes.rb` file for errors.


### Custom Path Names

We can use anything for a path name.  We could for example use:  `get '/books/:id', to: 'books#show', as: 'banana'`, if we wanted to have a path named `banana`.  That would not be a good name for a path, but it would function.  Rails convention suggests we name such a path `book`, but nothing stops us from using another name.

So for example for:

-  route:  `get '/books/:id', to: 'books#show', as: 'banana'`
	-  Prefix: `banana`
	-  Path Helper: `banana_path`.

Additionally any route beyond the standard set of CRUD routes should be named descriptively.

For example a path to mark a book as read could be:

```ruby
patch '/user/:user_id/books/:id', to: 'books#mark_read', as: 'mark_read'
```

Below is a table with example routes, prefixes and paths.

Route | Prefix | Path Helper | Example
---   | ---    | ---         | ---
`get '/books', to: 'books#index'`	|   `books`	|   `books_path`	| `<%= link_to "All Books", books_path %>`
`get '/books/new', to: 'books#new', as: 'new_book'`	|   `new_book`	|   `new_book_path`	|	`<%= link_to "New book", new_book_path %>`
`post '/books', to: 'books#create'`, as: 'books'	|   `books`	|   `books_path`	| `<%= form_with model: @book, url: books_path, method: :post %>`
`get '/books/:id', to: 'books#show', as: 'book'` | 	`book`  |	`book_path`  |	`<%= link_to "View #{book.title}", book_path(book.id) %>`
`get '/books/:id/edit', to: 'books#edit', as: 'edit_book'`	|   `edit_book`	|   `edit_book_path`	|  `<%= button_to "Edit #{book.title}", edit_book_path(book.id) %>`
`patch '/books/:id', to: 'books#update'` | 	`book`  |	`book_path`  |	`<%= form_with model: @book, url: book_path(@book.id), method: :patch %>`
`delete '/books/:id', to: 'books#destroy'` | 	`book`  |	`book_path`  |	`<%= link_to "Delete", book_path(book.id) %>`


Notice that the `update`, `show` & `destroy` actions both use the `book_path`.  The path helpers are identical because the routes all include `/books/:id`.

### Order Matters

It's also important to note that the Router selects the first route that matches the request.  So if you swapped `get '/books/new', to: 'books#new', as: 'new_book'` with `get '/books/:id', to: 'books#show', as: 'book'` then when a GET request came in for `/books/new` the router would match it to the `books#show` action because the `:id` placeholder can match any value, not just an ID number.

Because of this it's important to list your routes from most specific to least specific.

## Summary

- The _router_'s job is to decide what controller action should handle an incoming request
  - It looks at both the _HTTP verb_ and the _path_ of the request to decide
- REST is both a philosophy of web development, and a specific set of patterns to follow
  - There are seven RESTful routes, each of which enables a different part of CRUD
- Configuration for the router lives at `config/routes.rb`
  - Each route takes the form `verb '/path', to: 'controller#action'`
  - The _path_ part of a route can be named, using `as: 'prefix'`
    - This allows the path to be used in other parts of the application via the method `prefix_path`
  - The order of routes in the routefile matters

## Additional Resources

- [Rails guide on routing](https://guides.rubyonrails.org/routing.html)
- [Dr. Dobbs article by M. Vaqqas describing RESTful Web Services](http://www.drdobbs.com/web-development/restful-web-services-a-tutorial/240169069)
- [Fielding's original PhD dissertation - very dry, very long, but perhaps worth skimming, esp Chapter 5](http://www.ics.uci.edu/~fielding/pubs/dissertation/top.htm)
- [Real-world example: Twitter REST APIs](https://dev.twitter.com/rest/public)
