# Create Custom View Helpers

## Learning Goals:
After Reading this you should be able to:
- Create your own View Helpers to DRY and simplify your views code.
- Explain how view helpers function.
- Understand what sorts of problems view helpers are good at solving.

## View Helpers
We've already seen several built-in view helpers - things like `link_to`, `button_to`, and `form_for`. Rails also allows you to define your own custom view helpers. Custom helpers should be used for similar purposes: generating small amounts of HTML or text to be inserted into a web page.

New helper methods are defined in within the `app/helpers` directory. All of the helper files within `app/helpers` will be available to any page, the only reason to have separate files is to separate concerns. The `application_helper.rb` is a great place to define methods that are not specific to a model.

Let's define a new method that transforms a date object into something readable:
```ruby
def readable_date(date)
  ("<span class='date'>" + date.strftime("%A, %b %d") + "</span>").html_safe
end
```
Then within any view I could use this method, and pass in any date or time object:
```html
<h1><%= @book.title %></h1>
<%= readable_date(@book.created_at) %>
```
This would produce the HTML
```html
<h1><%= @book.title %></h1>
<span class='date'>Wednesday, Jan 08</span>
```

### HTML_SAFE
The html_safe method lets Rails know to use the HTML tags resulting from the helper.  If that is left off the resulting HTML will be "escaped" printing `&lt;span class='date'&gt;Monday, Jan 01&lt;/span&gt;` in the html instead of the literal tags.  Rails is doing this for security, to ensure that only HTML tags you specify are rendered on the page.  

By using html_safe you demonstrate that you are "trusting" the given string to have valid and trustworthy html code.

Another example which generates a random image:

```ruby
def random_image(width, height)
  number = rand(3)
  url = ""
  case number
  when 0
    url = "http://www.fillmurray.com/"
  when 1
    url = "http://www.placecage.com/"
  when 2
    url = "http://placekitten.com/"
  end
  ["<img src='", url, width,"/" ,height, "' alt='random image'>"].join.html_safe
end
```
And in the view:
```erb
<%= random_image(300, 400) %>
```

### What Goes Where?
We've learned about a whole bunch of places to put code: the Controller, the Model, Partials and View Helpers. Why are there so many, and what sorts of things ought to go where?

| Task                                            | Where It Goes           | Examples |
|:------------------------------------------------|:------------------------|:---------|
| Checking data                                   | Model (validations)     | `validates :email, presence: true` |
| Complex database queries                        | Model (self method)     | Retrieve the first 10 albums, in descending order by number of votes |
| Interesting action on a database object         | Model (instance method) | Total revenue from all sales for this Product, age of this Album |
| Checking that a request is reasonable           | Controller              | Filters, strong params |
| Rendering a small, simple piece of a webpage    | View Helper             | Formatting a date, prefixing the page title with the site title, building a link to a named route |
| Rendering a big, complicated piece of a webpage | Partial View            | Table of media items, form to create or edit a post |

## Resources
-  [html_safe](http://apidock.com/rails/v4.2.1/String/html_safe)
