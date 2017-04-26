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

### Plan of Action
Here is how we are going to approach this problem:
1. Set up our test suite to know we want to mock OmniAuth so we don't try to connect directly to GitHub
1. Simulate a session which will set up the `auth_hash` for use in testing the login process in the `SessionsController`
1. Simulate sessions for logged-in users and guest users to test other controller actions

#### Test Setup
Tests shouldn't be dependent on external objects or network connections in order to run. We know that when we implemented OAuth using the OmniAuth gem that we have introduced a dependency on Github.

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

    # The mock_auth configuration allows you to set per-provider (or default) authentication
    # hashes to return during testing.
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github', uid: '123545', info: { email: "a@b.com", name: "Ada" }
      })
  end
end
```

The above code will populate the **default** OmniAuth request data hash with the information that you have provided here. This is especially useful and necessary when you are testing controller actions that may require a user to be logged in. This is mock data which should match what we may expect to see from the _real_ `auth_hash` we'll get back from GitHub. This is setting up the **default** data and nothing more. We'll need to _use_ this data in our tests in the next step.

#### Session Tests

First, let's create a method which will allow us to log in using the default OmniAuth data that we just configured.

```ruby
# sessions_controller_test.rb
describe SessionsController do
  def login
    open_session do |sess|
      sess.get auth_github_callback_path, env: { # using our app's callback route
        'omniauth.auth' => OmniAuth.config.mock_auth[:github] # using the configuration we added above
      }
    end
  end
end
```

There is a lot of new syntax here, but the idea is that we are creating a new session specifically for this user. The `login` method will return this session to the caller (which will be our test) and then we can use this session variable to create our assertions like we've done in other controller tests.

Then you can test your session controller like this:

```ruby
# sessions_controller_test.rb
...
  it "can create/login a user" do
    user_session = login       # calling the method we just created
    user_session.must_redirect_to root_path
    user_session.flash[:success].must_equal "Logged in successfully!"
  end
```

The main difference you'll notice with this assertion is that we are now using the dot notation to call the `must_redirect_to` and retrieve the `flash`. This is because the login action is now tied to a specific user's session and the general request that we tied onto before is no longer available.

We can extend this further to assert that upon initial login, this action will create a new user in the database.
```ruby
# sessions_controller_test.rb
...
  it "can create/login a user" do
    proc {
      user_session = login       # calling the method we just created
      user_session.must_redirect_to root_path
      user_session.flash[:success].must_equal "Logged in successfully!"
    }.must_change 'User.count', 1
  end
```

Another test we may want to add is an assertion that it will not create a new user when a user is logging in for a second time.
```ruby
# sessions_controller_test.rb
...
  it "doesn't create a new user on repeat login" do
    proc {
      first_session = login   # throwaway variable
      second_session = login
      second_session.must_redirect_to root_path
    }.must_cange 'User.count', 1  # will increase by only one from the first login
  end
```

**Question**: How might we extend our `login` method to allow us to specify our own data in the auth hash instead of just the default?

#### Controller Tests

Now that we've verified that our sessions controller works as expected, we want to take a look at our existing controller tests. Right now, all of the tests we wrote prior to implementing the sessions controller are broken because we are not allowing those actions to happen until the user has logged in.

Now we want to have two different sections (`describe` blocks) of tests: one for the logged-in user functionality and one for the guest user functionality.

```ruby
# books_controller_test.rb
...
describe "Logged in user actions" do
  # most of our existing tests go here since they
  # assume a logged-in user
end

describe "Guest user actions" do
  # we allow only the book index page for our guest users
  # so we'll want to verify the redirect to root and message for these
end
```

##### Logged In Users
Let's start with the logged in user actions section. We want to simulate the session in the same way we did for our session tests using the `login` method, and use our existing assertions to ensure that the behavior is the same.

```ruby
# books_controller_test.rb
...
  describe "Logged in user actions" do
      def login
        open_session do |sess|
          sess.get auth_github_callback_path, env: {
            'omniauth.auth' => OmniAuth.config.mock_auth[:github]
          }
        end
      end

      before do
        @session = login
      end
    ...
  end
```

Now, within our existing tests, we'll want to use the `@session` variable to reference our session. This will ensure that we're testing the full integration now with the logged-in user.

Here is one example of the updated test:
```ruby
# books_controller_test.rb
...
      it "should show one book" do
        @session.get book_path(books(:venetia).id)
        @session.must_respond_with :success
      end
```

##### Guest Users
Using controller testing syntax we've learned before, we can write tests to ensure we can see the books index page. A potentially more interesting test will verify that when attempting to view a page that the user is not authorized to view, our application will redirect and show a message to the user.

Here is one example of that type of test:
```ruby
# books_controller_test.rb
...
  describe "Guest user actions" do
      it "should not allow you to see books details if not logged in" do
        get book_path(books(:POODR).id)
        # if they are not logged in they cannot see the resource and are redirected to login.
        must_redirect_to root_path
        flash[:warning].must_equal "You must be logged in to view this page"
      end
    ...
  end
```

## Additional Resources
- [OmniAuth Integration Testing](https://github.com/omniauth/omniauth/wiki/Integration-Testing)
- [Integration Testing Docs](http://api.rubyonrails.org/classes/ActionDispatch/IntegrationTest.html)
