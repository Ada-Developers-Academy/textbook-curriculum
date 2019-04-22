# Create Custom View Helpers

## Learning Goals:

After this lesson, students will be able to:

- Locate view helpers and associated tests within the files and folders of a Rails app
- Write a view helper
- Identify and test common edge-cases for a view helper
- Decide whether a view helper is the appropriate tool to solve a given problem

## View Helpers

A view helper is a Ruby method that generates HTML. We have already worked with many of these,like `link_to`, `image_tag`, and `form_with`. Rails also allows you to define your own custom view helpers. Custom helpers should be used for similar purposes: generating small amounts of HTML or text to be inserted into a web page.

Custom helper methods are defined in within the `app/helpers` directory. Rails will make all view helpers available on any page of your app, but much like with CSS, we will use the different files to separate helpers specific to different parts of the app. The `application_helper.rb` is a great place to define methods that are not specific to a model.

**Question:** Open the file `app/helpers/application_helper.rb`. What does it contain? How might we figure out how to use this file?

### Example: Displaying Timestamps

Consider the problem of displaying timestamps to the user. Most of the time, a human will want to see a time in a human-readable format, like "14 minutes ago" or "2 days from now". However, sometimes we need a more precise time, like `2019-04-21T19:33:26-07:00`.

A common solution to this problem is to display the human-readable date on the page, and include hover text using the HTML `title` attribute for the full timestamp:

```html
<span class="date" title="2019-04-21T19:33:26-07:00">
  14 minutes ago
</span>
```

Hand-writing all this code every time we need to display a timestamp would be tedious and error-prone, so it makes sense to write a method to do this for us.

**Question:** What options do we have for where this method might live? Which feels like the best fit?

<details>
<summary>Click here to see the options</summary>

- As a **model method**: no
    - Many different models might contain dates, so it would be hard to pick one model to put it in
    - This code is concerned with presentation, and should be associated with the view layer
- As a **partial view**: no
    - A partial feels too "big" for what we're doing here - we're generating a small amount of code, not a big chunk of a page
    - This code is specific enough that it would be worth testing, and there's no way to test a partial
- As a **view helper**: yes!
    - We're generating a small amount of generic HTML
    - The logic is separate from any specific model
    - View helpers are very testable
</details>




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
    url = "https://picsum.photos/"
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
-  [html_safe](http://apidock.com/rails/String/html_safe)
