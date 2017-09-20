# Rails Forms
## Learning Goals
- Explore two ways to handle forms in Rails
  + `form_tag` & `form_for`
- Discover some useful _view helpers_ specifically for working with forms
- Get a feel for handling form data in a _controller_

There are two ways to generate HTML forms within Rails: `form_tag` and `form_for`. On the surface, they are very similar. Both are _view helpers_ that generate HTML form tags. They differ in that `form_tag` is a __generic form__ while `form_for` is __tied to an object__. We'll explore both below.

## `form_tag`
`form_tag` generates an HTML `<form>` element. The first option that it takes is the submission path, (the `action` attribute in the `<form>` tag). The `method` attribute defaults to `POST`. Additional arguments can be given after the path in the form of a hash. Common options include applying a CSS class to the form, or changing the form _method_. Here's an example:

```erb
<%= form_tag "/books", class: "delete_products", method: :delete do %>

<% end %>
```

```html
<form class="delete_products" action="/products" accept-charset="UTF-8" method="post">
  <input name="utf8" type="hidden" value="&#x2713;" />
  <input type="hidden" name="_method" value="delete" />
  <input type="hidden" name="authenticity_token" value="5iHVj24QO4ku/VoS9/q3/o1XjIMSnnEtCmGt3iY5nPr8TZSyOkplduDkkyWfqPnlWD/zdQ/73e2DD1vRYXF7sQ==" />
</form>
```

### Common _view helpers_ for forms
Within the `form_tag` block, additional form helpers can be used to create inputs and labels.

#### `text_field_tag`
`text_field_tag` is the the method to make a common text field. The first argument
it expects is the HTML name attribute. The second is the default value of the input. Additional HTML options can be passed in a hash. For example:

```erb
<%= text_field_tag "book[author]", "J.K. Rowling", class: "books" %>
```

Results in:

```html
<input type="text" name="book[author]" id="book_author" value="J.K. Rowling" class="books" />
```

#### `submit_tag`
As the name implies, the `submit_tag` _view helper_ generates a submit button for a form created with `form_tag`. It accepts two parameters, both optional. The first is the text that should appear in the button (defaults to "Submit"), and the second is a hash of HTML attributes:

```erb
<%= submit_tag "Save Book", class: "book-button" %>
```

Results in:

```html
<input type="submit" name="commit" value="Save Book" class="book-button" />
```

Many, many other _view helpers_ are available to help build any type of form or input. Look at the [form helper docs](http://api.rubyonrails.org/classes/ActionView/Helpers/FormTagHelper.html) for complete documentation.

## form_for
`form_for` is similar to `form_tag`, except it is meant to be used in conjunction with an Active Record model.

The only required argument it takes is any ActiveRecord object. Rails will make assumptions about how to structure the form's method and action based on RESTful conventions (POST to `/books` for creating new records and PUT/PATCH to `/books/:id` for updating existing records, etc). Check it:

```erb
<%= form_for @book do |f| %>

<% end %>
```

```html
<form  action="/books" class="new_book" id="new_book" method="post">

</form>
```

The `form_for` block is given an argument (commonly `f` for "form builder"),
this object has methods very similar to the generic form builders like `text_field_tag`, but Rails can make assumptions about the form structure because of what it knows about the object:

```erb
<%= form_for @book do |f| %>
  <%= f.label :author %>
  <%= f.text_field :author %>
  <%= f.submit %>
<% end %>
```

Results in:

```html
<form class="new_book" id="new_book" action="/books" accept-charset="UTF-8" method="post">
  <input name="utf8" type="hidden" value="&#x2713;" />
  <input type="hidden" name="authenticity_token" value="atr2Gl2jJpe7sN9eAz9npBk1T4FYMcPeFI5xcMDSBDVwtrcnCfl4aHWpFmlrbSm/zF0wd0VUbx6d4Id/h5rjfg==" />

  <label for="book_author">Author</label>
  <input type="text" name="book[author]" id="book_author" />

  <input type="submit" name="commit" value="Create Book" />
</form>
```

### So what just happened?
Lots of stuff!

1. It automatically prepends the name field with the class of the ActiveRecord object. This way all elements of this form will be grouped together.
1. It automatically fills the `value` attribute of the input with the value of the corresponding attribute of the ActiveRecord object (if it exists).
1. It will differentiate between making forms for __new__ models and forms for editing __existing__ models and update the form's `action` and `method` attributes accordingly

__Note:__ All of this connectedness depends on your code going along with many Rails conventions. While all the conventions _can_ be reconfigured, overwritten, and changed, it's important we spend some time getting to know our way around first. As an example, the code above will throw an error if there's not a RESTful route conforming to Rails naming conventions defined.

Here's a link to the [official docs for form helpers](http://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html), which contains a list of the form builder methods for `form_for`.

Likely more helpful is the [Rails Guide for Form Helpers](http://guides.rubyonrails.org/form_helpers.html) which extensively covers both kinds of forms discussed in this document.

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

## Resources
-  [Rails Guide for Form Helpers](http://guides.rubyonrails.org/form_helpers.html)
-  [Official Documentation for form helper methods](http://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html)
