# Intro to the `show` Action

## Learning Goals

- Understand the responsibility of the Rails convention `show` action
- Know a list of nominal and edge cases to consider when testing the `show` action
- Use a route parameter in a controller action

## The `show` Action

The `show` action is a second controller action we will define. Its responsibility is, given some information (through route params), find a specific item, and then share that specific item's details with a view to display that specific item's details. **It is closest to the _Read_ in CRUD.** The `show` action is a _Rails convention_, so we will continue to use the name `show`.

## Testing

In the `show` action we will call the method with a `get` http verb, and a path including the id of a model instance in the database. 

- Nominal Case: If the instance is in the database, expect to see a response of `success`
- Edge Case: If the instance is not in the database, expect to see a response of `404` or `:not_found`

## Live Code Exercise

To demonstrate the `show` action, we will be sure to go through:

1. routes, and using route params
1. updating the controller
1. building a view for the `show` action
1. writing two tests: one for nominal case, and one for edge case.

### Using Route Parameters

Open up the `BooksController` - you should start with code like this:

```ruby
# app/controllers/books_controller.rb
BOOKS = [
  { title: "Hidden Figures", author: "Margot Lee Shetterly"},
  { title: "Practical Object-Oriented Design in Ruby", author: "Sandi Metz"},
  { title: "Kindred", author: "Octavia E. Butler"}
]

class BooksController < ApplicationController
  def index
    @books = BOOKS
  end
end
```

We'll need to add a new method, `show`. Inside that method we'll be able to access our route parameter via a special hash provided by Rails called `params`. The ID sent by the browser will be stored under the key `:id` (remember that this is the name we gave the parameter in the routefile).

```ruby
# app/controllers/books_controller.rb
def show
  book_id = params[:id].to_i
  @book = BOOKS[book_id]
  if @book.nil?
    head :not_found
    return
  end
end
```

Here we read the book ID from the params and store it in a variable `book_id`, then use that as an index into our list of books. As before, we'll use an instance variable to communicate with the view, though this time we've only got one `@book`, not multiple `@books`.

**Note:** In this implementation, we need to explicitly call `.to_i` on `params[:id]` because we need to use `book_id` as an index on the `BOOKS` array. We won't necessarily need to do this `.to_i` call in the future-- stay tuned!

Finally, there is that little bit at the end with `head :not_found`. We want to make sure that we are doing something meaningful when there isn't something to show, so this line sends back an error code 404, or 'not found' in lay-speak. We'll talk about more robust ways to deal with this in the future, but for now it's a good enough placeholder.

### Exercise: View

Build a `show` view that shows details for this book.

### Exercise: Test

Ask and answer the following questions for testing the show action in the Books Controller:

1. What file should these tests live in?
1. The nominal case for the show action is that, given a valid, existing book, when a user goes to a books detail page, they should see a successful page. What does the request/response cycle look like for the nominal case of the show action?
1. Based off of the last question, what kind of request and response should we expect to test for the nominal case?
1. What would an edge case for the show action look like?

For now, until we can test a database, it only makes sense for us to write a unit test for the nominal case. We'll come back to fully testing the show action at a later date.

<details>

<summary>
  Click here for details on the nominal and edge case of the show action
</summary>

  - Nominal case: this assumes that the specified record (book) is found. Check that the response is with the HTTP response code of 200 ok
  - Edge case: this assumes that the specified record (book) is not found. Should the controller give back 200 ok? Or should it _redirect_? Or should it return _not found_? Whatever the case, be sure to test this.

</details>

<br/>

For the nominal case, what do we need to _arrange_? What do we do to _act_? What do we do to _assert_?

We will use the hard-coded `BOOKS` array that we defined in the controller. That's because the hard-coded `BOOKS` array defines our "saved data" at the moment. In general, in the near future we will learn better ways to work with databases to avoid doing this, so be prepared to improve this several times.

For the edge case, what do we need to _arrange_? What do we do to _act_? What do we do to _assert_?

<details>

<summary>
  Show a solution for the show action tests
</summary>

```ruby
describe "show" do
  it "will get show for valid ids" do
    # Arrange
    valid_book_id = 1

    # Act
    get "/books/#{valid_book_id}"

    # Assert
    must_respond_with :success
  end

  it "will respond with not_found for invalid ids" do
    # Arrange
    invalid_book_id = 999

    # Act
    get "/books/#{invalid_book_id}"

    # Assert
    must_respond_with :not_found
  end
end
```

</details>


## Summary

- Use route parameters through the special `params` hash
  - `book_id = params[:id]`
- The key in `params` **must match** the name of the parameter in the route
