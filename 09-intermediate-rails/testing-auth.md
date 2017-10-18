# Testing Authentication

## Learning Goals:
- Better understand integration tests
- Know how to simulate a multi-request browser session in your tests
- Write some useful tests for login and logout functionality
- Set up OmniAuth for testing
- Understand what test mocking is

## Integration Testing
**Integration testing** is a kind of testing that is distinct from _unit testing_, which is what we've used primarily until now. While unit tests focus on a very specific piece of code, usually a single method, integration tests are about testing how multiple units work together to produce larger-scale program behavior.

### Example
|  Test Type  | Test | Scope of the test |
|:------------|:-----|:------------------|
| Unit        | Verify that a `Book` model's `valid?` method returns `false` when its `title` attribute is blank. | The test checks the behavior of a single method within a single class. |
| Integration | Verify that filling out a form to create a new book and leaving the title field empty does not create a new `Book` in the database. | The test checks how the `valid?` method combines with the database persistence code, the routes configuration, and the controller code. |

### Where we use integration testing
All of our model tests, as well as all of the tests we wrote before Rails, are unit tests. On the other hand, all of our controller tests are integration tests.

This is a natural dichotomy because controllers, when following the "heavy model, light controller" approach, are mostly "glue" between models and views. If you try to strip them of their entire context, as you should with a unit test, there's not much to test.

So instead we create integration tests which _use_ the controller actions we've defined, but also involve testing additional code from the models and routes.

### How to use integration tests in Rails
Because our integration tests are going to run code from all areas of our Rails app (models, views, controllers, and routes), we need to write our tests from the perspective of something outside of our application.

Specifically, we need to write our integration tests _in the role of the **browser**_. That is, our integration tests simulate a browser accessing our site by making HTTP requests to the server. Just like the browser, our test code is limited to making those requests and asserting various things about the response received back.

In particular, this means we cannot modify the `session` or `flash` directly from our tests. Instead we do what the browser would do: send another request.

Note that we can *read* `session` and `flash` *after* a request has been sent, to check they were filled in correctly. It is only attempting to *set* them from a controller test that Rails disallows. This will be important later when we're checking error messages.

## Integration Tests and OAuth

In the context of OAuth, this means every test we write will need to send not one but two requests to the server:

1. A request that logs in the user
1. The request we're interested in testing

This approach would have worked great for MediaRanker, but now that we've added OAuth it's got some problems:

- Logging in with GitHub OAuth is complicated
- We'd need real GitHub usernames and passwords for our tests
- This introduces GitHub as a **dependency** to our tests. If talking to GitHub is slow then our tests will be slow, and if GitHub is down then our tests will fail even though our code is correct.

To resolve these issues, we'll use a strategy known as **mocking**. The basic idea is when we're running our test, instead of going all the way to GitHub for user data we'll short-circuit the process and use some made up data instead.

### Mocking GitHub OAuth

Here is how we are going to approach this problem:

1. Tell OmniAuth to use mock data instead of connecting to GitHub
1. Define some test fixtures for the `User` model
1. Define a `login` function for our tests that sends the login request using fixture data
1. Test controller actions that require login!

#### Turn on Mocking

To be able to mock the interaction with Github, add this function to the `ActiveSupport::TestCase` class in `test/test_helper.rb`:

```ruby
# test/test_helper.rb
class ActiveSupport::TestCase
  # ...
  # Whatever stuff was here before
  # ...

  # OK this is what you're adding
  def setup
    # Once you have enabled test mode, all requests
    # to OmniAuth will be short circuited to use the mock authentication hash.
    # A request to /auth/provider will redirect immediately to /auth/provider/callback.
    OmniAuth.config.test_mode = true
  end
end
```

The `setup` method defined here will be run once, before all tests. All of our `describe` blocks will "inherit" from this class, so the setup code will be applied to them too.

#### Define Test Fixtures

These test fixtures are very similar to those we've made in the past. The only difference is in how we'll use them, not in how they are defined. Make sure the field names match the schema for your User model (this may differ slightly between Stacks and Queues).

<!-- TODO: Add yml highlighting before finishing -->
```
ada:
  oauth_provider: github
  oauth_uid: 12345
  email: ada@adadevelopersacademy.org
  username: countess_ada

grace:
  oauth_provider: github
  oauth_uid: 13371337
  email: grace@hooper.net
  username: graceful_hoops
```

#### Logging In

Next, we need to use this information to log in. We'll start by testing the auth callback itself, which will allow us to exercise this functionality in isolation.

**Question:** What interesting test cases can you think of for the auth callback? Hint: there are at least 3.

##### Building the Auth Hash

In order to log in a user, we'll need to provide data to our controller in the exact same format as GitHub does. To make this process easy, we'll create a helper method that turns an instance of the `User` model into a mocked auth hash. This method will be almost the opposite of the `User#from_github` method we defined when we set up OAuth in the first place.

To make the method available to all our tests, we'll put it in `test/test_helper.rb`. Open up `test/test_helper.rb` again and add the following at the bottom of `class ActiveSupport::TestCase`, after the `setup` method we added earlier:

```ruby
# test/test_helper.rb
class ActiveSupport::TestCase
  # ...
  # Whatever was here before, including the setup function
  # ...

  # Test helper method to generate a mock auth hash
  # for fixture data
  def mock_auth_hash(user)
    return {
      provider: user.oauth_provider,
      uid: user.oauth_uid,
      info: {
        email: user.email,
        nickname: user.username
      }
    }
  end
end
```

**Question:** Why didn't we add this as an instance method on the User model?

##### Test: Returning User

Now the test itself:

```ruby
# test/controllers/users_controller_test.rb
require "test_helper"

describe UsersController do
  describe "auth_callback" do
    it "logs in an existing user and redirects to the root route" do
      # Count the users, to make sure we're not (for example) creating
      # a new user every time we get a login request
      start_count = User.count

      # Get a user from the fixtures
      user = users(:grace)

      # Tell OmniAuth to use this user's info when it sees
      # an auth callback from github
      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(mock_auth_hash(user))

      # Send a login request for that user
      # Note that we're using the named path for the callback, as defined
      # in the `as:` clause in `config/routes.rb`
      get auth_callback_path(:github)

      must_redirect_to root_path

      # Since we can read the session, check that the user ID was set as expected
      session[:user_id].must_equal user.id

      # Should *not* have created a new user
      User.count.must_equal start_count
    end

    it "creates an account for a new user and redirects to the root route" do
    end

    it "redirects to the login route if given invalid user data" do
    end
  end
end
```

Note that we do check `session[:user_id]` here. Rails controller tests do let us see what the `session` looks like after each request, and there's essentially no other way to verify the user is logged in. This may feel a little dirty, but for such a specialized case as this it's OK.

**Question:** What do the other two tests for this controller action look like?

##### Test: New User

```ruby
it "creates a new user" do
  start_count = User.count
  user = User.new(oauth_provider: "github", oauth_uid: 99999, username: "test_user", email: "test@user.com")

  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(mock_auth_hash(user))
  get auth_callback_path(:github)

  must_redirect_to root_path

  # Should have created a new user
  User.count.must_equal start_count + 1

  # The new user's ID should be set in the session
  session[:user_id].must_equal User.last.id
end
```

**Question:** Why did we create a new `User` here? Do you notice any repeated code?

#### Login Helper

We're going to be using this login functionality a lot, so let's add it as a helper method, available to all our tests. Open up `test/test_helper.rb` again and add the following at the bottom of `class ActiveSupport::TestCase`:

```ruby
# test/test_helper.rb
def login(user)
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(mock_auth_hash(user))
  get auth_callback_path(:github)
end
```

This method takes a `User`, tells OmniAuth to use that user's data as it's mock auth hash, and then sends the login request, exactly like we did in our tests above.

Refactoring our returning user test above to use this method, it would look like:

```ruby
# test/controllers/users_controller_test.rb
it "logs in an existing user" do
  start_count = User.count
  user = users(:grace)

  login(user)
  must_redirect_to root_path
  session[:user_id].must_equal  user.id

  # Should *not* have created a new user
  User.count.must_equal start_count
end
```

Much neater!

### Interacting with Books

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

#### Logged In Users

These tests require the user to be logged in. We can accomplish this using a `before` block, which will run before every test:

```ruby
# books_controller_test.rb
describe BooksController do
  describe "Logged in users" do
    before do
      login(users(:grace))
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

#### Guest Users

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

## What Did We Accomplish?

- Discussed the difference between _unit testing_ and _integration testing_
- Identified GitHub as a _dependency_ for our tests
  - Decided this is a problem we should do something about
- Discussed _mocking_ as a strategy for short-circuiting external dependencies
- Turned on OmniAuth mocking using the `setup` method in `test/test_helper.rb`
- Did some ground-work on our models
  - Defined fixtures
  - Added a method to turn a model back into a (mocked) auth hash
- Wrote tests for our login controller using fixture data
- Moved the login functionality to it's own test helper method, again in `test/test_helper.rb`
- Split our `BooksController` tests based on whether the user is logged in or not
  - Tests for a logged-in user look very similar to what we had previously, we just had to add a `before` block
  - Tests for a guest user are all about what you can't do

## Additional Resources
- [OmniAuth Integration Testing](https://github.com/omniauth/omniauth/wiki/Integration-Testing)
- [Integration Testing Docs](http://api.rubyonrails.org/classes/ActionDispatch/IntegrationTest.html)
- [DHH on mutating `session` in Rails 5](https://github.com/rails/rails/issues/23386)
