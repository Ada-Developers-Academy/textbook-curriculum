# Create Custom View Helpers

## Learning Goals:

After this lesson, students will be able to:

- Locate view helpers and associated tests within the files and folders of a Rails app
- Write a view helper
- Identify and test common edge-cases for a view helper
- Decide whether a view helper is the appropriate tool to solve a given problem

## View Helpers

A view helper is a Ruby method that generates HTML. We have already worked with many of these,like `link_to`, `image_tag`, and `form_with`. Rails also allows you to define your own custom view helpers. Custom helpers should be used for similar purposes: generating small amounts of HTML or text to be inserted into a web page.

Custom helper methods are defined within the `app/helpers` directory. Rails will make all view helpers available on any page of your app, but much like with CSS, we will use the different files to separate helpers specific to different parts of the app. The `application_helper.rb` is a great place to define methods that are not specific to a model.

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
    - A partial feels too "big" for what we're doing here - we're generating a small amount of HTML, not a big chunk of a page
    - This code is specific enough that it would be worth testing, and there's no way to test a partial
- As a **view helper**: yes!
    - We're generating a small amount of generic HTML
    - The logic is separate from any specific model
    - View helpers are very testable
</details>

### Writing the Helper

Now that we've decided on a view helper, we can get to work. The [`time_ago_in_words` method](https://api.rubyonrails.org/v5.1/classes/ActionView/Helpers/DateHelper.html#method-i-time_ago_in_words) provided by Rails might come in handy.

```ruby
# app/helpers/application_helper.rb
module ApplicationHelper
  def readable_date(date)
    return "[unknown]" unless date
    return content_tag(:span, "#{time_ago_in_words(date)} ago", class: 'date', title: date.to_s)
  end
end
```

When invoked from a view template, this method will generate HTML similar to our example above.

```html+erb
Added to this site <%= readable_date(@book.created_at) %>

<!-- Generates -->

Added to this site <span class="date" title=""2019-04-21T19:33:26-07:00">14 minutes ago</span>
```

A few things to notice here:
- We check for `nil` at the top of the method
- We write our HTML as a sequence of strings concatenated (plussed) together
- We call the method `html_safe` on some but not all of the strings

### `content_tag`

The `content_tag` method lets Rails know that we would like to create a HTML tag. Without it the generated HTML will be escaped. In other words, instead of

```html
<span class="date" title="2019-04-21T19:33:26-07:00">14 minutes ago</span>
```

we will get

```html
&lt;span class="date" title="2019-04-21T19:33:26-07:00"&gt;14 minutes ago&lt;/span&gt;
```

This is rendered by the browser into literal less-than and greater-than characters. In fact, this is true of any string inserted into HTML by an ERB value tag. For example:

```html+erb
<%= "<p>Test Paragraph</p>" %>

<!-- Generates -->

&lt;p&gt;Test Paragraph&lt;/p&gt;" %>
```

Ruby has good reason to be so suspicious. Imagine the following scenario: A malicious user creates a new book on our site. Instead of a real description, they write some malicious JavaScript inside of a `<script>` tag. If Rails didn't escape the angle brackets in the tag, then any other browser that viewed that book would immediately begin executing that JavaScript. All of a sudden our site has become an attack vector for someone else!

### Testing

One of the major benefits of view helpers is that they can be tested relatively easily, unlike most of our view code.

Tests for our view helpers will live in the `test/helpers` directory. Rails will not automatically generate test files for some reason, but we can create an empty one:

```ruby
# test/helpers/application_helper_test.rb
require "test_helper"

describe ApplicationHelper, :helper do
  describe 'readable_date' do
  end
end
```

**_NOTE:_** Unlike other classes, the `ApplicationHelper` won't be magically hooked in for us by Minitest-Rails. We need to do let Minitest know that the `ApplicationHelper` is specifically a `:helper`.

**Question:** What interesting test cases exist for our `readable_date` view helper?

View helper tests typically consist of providing a known input and checking against a known output, so we might write the following two cases:

```ruby
require "test_helper"

describe ApplicationHelper, :helper do
  describe "readable_date" do
    it "produces a tag with the full timestamp" do
      date = Date.today - 14

      result = readable_date(date)

      expect(result).must_include date.to_s
    end

    it "returns [unknown] if the date is nil" do
      date = nil

      result = readable_date(date)

      expect(result).must_equal "[unknown]"
    end
  end
end
```

## What Goes Where?
We've learned about a whole bunch of places to put code: the Controller, the Model, Partials and View Helpers. Why are there so many, and what sorts of things ought to go where?

| Task                                            | Where It Goes           | Examples |
|:------------------------------------------------|:------------------------|:---------|
| Checking data                                   | Model (validations)     | `validates :email, presence: true` |
| Complex database queries                        | Model (self method)     | Retrieve the first 10 albums, in descending order by number of votes |
| Interesting action on a database object         | Model (instance method) | Total revenue from all sales for this Product, age of this Album |
| Checking that a request is reasonable           | Controller              | Filters, strong params |
| Reusable view specific logic that is Ruby involved; not very HTML involved | View Helper             | Formatting a date, prefixing the page title with the site title, building a link to a named route |
| Rendering a reusable chunk of HTML for a webpage | Partial View            | Table of media items, form to create or edit a post |

## Summary

- View helpers are Ruby methods that generate HTML
- View helpers are most useful for ruby-involved pieces of display logic
- If you want to include tags, you must mark them as trusted using `html_safe`. **Only use `html_safe` on data you actually trust (i.e. string literals)!**
- Testability is one of the big advantages of view helpers. Take advantage of it!

## Resources
- [`html_safe` documentation](http://apidock.com/rails/String/html_safe)
- [Everything You Know About `html_safe` is Wrong](https://makandracards.com/makandra/2579-everything-you-know-about-html_safe-is-wrong) - excellent resource describing security concerns

