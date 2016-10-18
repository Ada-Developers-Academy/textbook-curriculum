# Create Custom View Helpers

## Learning Goals:
After Reading this you should be able to:
- Create your own View Helpers to DRY and simplify your views code.
- Explain how view helpers function.


New helper methods are defined in within the `app/helpers` directory. All of the helper files within `app/helpers` will be available to any page, the only reason to have separate files is to separate concerns. The `application_helper.rb` is a great place to define methods that are not specific to a model.

Let's define a new method that transforms a date object into something readable:
```ruby
  def readable_date(date)
    "<span class='date'>" + date.strftime("%A, %b %d") + "</span>"
  end
```
Then within any view I could use this method, and pass in any date or time object:
```html
<h1><%= @book.title %></h1>
<%= readable_date(@book.created_at).html_safe %>
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
    picture = ""
    case number
      when 0
      picture = "http://www.fillmurray.com/"
      when 1
        picture = "http://www.placecage.com/"
      when 2
        picture = "http://placekitten.com/"
    end
    ["<img src='", picture, width,"/" ,height, "' alt='random image'>"].join.html_safe
  end
end
```
And in the view:
```erb
<%= random_image(300, 400) %>
```

## Resources
-  [html_safe](http://apidock.com/rails/v4.2.1/String/html_safe)
