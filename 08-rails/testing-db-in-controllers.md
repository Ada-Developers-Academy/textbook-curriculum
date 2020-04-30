# Testing Database Changes in Controllers

## Learning Goals

By the end of this lesson you should be able to:

- Describe and use the `must_differ` Minitest matcher
- Understand how to test nominal and edge cases for database changes

## The Data, It's a Changin'

When we run a `POST` action, how do we know that the database is getting updated? Even if we know it's getting updated, how can we check that the data within is correct?

One of the mandates of TDD is making sure that all the code that we've written is trustworthy, so that we can pass it off to other programmers with confidence. To do so we will use the rails `must_differ` matcher to take a peek at our database during tests.

Like its cousin `must_raise`, `must_differ` is called on a block. We hand it two arguments: a string, which is evaluated as ruby code, and a number, which indicates how much we expect the value to be altered by. A single call to `must_differ` might look like this:

```ruby
volume = 6
expect {
  volume += 5
}.must_differ 'volume', 5
```

This might seem pretty obvious, as we trust addition in ruby to do what we ask of it, but we can leverage it to check different, more complicated types of operations. Let's pretend that our current project could check out a book using a route with the following route:

```ruby
#routes.rb

patch '/books/:id/check_out', to: 'books#check_out', as: 'checkout'
```

We'll also pretend, for the sake of this example, that we have a field in our `Book` called `in_stock` that we represent as a integer. When we check out a `Book` using this path, we expect that `somebook.in_stock` is reduced by one. The test might look something like this:

```ruby
describe "book_checkouts" do
  it "can correctly check out a book" do
    book = Book.first

    expect{
      patch checkout_path, params: book.id
    }.must_differ 'book.in_stock', -1
  end
end
```

It's worth noting that `must_differ` only works with numeric values, and _cares which direction the changes are going_.

## Putting it all Together
The sample below illustrates testing the `create` action and verifies that the database increases the number of records by one.

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
    }.must_differ 'Book.count', 1

    must_respond_with  :redirect
  end
end
```

### Sending form params in a controller test

Remember that when we submit a form using `form_with` Rails receives the data as a sub-hash in params.  For our test we can pass such a hash into the request body as we did above with `book_hash`.

The example above illustrates that the test can pass in a mock-params hash into the request with the `params: params_hash` argument.  Notice we verify that the number of books in the database increases and that the last book in the database has the correct title, author and description.

We will also need to create a test in which the params are invalid or missing.  We will cover this test next week when we cover validations.

**Exercise** Similar to the `create` action tests, write tests to verify the correctness of the `update` action.  You should have at least 2 tests. When you finish you can view our solution below.

<details>
  <summary>
    Update Tests
  </summary>
  
  ```
  describe "update" do
    before do
      Book.create(title: "We're all wonders", author: " R.J. Palacio", description: "Good kids book")
    end
    let (:new_book_hash) {
      {
        book: {
          title: "A Wrinkle in Time",
          author: "Madeleine L'Engle",
          description: "A fabulous adventure",
        },
      }
    }
    it "will update a model with a valid post request" do
      book = Book.first
      expect {
        patch book_path(book.id), params: new_book_hash
      }.wont_change "Book.count"
  
      must_respond_with :redirect
  
      book = Book.find_by(id: id)
      expect(book.title).must_equal new_book_hash[:book][:title]
      expect(book.author).must_equal new_book_hash[:book][:author]
      expect(book.description).must_equal new_book_hash[:book][:description]
    end
  
    it "will respond with not_found for invalid ids" do
      id = -1
  
      expect {
        patch book_path(id), params: new_book_hash
      }.wont_change "Book.count"
  
      must_respond_with :not_found
    end
  
    it "will not update if the params are invalid" do
      # This test will be examined when we cover validations next week
    end
  end
  ```
  
</details>

**Question**: Why 2 tests?

<details>
  <summary>
    Answer
  </summary>
  Your tests should check for a valid update, and an update to a nonexistant Book.
</details>

### Reloading from the database

Notice in our solution above, after we make the `patch` request we have the line:

```ruby
book = Book.find_by(id: id)
```

**Question**:  Why did we do this?  

<details>
  <summary>Answer</summary>

  This is because when we make the `patch` request we update the <em>database</em> but not the local variable in the test.  So we needed to refetch the data in the database.

  It's important to know that changes in the database do not immediately get reflected in local variables until the data is pulled in.
</details>

We can also replace the line:

```ruby
book = Book.find_by(id: id)
```

with this:

```ruby
book.reload
```

## Rails Matchers

|   Matcher	|   Sample	|
|---	|---	|
|   `must_respond_with`	|   `must_respond_with :success`	|
|   `must_redirect_to`	|   `must_redirect_to root_path`	|
|   `must_differ`	|   `expect {delete book_path(books(:poodr).id) }.must_differ 'Book.count', -1`	|

## Summary

We've looked at how we can check and verify that controller actions make changes to the database.  We verified that `create` actions create new entries in the database and `update` actions change existing entries in the database.  
