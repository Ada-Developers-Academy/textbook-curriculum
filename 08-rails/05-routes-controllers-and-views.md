# Routes, Controllers, & Views (oh my)
## Learning Goals
- Refresh on the http request cycle
- Discuss how a request makes it way through a Rails application
- Dissect the _routes file_ and learn how to define routes
- Explore the role of _controllers_ in a Rails application

## HTTP Request
HTTP is the language of the internet. Browsers send HTTP requests to our servers. Here's a simplified HTTP request:

    GET /users HTTP/1.1
    Host: adadevelopersacademy.org
    User-Agent: Web-sniffer/1.0.46 (+http://web-sniffer.net/)
    Referer: http://web-sniffer.net/

The two most important parts of this request are:

- `GET`, which is the _request method_. As we have seen, the most common request methods are `get`, `post`, `put`, `patch`, and `delete`.
- `/users`, which is the _path_.


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
