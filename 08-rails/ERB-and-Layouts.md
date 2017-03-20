# Views: ERB & Layouts
## Learning Goals
- Discover how to add logic to our html pages with _embedded Ruby_
- DRY up our html pages by separating them into _views_ and _layouts_
- Learn the special syntax for working with _erb_

## What is _ERB_
ERB (Embedded RuBy) is kind of file known as a _preprocessor_. When Rails sees a file that has the extension of _.erb_, it will _evaluate_ it for Ruby expressions _before_ doing anything else with it (like sending it to the browser). We call it a _preprocessor_ because it is triggered before anything else happens with the file. It is very common to have files in Rails projects with names like `index.html.erb`. This tells us (and the webserver) that the file is intended to be _preprocessed_ with _erb_, and the result of the processing is an HTML file that should be sent to the browser. This kind of file is known, generically, as a _view template_.

Preprocessing allows us to specify the file contents in any format we want (HTML, CSS, Markdown, etc.) while still _embedding_ Ruby code inside of it, allowing for customization of the content when the _view_ is _rendered_ (preprocessed and sent to the client as HTML).

### Making Customizable Views with ERB
In order to customize an ERB _view_ we make use of special tags, which look similar to HTML tags. All of the tags are "self-closing", meaning there is no corresponding ending tag.

#### ERB Tags:
- `<%    %>`: Code Tag: When this tag is found in an ERB _view_, the Ruby code inside of the tag is run.
- `<%=   %>`: Value Tag: When this tag is found in an ERB _view_, the Ruby code inside of the tag is run and the resulting value is converted to a string (by automatically calling `to_s`). This string is then inserted into the final HTML.
- `<%#   %>`: Comment Tag: This is considered the same as a comment in Ruby and is completely ignored. Nothing will be put into the final content where this tag is located.

The Code Tag is primarily used for Ruby code that involves a block, such as an `if` statement or an `each` loop. The Value Tag is used with any Ruby code that generates a value.

#### Examples of ERB tags
```ruby
# We can use value tags to write Ruby code that transforms the text in an HTML document:
<p>Hello there! <%= "I am shouting this sentence".upcase %>!</p>

# We can also use value tags to insert values from variables in Ruby:
<h3>Welcome to your account page, <%= @name %>.</h3>
```

Code tags can be used to decide whether or not to include certain portions of content in the final document:

```ruby
<nav>
  <% if @book[:author].nil? %>
    No Data
  <% else %>
    <%= @book[:author] %>
  <% end %>
</nav>
```

Both code tags and value tags can be combined to create loops with Ruby code that generate multiple copies of content in your documents:

```ruby
<ul class="book-list">
  <% @books.each do |book| %>
    <li><%= book[:title] %></li>
  <% end %>
</ul>
```

## Using ERB Tags with Rails

To get the most benefit from the special tags that _ERB_ provides us, we will need a way to provide _ERB_ with variables that can be used inside of those tags.  To do this we can create variables in our controller.

```ruby
# in our controller app/controllers/books_controller.rb
def index
  @books = [{ title: "Hidden Figures", author: "Margot Lee Shetterly"},
            { title: "Practical Object-Oriented Design in Ruby", author: "Sandi Metz"},
            { title: "Kindred", author: "Octavia E. Butler"}]
end
```
... and inside of `app/views/books` ... there is a view file named after the index action. `index.html.erb`.  This is an example of how Ruby favors **convention over configuration**.  The default view for an action/method is named after it and stored in a folder named after the class.  

```html
<h1>Books#index</h1>
<p>Find me in app/views/books/index.html.erb</p>
```

We can modify the view to display data from the `@books` instance variable like this:
```erb
<h1>Books</h1>
<ul>
  <% @books.each do |book|  %>
    <li>
      <%= book[:title] %> By: <%= book[:author] %>
    </li>
  <% end %>
</ul>
```

Resulting HTML:
```html
<h1>Books</h1>
<ul>
  <li>
    Hidden Figures By: Margot Lee Shetterly
  </li>
  <li>
    Practical Object-Oriented Design in Ruby By: Sandi Metz
  </li>
  <li>
    Kindred By: Octavia E. Butler
  </li>
</ul>
```

By using our Rails controller method to create variables with the data that we want to display, we can customize our views in an infinite number of ways and create enormously powerful websites with very little code.  

## Layouts

Did you notice that the view doesn't have a full HTML file that starts with the `html` tag?  Weird huh?  That's because Rails uses a concept of common layouts to DRY out their code.  In a website many of your pages will follow a common layout, and have the content area rendered differently by a view specific to that particular route.  

One of the most helpful features of ERB tags is that they allow us to "compose" multiple ERB templates together. This means we are placing the content of a single ERB template, called a view, at a specific point within a different ERB template, in this case a layout. When we have multiple HTML pages that use much of the same content on every page, we can extract the repeated content into a reusable template. This extracted template is known as a _layout_.

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

With Rails the partial template, known as a _view_ is stored in a folder named after the resource with a filename named after the method.  So for the books/index path the view is `app/views/books/index.html.erb`.  Rails automatically looks for a layout template in its default location: `app/views/layouts/application.html.erb`. If that file exists, Rails will render that template and then place the content of the partial view in the place where the `yield` command exists in the layout.

```ruby
<!DOCTYPE html>
<html>
<head>
  <title>RailsLearning</title>
  <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true %>
  <%= javascript_include_tag 'application', 'data-turbolinks-track' => true %>
  <%= csrf_meta_tags %>
</head>
<body>

<%= yield %>

</body>
</html>
```

This will render the `app/views/layouts/application.html.erb` file, and then place the contents of `app/views/books/index.html.erb` in place of the `<%= yield %>` value tag.

## Notes on JavaScript & CSS Links
If you examine the layout above you will notice embedded ruby with `stylesheet_link_tag` and another with `javascript_include_tag`.  These methods are used to link in CSS and JavaScript content. We will see later how to include our own CSS content.  

The `csrf_meta_tag` is essentially a digital signature acting as verification that requests coming into Rails are in fact from properly logged in users.  You can do a view-source and look at what the csrf meta tag does.  More information is available [here](http://www.gnucitizen.org/blog/csrf-demystified/).

## Resources

-  [Rails Views Tutorials Point](https://www.tutorialspoint.com/ruby-on-rails/rails-views.htm)
- [Rails Controllers and Views (video)](https://www.youtube.com/watch?v=hp66U7Q8YXY)
