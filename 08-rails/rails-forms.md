# Rails Forms
We've [previously seen](../05-html-css/html-forms.md) how HTML forms can be used to submit information to websites, and have practiced creating them manually. In this resource we will see that Rails has support for generating custom HTML forms that work well with Rails' conventions for models, controllers, and routes.

## Learning Goals
- Learn how to generate a form in Rails with the `form_with` method
- Discover some useful _view helpers_ specifically for working with forms
- Learn the benefits that `form_with` has when using an ActiveRecord model
- Get a feel for handling form data in a _controller_

## The `form_with` view helper
Similar to how `link_to` generates an achor tag, Rails has a method to generate a form named `form_with`. On the surface, they are very similar. Both are _view helpers_ that generate HTML content, and `form_with` is used to create a form, and can tie content to a specific ActiveRecord model.

Just as `link_to` generates an `<a>` element, `form_with` generates a `<form>` element.  Below is one example specifying the URL to submit the form to and the HTTP method (verb) to use in the request.

```erb
<%= form_with url: "/books", method: :post %>
```

### A note about hidden inputs
>When working with Rails-generated forms, you'll notice that they all include a couple of `<input>`elements with the type `hidden`. You may not have encountered this type of input before as it is primarily used when doing back-end programming, such as with Rails. The two inputs, named `utf8` and `authenticity_token` look like this:
> ```html
> <input name="utf8" type="hidden" value="✓">
> <input type="hidden" name="authenticity_token" value="8k7REve8u0Mq7UdaB+awSpMZ8af/5HF7udhgzpOVblQvhy2hCYIdjbEyrVhXwY9k7Ibpcprpjxxz8dCeqi55vQ==">
> ```
>You can ignore both of these input elements. They are necessary for Rails to work securely, but you should not need to understand or modify them. We have omitted these elements and associated data from the code snippets throughout the rest of this document.

<br>

If you check out the resulting HTML in the browser you will notice it generates the following:

```html
<form action="/books" accept-charset="UTF-8" data-remote="true" method="post">
</form>
```

You can also add additional HTML attributes to the form with more key-value pairs.  For example if you want to add a class with the value `create-book` for the form you can do the following

```erb
<%= form_with url: "/books", method: :post, class: 'create-book' %>
```

## Adding form content
So far we have generated `<form>` elements using `form_with`, but those elements have not had any contents. You may recall that HTML forms need to be populated with inputs such as text boxes and drop-down menus, and generally have a submit button.

We can use the `form_with` view helper to also generate forms with custom HTML content. For example:

```erb
<%= form_with url: "/books", method: :post do %>
  <p>Please provide the following information to save your book to our database:</p>
<% end %>
```

the above ERB generates the following HTML:

```html
<form action="/books" accept-charset="UTF-8" data-remote="true" method="post">
  <p>Please provide the following information to save your book to our database:</p>
</form>
```

_NOTE:_ Even though we're using a `do ... end` block now, it is still necessary to use `<%=` because the `form_with` method returns the generated `<form>` element. This is in contrast to how we use `each` in our view code, because the `each` method's return value is not important for the HTML, only the contents of its block.

So we can put HTML inside of our form now. This means we could write the `<input>` elements necessary to complete the form's conents. However as with the form itself, Rails can help us generate our inputs.

## Common view helpers for forms
Within the `form_with` block, additional view helpers can be used to create inputs, and labels, and submit buttons.

### The form builder
The Rails convention when generating forms is to specify the block with a parameter named `f`, like so:

```erb
<%= form_with url: "/books", method: :post do |f| %>
<% end %>
```

The `f` parameter, known as a _form builder_, is used when with the view helpers for things like input elements and labels. The following are some of the view helpers available through the form builder:

### Single-line text inputs with `text_field`
`text_field` is the the method to make a common text field. The first argument it expects is the HTML name attribute. The (optional) second argument is the default value of the input. Additional HTML options can be passed in a hash. For example:

```erb
<%= f.text_field :author, "J.K. Rowling", class: "books" %>
```

Results in:

```html
<input type="text" name="author" id="author" value="J.K. Rowling" class="books" />
```

### Submit buttons with `f.submit`
As the name implies, the `f.submit` _view helper_ generates a submit button for a form created with `form_with`. It accepts two parameters, both optional. The first is the text that should appear in the button (defaults to "Submit"), and the second is a hash of HTML attributes:

```erb
<%= f.submit "Save Book", class: "book-button" %>
```

Results in:

```html
<input type="submit" name="commit" value="Save Book" class="book-button" data-disable-with="Save Book" />
```

Many, many other _view helpers_ are available to help build any type of form or input. Look at the [form helper docs](https://edgeapi.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html) for complete documentation.

## A complete form
After combining the `form_with` helper and some of the other view helpers mentioned above, by placing them in the block for `form_with`, we have the ERB code to generate a complete HTML form. The entire form could look like:

```erb
<%= form_with url: "/books", method: :post do |f| %>
  <p>Please provide the following information to save your book to our database:</p>

  <%= f.label :title %>
  <%= f.text_field :title %>

  <%= f.label :author %>
  <%= f.text_field :author %>

  <%= f.submit "Save Book", class: "book-button" %>
<% end %>
```

The above ERB code generates this HTML:

```html
<form action="/books" accept-charset="UTF-8" data-remote="true" method="post">
  <p>Please provide the following information to save your book to our database:</p>

  <label for="title">Title</label>
  <input type="text" name="title" id="title" />

  <label for="author">Author</label>
  <input type="text" name="author" id="author" />

  <input type="submit" name="commit" value="Save Book" class="book-button" data-disable-with="Save Book" />
</form>
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
  <p>Please provide the following information to save your book to our database:</p>

  <%= f.label :title %>
  <%= f.text_field :title %>

  <%= f.label :author %>
  <%= f.text_field :author %>

  <%= f.submit "Save Book", class: "book-button" %>
<% end %>
```

The resulting HTML is:

```html
<form action="/books" accept-charset="UTF-8" data-remote="true" method="post">
  <p>Please provide the following information to save your book to our database:</p>

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

__Note:__ All of this connectedness depends on your code going along with many Rails conventions. While all the conventions _can_ be reconfigured, overwritten, and changed, it's important we spend some time getting to know our way around first. As an example, the code above will throw an error if there's not a RESTful route conforming to Rails naming conventions defined, or if the `new` controller action didn't define an `@book` variable.

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
    book: {
      author: "J.K. Rowling",
      title: "Harry Potter and The Chamber of Secrets"
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

Prior to Rails 5.1 Rails had two methods to generate forms in ERB:

-   `form_tag` generates a generic HTML form *not* tied to a specific model
-   `form_for` generates an HTML form tied to a specific model

You will see a lot of documentation, even in the [Rails Guide](http://guides.rubyonrails.org/form_helpers.html) for both `form_tag` and `form_for` and much less documentation for `form_with`.  All will still work, but the earlier methods are being soft-deprecated and will be replaced by `form_with` over time.  In particular, all the view helpers for the `form_for` method **will work** with the newer `form_with`.

## Resources
-   [`form_with` Documentation](https://api.rubyonrails.org/v5.1/classes/ActionView/Helpers/FormHelper.html#method-i-form_with)
-   [Official Documentation for form helper methods](http://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html)
-   [Rails 5.1's form_with vs. form_tag vs. form_for](https://m.patrikonrails.com/rails-5-1s-form-with-vs-old-form-helpers-3a5f72a8c78a)
