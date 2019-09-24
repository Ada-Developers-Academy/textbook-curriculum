# Common View Helpers
## Learning Goals
- What's a view helper?
- Explore some of the most common helpers

## Rails wants to be helpful
Rails provides many methods when working in views that automate and/or simplify common, tedious tasks in HTML. These methods are collectively referred to as view helpers.

## Some common helpers

### `link_to(text, path, options)`
`link_to` creates an HTML `<a>` element. The first argument given to the method will become the text between the `<a></a>` tags, the second argument will become the value assigned to the `href` attribute of the tag:

```erb
<%= link_to "About Me", "/profile" %>
```

becomes

```html
<a href="/profile">About Me</a>
```

An additional options hash argument is optional to set arbitrary attributes of the `<a>` tag:

```erb
<%= link_to "About Me", "/profile", class: "link" %>
```

The above `link_to` will give you this HTML:

```html
<a href="/profile" class="link">About Me</a>
```

**NOTE:** This method assumes that you are doing a `GET` request! You have to throw in a little bit of extra syntax to get a different kind of request:

```ruby
<%= link_to "Delete This Book", @book, method: :delete %>
```

#### Named Paths

In addition to regular strings, `link_to` can (and should) use the generated helper methods for named paths. For example, to link to the list of books:

```erb
<%= link_to "Book List", books_path %>
```

generates

```html
<a href="/books">Book List</a>
```

If you wanted to provide a link to each of the books stored in the array `@books`, you might write

```erb
@books.each do |book|
  <%= link_to book.title, book_path(book) %>
end
```


### `image_tag(filename, options)`
`image_tag` generates an HTML `<img>` tag. The argument given will be an image filename for the `src` attribute. Rails (the asset pipeline) looks in the `app/assets/images` directory for images. You can provide additional attributes as optional hash parameters:

```erb
<%= image_tag "cat.jpg", alt: "The cutest cat in the whole world." %>
```

The above `image_tag` will give you this HTML:

```html
<img src="/assets/cat.jpg" alt="The cutest cat in the whole world.">
```

## Let's Try it!

Let's update our views so that they link to each other using `link_to`!

## Helpful Links
- [An overview of helpers](http://guides.rubyonrails.org/action_view_overview.html#overview-of-helpers-provided-by-action-view)
- [Complete documentation on view helpers](http://api.rubyonrails.org/classes/ActionView/Helpers.html)
- [Guide on `button_to`](http://api.rubyonrails.org/classes/ActionView/Helpers/UrlHelper.html#method-i-button_to)
