# Controllers
## Learning Goals
- Refresh on the http request cycle
- Discuss how a request makes it way through a Rails application
- Dissect the _routes file_ and learn how to define routes
- Explore the role of _controllers_ in a Rails application
- Create a basic controller using the Rails generate command

## Setting Up a Controller

A Rails Controller is the central manager of a Rails application. It takes requests from the web server, pulls information from data models and makes decisions. It then hands information to the views for rendering the data back to the user.

In Rails, we will build a separate class for each controller. The class is named after the type of resource it controls, and always ends with the word `Controller`. For example, in our books application, we might have a `BooksController` class and an `AuthorsController` class.

The things that a controller can do are called _actions_, and each action will be an instance method on a controller class. For example, our `BooksController` might have an `index` action that sends back a list of books to the browser, and a `show` action that sends back details on one book. Each of those would be an instance method in the `BooksController`.

Many of these actions are so common that we use the same names for them every time - `index` and `show` are examples of this.

We'll start with just one controller (the `BooksController`) and one action (`index`). Rails can create a Controller and View for us with the following command:

```bash
rails generate controller Books index
```

Note that `Books` (the controller name) is capitalized and pluralize, and `index` (the action name) is lower-case. Note that this only works because `index` is a "standard" action - if you wanted to do something custom, you would have to do a bit of work yourself.

This command has Rails generate a Controller and View for the /books path, so when you bring up http://localhost:3000/books you will get the following HTML file.

![view in browser](images/index.html.erb.png)

### The Controller Class

Rails places controller classes in the `app/controllers` folder.  In the case of the Controller we just generated it will be in the `books_controller.rb` class.

Opening the Controller file you will find the code below:

```ruby
class BooksController < ApplicationController
  def index
  end
end
```

**Question:** What does `< ApplicationController` mean? How will this impact our class?

## Adding a Route

We've now created a controller (the `BooksController` class) and given it an action (the `index` method). However, Rails doesn't automatically know how to use this controller; we have to tell it.

To do so, we will introduce a new piece of Rails: the router. The router does its job with the help of a special configuration file that lives at

```
config/routes.rb
```

In this file we will tell Rails where to send incoming HTTP requests.

**Question:** What are the parts of an HTTP request?

The two pieces of an HTTP request that our router is interested in are the _verb_ and the _path_. Given those, we can tell it what _controller_ and _action_ to use. It acts kind of like a big `case` statement, though the syntax is a little different.

The routefile should have a block of code filled in already. Add a line inside that block so it looks like this:

```ruby
# config/routes.rb
Rails.application.routes.draw do
  # method path => action
  get '/books', to: 'books#index'
end
```

What we've told the router to do is:
- When you receive a GET request...
- ...to the `/books` path...
- ...go to the `BooksController` class and run the `index` action

That'll do for now. We'll talk more about how the router works later in the week.

## Fleshing Out the Controller

**Question:** According to our understanding of MVC, what should happen in a controller action?

In the following notes we will look at layouts and views and look at how to render our content in the browser.  For now lets modify the `index` method to add an instance variable for use in the view.

```ruby
  def index
    @books = [
      { title: "Hidden Figures", author: "Margot Lee Shetterly"},
      { title: "Practical Object-Oriented Design in Ruby", author: "Sandi Metz"},
      { title: "Kindred", author: "Octavia E. Butler"}
    ]
  end
```

## Summary

**Routes**

- The Rails Router is responsible for _dispatching_ (figuring out what to do with) a new HTTP request
  - It uses the _verb_ and the _path_ to select a controller action
- Routes are defined in `config/routes.rb`
  - `verb '/url/path', to: 'controller#action', as: 'route_name'`
  - `get '/books/:id', to: 'books#show', as: 'book'`
  - `:id` in a URL will match anything at all! This lets the browser specify which book they want
  - The order of routes matters

**Controllers**

- A Rails Controller is responsible for handling a request and sending back a response
- Each controller is a class, and each action is a method
  - Controller class names are usually pluralized, and always end in `Controller`, like `BooksController`
  - The `controller#action` pair in `config/routes.rb` must match the name of your controller class and action method _exactly_
    - `books#show` would look for `BooksController` and `def show`
  - A controller `BooksController` will be defined in the file `app/controllers/books_controller.rb`
- To generate a controller run `$ rails generate controller books`
- Controllers use _instance variables_ to communicate with views

## Additional Resources

- [TutorialsPoint on Controllers](https://www.tutorialspoint.com/ruby-on-rails/rails-controllers.htm) - quick summary with examples
- [Rails Guides on Controllers](http://guides.rubyonrails.org/action_controller_overview.html) - exhaustive, a little dry, but lots of good info
