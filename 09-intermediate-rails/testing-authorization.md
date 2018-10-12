# Testing Authorization

We have written [tests for logging in and logging out](testing-login.md), but authentication is only half of our security story. Testing the other half, authorization, is the subject of this lesson.

## Learning Goals
By the end of this lesson, students should be able to...

- Adapt our existing controller tests for our new authorization story
- Write controller tests that verify that an unauthorized user cannot do things

## Introduction

Recall that last time we added a line like the following to `BooksController`:

```ruby
before_action :require_login, except [:index]
```

This made it impossible for a user to do anything but list books before logging in. If you really think about it, this actually gives us two bits of functionality for each action:
- If the user is logged in, they can do a thing to a book
- If the user is **not** logged in, when they attempt to do a thing to a book they get redirected to the root path with an error message

This new functionality means we need a new test case for each controller action, to verify access is correctly restricted.

To accomplish this, let's start by splitting our books tests in two using nested describe blocks:

```ruby
# books_controller_test.rb
describe BooksController do
  describe "Logged in users" do
    # most of our existing tests go here since they
    # assume a logged-in user
  end

  describe "Guest users" do
    # we allow only the book index page for our guest users
    # so we'll want to verify the redirect to root and message for these
  end
end
```

## Logged In Users

These tests require the user to be logged in. Fortunately we've already written a helper method that runs our (mocked) authentication workflow: `perform_login`.

We'll put a call to this method in a `before` block, which will run before every test:

```ruby
# books_controller_test.rb
describe BooksController do
  describe "Logged in users" do
    before do
      perform_login(users(:grace))
    end

    describe "show" do
      # Just the standard show tests
      it "succeeds for a book that exists" do
        book_id = Book.first.id
        get book_path(book_id)
        must_respond_with :success
      end

      it "returns 404 not_found for a book that D.N.E." do
        book_id = Book.last.id + 1
        get book_path(book_id)
        must_respond_with :not_found
      end
    end

    # ...
    # Tests for other actions
    # ...
  end

  describe "Guest users" do
  end
end
```

**Question:** If we made a rule that users can only edit and delete books that they added to the site, how would this affect our testing?

## Guest Users

For our guest users, we need to verify that access is restricted to everything but `index`.

```ruby
# books_controller_test.rb
describe BooksController do
  describe "Logged in users" do
    # See above section
  end

  describe "Guest users" do
    it "can access the index" do
      get books_path
      must_respond_with :success
    end

    it "cannot access new" do
      get new_book_path
      must_redirect_to root_path
      flash[:message].must_equal "You must be logged in to see that page!"
    end

    # ...
    # Similarly for other controller actions
    # ...
  end
end
```

## Summary

- We have split our `BooksController` tests based on whether the user is logged in or not
  - Tests for a logged-in user look very similar to what we had previously, we just had to add a `before` block
  - Tests for a guest user are all about what you can't do
