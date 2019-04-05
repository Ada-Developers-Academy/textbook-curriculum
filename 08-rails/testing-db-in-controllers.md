# Testing Database Changes in Controllers

## Learning Goals

By the end of this lesson you should be able to:

- write tests to verify controller actions make the proper changes to the database under nominal conditions
- write tests to verify that controller actions respond properly to invalid or incorrect input

## Content

It's important to ensure that controller actions appropriately change the related model for the `destroy`, `create` and `update` actions.  To do so we will use the rails `must_change` matcher and see how to use the it.

`must_change` is called on a block, just like `must_raise`.  We give it a string which it evaluates as Ruby code before and after the block executes.  The second argument is the amount by which the 1st argument changes when the block executes.  

The sample below illustrates testing the `destroy` action and verifies that the database reduces the number of records by one.

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
  end
end
```

**Question** What other test(s) should we write for the `destroy` action?

<details>
  <summary>Answer</summary>
  You should test for a delete request with an invalid or nonexistant id.
</details>


### Sending form params in a controller test

Remember that when we submit a form using `form_with` Rails receives the data as a sub-hash in params.  For our test we can pass such a hash into the request body like this:

```ruby
describe "create" do
  it "can create a book" do
    book_hash = {
      book: {
        title: "Practical Object Oriented Programming in Ruby",
        author: "Sandi Metz",
        description: 'A look at how to design object-oriented systems'
      }
    }

    expect {
      post books_path, params: book_hash
    }.must_change 'Book.count', 1

    must_respond_with  :redirect

    book = Book.find_by(title: "Practical Object Oriented Programming in Ruby")

    expect(book).wont_be_nil
    expect(book.title).must_equal book_hash[:book][:title]
    expect(book.author).must_equal book_hash[:book][:author]
    expect(book.description).must_equal book_hash[:book][:description]
  end
end
```

The example above illustrates that the test can pass in a mock-params hash into the request with the `params: params_hash` argument.  Notice we verify that the number of books in the database increases and that the last book in the database has the correct title, author and description.

**Exercise** You also need to create a test in which the params are invalid or missing.  With a partner write another test in which the params are invalid.  We have an [example solution](code_samples/create_controller_test.rb)

**Exercise** Similar to the `create` action tests, write tests to verify the correctness of the `update` action.  You should have at least 2 tests. When you finish you can [view our solution](./code_samples/update_controller_test.rb)

**Question**: Why 2 tests?

<details>
  <summary>
    Answer
  </summary>
  Your tests should check for a valid update, and an update to a nonexistant Book.
</details>

## Rails Matchers

|   Matcher	|   Sample	|
|---	|---	|
|   `must_respond_with`	|   `must_respond_with :success`	|
|   `must_redirect_to`	|   `must_redirect_to root_path`	|
|   `must_change`	|   `expect {delete book_path(books(:poodr).id) }.must_change 'Book.count', -1`	|