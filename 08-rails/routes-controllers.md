# Routes and Controllers
## Learning Goals
- Refresh on the http request cycle
- Discuss how a request makes it way through a Rails application
- Dissect the _routes file_ and learn how to define routes
- Explore the role of _controllers_ in a Rails application
- Create a basic controller using the Rails generate command

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




## Anatomy of `routes.rb`
The combination of _request method_ and _path_ comprise the first half of a Rails _route_. The second half is the route _action_, the Ruby class and method that will handle the incoming request.

_Routes_ are analogous to an old-timey telephone switch board. When Rails receives a new HTTP request, the _routes_ connect the request data to the correct _controller action_.

We define routes in our `config/routes.rb` file, which is generated when we run the `rails new` command.

```ruby
Rails.application.routes.draw do
  # method path => action
  get "/books", to: "books#index"
end
```

Let's break down this code:

- `Rails.application.routes.draw do`: This method's responsibility is knowing about all the _routes_ to which the application can respond.
- The **route definition**:
  - **request method**: `get` in this example
  - **path**: what will be matched with the URL in the HTTP request, `"/books"` in this example
  - **controller and action**: defining the controller and action, split by the `#`. `"books#index"` in this case this would point to the `index` method in the `BooksController` class.

![Rails Request Cycle](images/rails-request-cycle.jpg)

## Setting Up a Controller
Before we go further lets set up our own Controller class.  A Rails Controller is the central manager of a Rails application.  It takes requests from the web server, pulls information from data models and makes decisions.  It then hands information to the views for rendering the data back to the user.  Below we will setup a Controller to list a set of book titles.

Rails can go ahead and create a Controller and View for us with the following commands.

```bash
bin/rails generate controller Books index
```

This command has Rails generate a Controller and Views for the /books path, so when you bring up http://localhost:3000/books you will get the following HTML file.  

![view in browser](images/index.html.erb.png)

When generating a Controller/View you can specify as many methods or actions as you wish for example:
```bash
$ bin/rails generate controller Books index new update delete show
```

### The Controller Class

Rails places controller classes in the `app/controllers` folder.  In the case of the Controller we just generated it will be in the `books_controller.rb` class.

Opening the Controller file you will find the code below:

```ruby
class BooksController < ApplicationController
  def index
  end
end
```
Notice that the `BooksController` class inherits from the `ApplicationController` class in the Rails library.  For the `books/index` path we can handle it with the index method in the controller.  After the logic is finished in the controller method control is passed to a layout and view for rendering the content back to the user.  

In the following notes we will look at layouts and views and look at how to render our content in the browser.  For now lets modify the `index` method to add an instance variable for use in the view.

```ruby
  def index
    @books = [{ title: "Hidden Figures", author: "Margot Lee Shetterly"},
              { title: "Practical Object-Oriented Design in Ruby", author: "Sandi Metz"},
              { title: "Kindred", author: "Octavia E. Butler"}]
  end
```
