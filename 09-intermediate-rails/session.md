# Session & Flash

## Learning Goals
- Learn about and utilize `flash` in Rails
- Learn about and utilize `session` in Rails
- See how `session` & `flash` are different than other variables in Rails

## `flash`
`flash` is a special type of hash that we utilize to send one-time messages from controllers to our views. It is often used to denote overall success or failure when submitting forms. `flash` messages are used a single time, and once they are displayed once they are gone.

The scenario that we are going to use to utilize `flash` is when we are adding a new book. Previously, we added the new book to the database and then used `redirect_to` to go back to the book list page. We want to add some sort of notice to the book list page to inform the user that their new book has been added successfully. Let's take a lot at our `create` method as it exists right now.
```ruby
# app/controllers/books_controller.rb
  def create
    @book = Book.create book_params

    if @book.id != nil
      redirect_to books_path
    else
      render :new
    end
  end
```

Let's update this controller action to add a key-value pair in the `flash` hash to contain a message that we want to display on the book list page when a book has been successfully added.

```ruby
# app/controllers/books_controller.rb
  def create
    @book = Book.create book_params

    if @book.id != nil
      flash[:success] = "Book added successfully"
      redirect_to books_path
    else
      render :new
    end
  end
```

Now let's test it out to see if this will be displayed somewhere on our book list page after successful creation. Any luck? No!

As with all variables that we set in our controller actions, the way we get this data to display to our users is to put it in a view! Since we can use `flash` in many different contexts, we will add this to our `application.html.erb` view so that any controller action will be able to use this in the future (though you can add this to any view you'd like).

```html
# app/views/layouts/application.html.erb
...
<body>
  <% flash.each do |name, message| %>
    <div class="<%= name %>"><%= message %></div>
  <% end %>

  <%= yield %>
</body>
```

This view code will also dynamically add a `class` to the message `div` so that we can add any distinguishing styles to these flash messages.

Now let's see what we end up with!

## `flash.now`

The above example works because right after we set the `flash` value in the controller, we are doing a `redirect_to`. If we want to use a `flash` but with a `render` instead of a `redirect_to` then we need to use `flash.now` instead. The different usage is solely based on what comes next. `flash.now` will only stick around going to a `render` and `flash` will stick around going to a `redirect`.



## Additional Resources
[Sessions, Cookies and Authentication ](http://www.theodinproject.com/courses/ruby-on-rails/lessons/sessions-cookies-and-authentication)(not including 'Rolling Your Own Auth')  
