# Create Custom View Helpers

## Learning Goals:
- TODO

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
<%= readable_date(@book.created_at) %>
```
This would produce the HTML
```html
<h1><%= @book.title %></h1>
<span class='date'>Wednesday, Jan 08</span>
```
