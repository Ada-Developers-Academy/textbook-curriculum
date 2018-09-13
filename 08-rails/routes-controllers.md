# Routes and Controllers
## Learning Goals
- Refresh on the http request cycle
- Discuss how a request makes it way through a Rails application
- Dissect the _routes file_ and learn how to define routes
- Explore the role of _controllers_ in a Rails application
- Create a basic controller using the Rails generate command

## TODO intro to route file

## Setting Up a Controller
Before we go further lets set up our own Controller class.  A Rails Controller is the central manager of a Rails application.  It takes requests from the web server, pulls information from data models and makes decisions.  It then hands information to the views for rendering the data back to the user.  Below we will setup a Controller to list a set of book titles.

Rails can go ahead and create a Controller and View for us with the following commands.

```bash
bin/rails generate controller Books index
```

This command has Rails generate a Controller and Views for the /books path, so when you bring up http://localhost:3000/books you will get the following HTML file.

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
Notice that the `BooksController` class inherits from the `ApplicationController` class in the Rails library.  For the `books/index` path we can handle it with the index method in the controller.  After the logic is finished in the controller method control is passed to a layout and view for rendering the content back to the user.

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
