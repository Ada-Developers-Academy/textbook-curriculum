# Controllers
## Learning Goals
- Refresh on the http request cycle
- Discuss how a request makes it way through a Rails application
- Explore the role of _controllers_ in a Rails application
- Create a basic controller using the Rails generate command
- Add an _action_ to a controller
- Define a basic _route_ for our new controller action

## Setting Up a Controller

A Rails Controller is the central manager of a Rails application. It takes requests from the web server, pulls information from data models and makes decisions. It then hands information to the views for rendering the data back to the user.

In Rails, we will build a separate class for each controller. The class is named after the type of resource it controls, and always ends with the word `Controller`. For example, in our books application, we might have a `BooksController` class and an `AuthorsController` class.

The things that a controller can do are called _actions_, and each action will be an instance method on a controller class. For example, our `BooksController` might have an `index` action that sends back a list of books to the browser, and a `show` action that sends back details on one book. Each of those would be an instance method in the `BooksController`.

Many of these actions are so common that we use the same names for them every time - `index` and `show` are examples of this.

We'll start with just one controller (the `BooksController`) and one action (`index`). Rails can create a Controller for us with the following command:

```bash
rails generate controller Books
```

Note that `Books` (the controller name) is capitalized and pluralized.

### The Controller Class

Rails places controller classes in the `app/controllers` folder.  In the case of the Controller we just generated it will be in the `books_controller.rb` class.

**Question:** Does this follow our standard Ruby naming convention for classes and files?

Opening the Controller file you will find the code below:

```ruby
# app/controllers/books_controller.rb
class BooksController < ApplicationController
end
```

Note that while we typed `rails generate controller Books`, Rails called the controller `BooksController`. This kind of shorthand is common in Rails - you'll quickly get used to it.

**Question:** What does `< ApplicationController` mean? How might this impact our class?

We've got a controller but no actions yet. To add the `index` action, create an empty method called `index` inside the controller class:

```ruby
# app/controllers/books_controller.rb
class BooksController < ApplicationController
  def index
  end
end
```

This method won't stay empty for long, but first we've got a little more work to do.

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
  # verb 'path', to: 'controller#action'
  get '/books', to: 'books#index'
end
```

What we've told the router to do is:
- When you receive a GET request...
- ...to the `/books` path...
- ...go to the `BooksController` class and run the `index` action

Routing is a very important topic in Rails, and we'll definitely be coming back to this file later in the week. For now though, this one route will serve our purposes.

## Fleshing Out the Controller

**Question:** According to our understanding of MVC, what should happen in a controller action?

Controller actions typically begin by gathering data from a model, and then use a view to turn that data into HTML. However, we haven't learned about either of those things yet!

To get us started, we will hard-code some data at the top of our file. This definitely not something you would normally do in Rails, but we want to take it piece-by-piece so bear with us.

In Rails, controllers communicate with views using instance variables. So, to make sure our soon-to-be-written view has access to our list of books, in our controller action we'll store a reference to the list in an instance variable.

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

## Summary

**Routes**

- The Rails Router is responsible for _dispatching_ (figuring out what to do with) a new HTTP request
  - It uses the _verb_ and the _path_ to select a controller action
- Routes are defined in `config/routes.rb`
  - `verb '/url/path', to: 'controller#action'`
  - `get '/books', to: 'books#index'`
  - The order of routes matters

**Controllers**

- A Rails Controller is responsible for handling a request and sending back a response
- Each controller is a class, and each action is a method
  - Controller class names are usually pluralized, and always end in `Controller`, like `BooksController`
  - The `controller#action` pair in `config/routes.rb` must match the name of your controller class and action method _exactly_
    - `books#show` would look for `BooksController` and `def show`
  - A controller `BooksController` will be defined in the file `app/controllers/books_controller.rb`
- To generate a controller run `$ rails generate controller Books`
- Controllers use _instance variables_ to communicate with views

## Additional Resources

- [TutorialsPoint on Controllers](https://www.tutorialspoint.com/ruby-on-rails/rails-controllers.htm) - quick summary with examples
- [Rails Guides on Controllers](http://guides.rubyonrails.org/action_controller_overview.html) - exhaustive, a little dry, but lots of good info
