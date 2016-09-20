# Routes, Controllers, & Views (oh my)
## Learning Goals
- Refresh on the http request cycle
- Discuss how a request makes it way through a Rails application
- Dissect the _routes file_ and learn how to define routes
- Explore the role of _controllers_ in a Rails application
- Create a basic controller using the Rails generate command.  

## HTTP Request
HTTP is the language of the internet. Browsers send HTTP requests to our servers. Here's a simplified HTTP request:

    GET /users HTTP/1.1
    Host: adadevelopersacademy.org
    User-Agent: Web-sniffer/1.0.46 (+http://web-sniffer.net/)
    Referer: http://web-sniffer.net/

The two most important parts of this request are:

- `GET`, which is the _request method_. As we have seen, the most common request methods are `get`, `post`, `put`, `patch`, and `delete`.
- `/users`, which is the _path_.

In a Rails app when a request comes in for a specific _path_ the Rails router	matches it with a controller and passes the request to the appropriate method in that controller.   




## Anatomy of `routes.rb`
The combination of _request method_ and _path_ comprise the first half of a Rails _route_. The second half is the route _action_, the Ruby class and method that will handle the incoming request.

_Routes_ are analogous to an old-timey telephone switch board. When Rails receives a new HTTP request, the _routes_ connect the request data to the correct _controller action_.

We define routes in our `config/routes.rb` file, which is generated when we run the `rails new` command.

```ruby
Rails.application.routes.draw do
  # method path => action
  get "/users", to: "users#index"
end
```

Let's break down this code:

- `Rails.application.routes.draw do`: This method's responsibility is knowing about all the _routes_ to which the application can respond.
- The **route definition**:
  - **request method**: `get` in this example
  - **path**: what will be matched with the URL in the HTTP request, `"/users"` in this example
  - **controller and action**: defining the controller and action, split by the `#`. `"users#index"` in this case this would point to the `index` method in the `UsersController` class.

![Rails Request Cycle](images/rails-request-cycle.jpg)

## Setting Up a Controller
Before we go further lets set up our own Controller class.  A Rails Controller is the central manager of a Rails application.  It takes requests from the web server, pulls information from data models and makes decisions.  It then hands information to the views for rendering the data back to the user.  Below we will setup a Controller to list a set of book titles.

Rails can go ahead and create a Controller for us with the following commands.

```bash
bin/rails generate controller Books index
```

This command has Rails generate a Controller and Views for the /books path, so when you bring up http://localhost:3000/index you will get the following HTML file.  

```html
<!DOCTYPE html>
<html>
<head>
  <title>RailsLearning</title>
  <link rel="stylesheet" media="all" href="/assets/books.self-e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855.css?body=1" data-turbolinks-track="true" />
<link rel="stylesheet" media="all" href="/assets/application.self-e80e8f2318043e8af94dddc2adad5a4f09739a8ebb323b3ab31cd71d45fd9113.css?body=1" data-turbolinks-track="true" />
  <script src="/assets/jquery.self-bd7ddd393353a8d2480a622e80342adf488fb6006d667e8b42e4c0073393abee.js?body=1" data-turbolinks-track="true"></script>
<script src="/assets/jquery_ujs.self-784a997f6726036b1993eb2217c9cb558e1cbb801c6da88105588c56f13b466a.js?body=1" data-turbolinks-track="true"></script>
<script src="/assets/turbolinks.self-c5acd7a204f5f25ce7a1d8a0e4d92e28d34c9e2df2c7371cd7af88e147e4ad82.js?body=1" data-turbolinks-track="true"></script>
<script src="/assets/books.self-877aef30ae1b040ab8a3aba4e3e309a11d7f2612f44dde450b5c157aa5f95c05.js?body=1" data-turbolinks-track="true"></script>
<script src="/assets/application.self-3b8dabdc891efe46b9a144b400ad69e37d7e5876bdc39dee783419a69d7ca819.js?body=1" data-turbolinks-track="true"></script>
  <meta name="csrf-param" content="authenticity_token" />
<meta name="csrf-token" content="VIS6RH1BMIj/At3tJda9hVCaTa3FkyMW5Yo0yZubMG+ByVfgA5+f+5ZN94KFycAYd/1aDCN0fhi0has3cUokfw==" />
</head>
<body>

<h1>Books#index</h1>
<p>Find me in app/views/books/index.html.erb</p>

</body>
</html>
```

### The Controller Class

Ruby places controller classes in the `app/controllers` folder.  In the case of the Controller we just generated it will be in the `books_controller.rb` class.

Opening the Controller file you will find the code below:

```ruby
class BooksController < ApplicationController
  def index
  end
end
```
Notice that the BooksController class inherits from the ApplicationController class in the Rails library.  For the `books/index` path we can handle it with the index method in the controller.  After the logic is finished in the controller method control is passed to a layout and view for rendering the content back to the user.  

In the following notes we will look at layouts and views and look at how to render our content in the browser.  For now lets modify the `index` method to add an instance variable for use in the view.

```ruby
  def index
    @books = ["Once and Future King", "Fellowship of the ring",
              "Ruby: How to Program", "Web Design with HTML, CSS, JavaScript"]    
  end
```



