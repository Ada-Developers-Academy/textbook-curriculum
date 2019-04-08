# Intro to the Destroy Action

## Learning Goals

- Understand the responsibility of the Rails convention `destroy` action
- Review the nominal and edge cases when testing the `destroy` action
- Use a route parameter in a controller action
- Learn to make a `delete` request

## The `destroy` Action

The `destroy` action is the last of the RESTful controller actions we will define. Its responsibility is, given some information (through route params), find a specific item, and then delete it from the database. **It is the _Delete_ in CRUD.** The `destroy` action is a _Rails convention_, so we will continue to use the name `destroy`.

## Testing

Earlier when we looked at [testing database changes in controllers](testing-db-in-controllers.md) we examined a test for the `destroy` action.  

```ruby
describe "destroy" do
  it "can destroy a model" do
    # Arrange
    poodr = Book.new title: "Practical Object Oriented Programming in Ruby", author: "Sandi Metz"

    poodr.save
    id = poodr.id

    # Act
    expect {
      delete book_path(id)

      # Assert
    }.must_change 'Book.count', -1

    must_respond_with :redirect
    must_redirect_to books_path
  end
end
```

In the `destroy` action we will call the method with a `delete` http verb, and a path including the id of a model instance in the database.

- Nominal Case: If the instance is in the database, expect to remove that item from the database and then redirect back to the `index` action.
- Edge Case: If the instance is not in the database, expect to see a response of `404` or `:not_found`

## Live Code Exercise

To demonstrate the `destroy` action, we will be sure to go through:

1. routes, and using route params
1. Adding a link to the destroy action's route
1. updating the controller
1. writing two tests: one for nominal case, and one for edge case.

### Using Route Parameters

Open up the `BooksController` - we will need to add a new method `destroy` like this:

```ruby
# app/controllers/books_controller.rb
def destroy
  book_id = params[:id]
  @book = Book.find_by(id: book_id)

  if @book
    @book.destroy
    redirect_to books_path
  else
    render :notfound, status: :not_found
  end
end
```

Here we read the book ID from the params and store it in a variable `book_id`, then use that to find a specific book.  If the book is found, we call the **model** `destroy` method.  If we do not find the book, we render a 404 page.  

### Adding a Link to the `destroy` Action

In our active site, we will need some way for a user to delete a book.  We can do so with a link, but `link_to` by default makes a `GET` request.  We can add a `link_to` with a `method` attribute similar to this, in our `index.html.erb` and `show.html.erb` views.

```erb
<%= link_to "Delete #{book.title}", book_path(book.id), method: :delete %>
```

We will also need to add a route in the `config/routes.rb` file.

```ruby
delete '/books/:id', to: 'books#destroy'
```

### Exercise: Test

Write the two tests for the destroy action. There is a finished solution for the controller tests [here](code_samples/destroy_controller_test.rb)

## Summary

- You can render a default 404, not found, page with `render :notfound, status: :not_found`
- The destroy action is, by convention, the name for the delete part of the CRUD acronym.
- A destroy action will need 2 tests, just like the show action.  
