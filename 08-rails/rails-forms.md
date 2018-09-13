# Rails Forms
We've [previously seen](../05-html-css/html-forms.md) how HTML forms can be used to submit information to websites, and have practiced creating them by manually. In this resource we will see that Rails has support for generating custom HTML forms that work well with Rails' conventions for models, controllers, and routes.

## Learning Goals
- Learn how to generate a form in Rails with the `form_with` method.
- Discover some useful _view helpers_ specifically for working with forms
- Get a feel for handling form data in a _controller_

## `form_with`
Similar to how `link_to` generates an achor tag, Rails has a method to generate a form named `form_with`. On the surface, they are very similar. Both are _view helpers_ that generate HTML content, and `form_with` is used to create a form, and can tie content to a specific type of model.

`form_with` generates an HTML `<form>` element.  Below is one example specifying the URL to submit the form to and the HTTP method (verb) to use in the request.

```erb
<%= form_with url: "/books", method: :post do |f| %>

<% end %>
```

If you check out the resulting HTML in the browser you will notice it generates the following:

```html
<form action="/books" accept-charset="UTF-8" data-remote="true" method="post"><input name="utf8" type="hidden" value="✓"><input type="hidden" name="authenticity_token" value="8k7REve8u0Mq7UdaB+awSpMZ8af/5HF7udhgzpOVblQvhy2hCYIdjbEyrVhXwY9k7Ibpcprpjxxz8dCeqi55vQ==">

</form>
```

You can also add additional HTML attributes to the form with more key-value pairs.  For example if you want to add a class with the value `create-book` for the form you can do the following

```erb
<%= form_with url: "/books", method: :post class: 'create-book' do |f| %>

<% end %>
```

### Common _view helpers_ for forms
Within the `form_with` block, additional form helpers can be used to create inputs and labels.

#### `text_field`
`text_field` is the the method to make a common text field. The first argument
it expects is the HTML name attribute. The second is the default value of the input. Additional HTML options can be passed in a hash. For example:

```erb
<%= f.text_field "book[author]", "J.K. Rowling", class: "books" %>
```

Results in:

```html
<input type="text" name="book[author]" id="book_author" value="J.K. Rowling" class="books" />
```

#### `f.submit`
As the name implies, the `f.submit` _view helper_ generates a submit button for a form created with `form_with`. It accepts two parameters, both optional. The first is the text that should appear in the button (defaults to "Submit"), and the second is a hash of HTML attributes:

```erb
<%= f.submit "Save Book", class: "book-button" %>
```

Results in:

```html
<input type="submit" name="commit" value="Save Book" class="book-button" data-disable-with="Save Book">
```

Many, many other _view helpers_ are available to help build any type of form or input. Look at the [form helper docs](https://edgeapi.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html) for complete documentation.

The entire form could look like:

```erb
<%= form_with url: "/books", method: :post do |f| %>
  <%= f.label :title %>
  <%= f.text_field :title %>

  <%= f.label :author %>
  <%= f.text_field :author %>

  <%= f.submit "Save Book", class: "book-button" %>
<% end %>
```

## Binding `form_with` to an ActiveRecord Model

`form_with` can also work with an ActiveRecord Model using a `model` key and an ActiveRecord Model as a value.

If we change our `BooksController#new` controller method to:

```ruby
def new
  @book = Book.new
end
```

We can update the `form_with` in `views/books/new.html.erb` to:

```erb
<%= form_with model: @book do |f| %>
  <%= f.label :title %>
  <%= f.text_field :title %>

  <%= f.label :author %>
  <%= f.text_field :author %>

  <%= f.submit "Save Book", class: "book-button" %>
<% end %>
```

The resulting HTML is:

```html
<form action="/books" accept-charset="UTF-8" data-remote="true" method="post"><input name="utf8" type="hidden" value="✓"><input type="hidden" name="authenticity_token" value="AKeeT6nk32KhwFJvZZvEkoIEMlrsCh2D7AJGygNskWLdbmL8V9p5rDofuG01vPu8/Zsqj4kH4+QmK/aaOteGiw==">
  <label for="book_title">Title</label>
  <input type="text" name="book[title]" id="book_title">

  <label for="book_author">Author</label>
  <input type="text" name="book[author]" id="book_author">

  <input type="submit" name="commit" value="Save Book" class="book-button" data-disable-with="Save Book">
</form>
```


### So what just happened?
Lots of stuff!

1. It automatically prepends the name field with the class of the ActiveRecord object. This way all elements of this form will be grouped together.
1. It automatically fills the `value` attribute of the input with the value of the corresponding attribute of the ActiveRecord object (if it exists).
1. It will differentiate between making forms for __new__ models and forms for editing __existing__ models and update the form's `action` and `method` attributes accordingly.

__Note:__ All of this connectedness depends on your code going along with many Rails conventions. While all the conventions _can_ be reconfigured, overwritten, and changed, it's important we spend some time getting to know our way around first. As an example, the code above will throw an error if there's not a RESTful route conforming to Rails naming conventions defined.

Here's a link to the [official docs for form helpers](http://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html), which contains a list of the form builder methods.  The documentation uses an older `form_for` builder method, but all the view helpers also work alongside `form_with`.

### Exercise:

1.  In `BooksController#new`, give the book instance variable a default title.  Do you notice a change in the form?
1.  Next put in an `@book.save` to the controller method.  Do you notice any change in the resulting HTML?  Look at the HTML output in Chrome Developer Tools.

**After this exercise, change the content back to:**

```ruby
def new
  @book = Book.new
end
```

## Controllers & Form Data
Submitting a form results in the form data being collected into the _params hash_. The structure of form data follows the same patterns as in other frameworks. This means we can leverage creative naming in the HTML (like `book[author]`) to create well structured objects in the _params hash_.

If we submitted the `form_for` example above, the params hash would arrive in our _controller action_ looking something like:

```ruby
  {
    "utf8" => "✓",
    "authenticity_token" => "X/be9deLjFilsqYcOVBMM5Fj1vf7OWAr1K9F97JVhbhFmp/Ig9HSp2urbytRAgIoRAupAeZczOtdwbP49R1i8w==",
    "book" => {
      "author" => "J.K. Rowling" },
      "title" => "Harry Potter and The Chamber of Secrets"
    }
  }
```

We can then use the params as attributes for Active Record models. If, for example, we were wanting to make a new Book using the params data above, our _controller action_ would look something like:

```ruby
# in app/controllers/books_controller.rb
def create
  @book = Book.new(author: params[:book][:author], title: params[:book][:title]) #instantiate a new book
  if @book.save # save returns true if the database insert succeeds
    redirect_to root_path # go to the index so we can see the book in the list
  else # save failed :(
    render :new # show the new book form view again
  end
end
```

<!-- TODO Add image linking form fields to params -->

## Note on `form_tag` and `form_for`

Prior to Rails 5.1 Rails had two methods to generate forms in ERB.

-   `form_tag` generates a generic HTML form not tied to a specific model.
-   `form_for` generates an HTML form tied to a specific model-type.

You will see a lot of documentation, even in the [Rails Guide](http://guides.rubyonrails.org/form_helpers.html) for both `form_tag` and `form_for` and much less documentation for `form_with`.  All will still work, but the earlier methods are being soft-depreciated and will be replaced by `form_with` over time.  In particular, all the view helpers for the `form_for` method **will work** with the newer `form_with`.

## Resources
-   [`form_with` Documentation](https://api.rubyonrails.org/v5.1/classes/ActionView/Helpers/FormHelper.html#method-i-form_with)
-   [Official Documentation for form helper methods](http://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html)
-   [Rails 5.1's form_with vs. form_tag vs. form_for](https://m.patrikonrails.com/rails-5-1s-form-with-vs-old-form-helpers-3a5f72a8c78a)
