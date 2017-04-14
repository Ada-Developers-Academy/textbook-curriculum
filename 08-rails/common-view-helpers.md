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

### `image_tag(filename, options)`
`image_tag` generates an HTML `<img>` tag. The argument given will be an image filename for the `src` attribute. Rails (the asset pipeline) looks in the `app/assets/images` directory for images. You can provide additional attributes as optional hash parameters:

```erb
<%= image_tag "cat.jpg", alt: "The cutest cat in the whole world." %>
```

The above `image_tag` will give you this HTML:

```html
<img src="/assets/cat.jpg" alt="The cutest cat in the whole world.">
```

## Using Named Routes

Above we used hard-coded paths like "/profile" in our helpers.  We can also use methods like `link_to` with named routes from our `config/routes.rb` file.  

For example:

```erb
<%= link_to "All Books", books_path %>
```

Can function as a link to the `books#index` action.  Rails automatically provides a helper for each path.  The name of each helper is the name of the path with `_path` on the end. 

Named routes are helpful because if we want to change the path we then only have to edit `config/routes.rb` once and the helper methods will then use the new path.

So for a `routes.rb` file like:

```ruby
# config/routes.rb
Rails.application.routes.draw do

  root "books#index"

  get "/books/new", to: "books#new", as: "new_book"
  post "/books", to: "books#create", as: "books"

  get '/books/:id/edit', to: 'books#edit', as: "edit_book"
  patch '/books/:id', to: 'books#update'

  get "/books", to: "books#index"
  get "/books/:id", to: "books#show", as: "book"

  delete "/books/:id", to: "books#destroy", as: "delete_book"
end
```

Will result in the following helpers:  
-  `books_path`
-  `new_book_path`
-  `edit_book_path`
-  `book_path`
-  `delete_book_path`

Rails will only generate route helper methods for each *named* path.

### Paths with Parameters

Some paths like to the `books#show` action require a parameter.  

```erb
<%= link_to "Book #4", book_path(4) %>
```

The sample above would provide a link for a book with ID number 4.

```html
<a href="/books/4">Book #4</a>
```


## Helpful Links
- [An overview of helpers](http://guides.rubyonrails.org/action_view_overview.html#overview-of-helpers-provided-by-action-view)
- [Complete documentation on view helpers](http://api.rubyonrails.org/classes/ActionView/Helpers.html)
- [Guide on `button_to`](http://api.rubyonrails.org/classes/ActionView/Helpers/UrlHelper.html#method-i-button_to)
