# ERB & Layouts
## Learning Goals
- Discover how to add logic to our html pages with _embedded Ruby_
- DRY up our html pages by separating them into _views_ and _layouts_
- Learn the special syntax for working with _erb_

## What is _ERB_
ERB (Embedded RuBy) is kind of file known as a _preprocessor_. When Rails sees a file that has the extension of _.erb_, it will _evaluate_ it for Ruby expressions _before_ doing anything else with it (like sending it to the browser). We call it a _preprocessor_ because it is triggered before anything else happens with the file. It is very common to have files in Rails projects with names like `index.erb`. This tells us (and the webserver) that the file is intended to be _preprocessed_ with _erb_, and the result of the processing is what should be sent to the browser. This kind of file is known, generically, as a _view template_.

Preprocessing allows us to specify the file contents in any format we want (HTML, CSS, Markdown, etc.) while still _embedding_ Ruby code inside of it, allowing for customization of the content when the _view_ is _rendered_ (preprocessed and sent to the client as HTML).

### Making Customizable Views with ERB
In order to customize an ERB _view_ we make use of special tags, which look similar to HTML tags. All of the tags are "self-closing", meaning there is no corresponding ending tag.

#### ERB Tags:
- `<%    %>`: Code Tag: When this tag is found in an ERB _view_, the Ruby code inside of the tag is run.
- `<%=   %>`: Value Tag: When this tag is found in an ERB _view_, the Ruby code inside of the tag is run and the resulting value is converted to a string (by automatically calling `to_s`). This string is then inserted into the final HTML.
- `<%#   %>`: Comment Tag: This is considered the same as a comment in Ruby and is completely ignored. Nothing will be put into the final content where this tag is located.

The Code Tag is primarily used for Ruby code that involves a block, such as an `if` statement or an `each` loop. The Value Tag is used with any Ruby code that generates a value.

#### Examples of ERB tags
```erb
# We can use value tags to write Ruby code that transforms the text in an HTML document:
<p>Hello there! <%= "I am shouting this sentence".upcase %>!</p>

# We can also use value tags to insert values from variables in Ruby:
<h3>Welcome to your account page, <%= @name %>.</h3>
```

Code tags can be used to decide whether or not to include certain portions of content in the final document:

```erb
<nav>
  <% if @user.logged_in? %>
    <a href="/user/logout">Log out of your account</a>
  <% else %>
    <a href="/user/login">Log in or sign up</a>
  <% end %>
</nav>
```

Both code tags and value tags can be combined to create loops with Ruby code that generate multiple copies of content in your documents:

```erb
<ul class="product-list">
  <% @products.each do |product| %>
    <li><%= product.name %></li>
  <% end %>
</ul>
```

## Using ERB Tags with Rails
To get the most benefit from the special tags that _ERB_ provides us, we will need a way to provide _ERB_ with variables that can be used inside of those tags. To do this, create instance variables within your Rails _controller_, and then reference those instance variables inside of your _views_.

```ruby
# in our Rails controller
def index
  @all_products = Product.all #returns an array of Product instances
  render :index # this tells Rails to render app/views/products/index.html.erb
end
```
... and inside of `app/views/products/index.html.erb` ...
```erb
<html>
  <head></head>
  <body>
    <h1>Our Products</h1>
    <% @all_products.each do |product| %>
      <div id="<%= product.id %>" class="product">
        <h3><%= product.name %></h3>
        <p><%= product.description %></p>
        <a href="/product/<%= product.id %>/purchase">Buy Now</a>
      </div>
    <% end %>
  </body>
</html>
```

By using our Rails controller to create variables with the data that we want to display, we can customize our views in an infinite number of ways and create enormously powerful websites with very little code.

## Layouts
One of the most helpful features of ERB tags is that they allow us to "compose" multiple ERB templates together. This means we are placing the content of a single ERB template at a specific point within a different ERB template. When we have multiple HTML pages that use much of the same content on every page, we can extract the repeated content into a reusable template. This extracted template is known as a _layout_.

For example, if we had two HTML pages like this:
```erb
<!-- app/views/website/index.html.erb -->
<html>
  <head>
    <title>My Website</title>
  </head>
  <body>
    <h1>Welcome to My Website!</h1>
    <p>This is a website that I created. Isn't is awesome?</p>
    <p>Check out my about page <a href="/about_me">here</a>.</p>
  </body>
</html>
```
... and ...
```erb
<!-- app/views/website/about-me.html.erb -->
<html>
  <head>
    <title>My Website</title>
  </head>
  <body>
    <h1>About Me</h1>
    <p>I am the person that created this website, that's all you need to know.</p>
  </body>
</html>
```

We could remove the redundant parts by utilizing a _layout_ template:
```erb
<!-- views/layouts/application.html.erb -->
<!DOCTYPE html>
<html>
  <head>
    <title>My Website</title>

    <!-- Below are things that Rails includes by default -->
    <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true %>
    <%= javascript_include_tag 'application', 'data-turbolinks-track' => true %>
    <%= csrf_meta_tags %>
  </head>
  <body>
    <%= yield %> <!-- This is the key to utilizing the layout -->
  </body>
</html>
```

The `yield` command inside of the_ value tag_ in this _layout_ tells ERB that it should replace that tag with the content of another ERB template. With the common code extracted to the _layout_, the other _views_ are now much smaller:

```erb
<!-- app/views/website/index.html.erb -->
<h1>Welcome to My Website!</h1>
<p>This is a website that I created. Isn't is awesome?</p>
<p>Check out my about page <a href="/about_me">here</a>.</p>
```
... and ...
```erb
<!-- app/views/website/about-me.html.erb -->
<h1>About Me</h1>
<p>I am the person that created this website, that's all you need to know.</p>
```

## Using ERB Layouts with Rails
As mentioned above, the `yield` command is where the _view_ is placed inside the _layout_ template.

With Rails we specify the partial template when we use the `render` command in our controllers. Rails automatically looks for a layout template in its default location, relative to the controller you are requesting: `app/views/website/` folder is you are in the `website_controller.rb` file. If that file exists, Rails will render that template and then place the content of the partial specified to `.html.erb` in the place where the `yield` command exists in the layout.

Example:
```ruby
# app/controllers/website_controller.rb
def about_me
  render :about_me
end
```

This will render the `views/layouts/application.html.erb` file, and then place the contents of `app/views/website/about_me.html.erb` in place of the `<%= yield %>` value tag.
