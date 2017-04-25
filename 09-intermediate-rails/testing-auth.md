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
1. Simulate the `auth_hash` for use in testing the login process in the `SessionsController`
1. Simulate a logged-in user for use in testing other controllers which are dependent on a user being logged in

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

There is a lot of new syntax here, but the idea is that we are creating a new session specifically for this user. The `login` method will return this session to the caller (which will be our test) and then we can use this session to create our assertions like we've done in other controller tests.

Then you can test your session controller like this:

```ruby
# sessions_controller_test.rb
...
  it "can create/login a user" do
    user_session = login       # calling the method we just created
    user_session.must_redirect_to root_path
  end
```

The main difference you'll notice with this assertion is that we are now using the dot notation to call the `must_redirect_to`. This is because the login action is now tied to a specific user's session.

We can extend this further to assert that upon initial login that this action will create a new user in the database.
```ruby
# sessions_controller_test.rb
...
  it "can create/login a user" do
    proc {
      user_session = login       # calling the method we just created
      user_session.must_redirect_to root_path
    }.must_change 'User.count', 1
  end
```

Another test we may want to add is an assertion that it will not create a new user when a user is logging in for a second time.
```ruby
# sessions_controller_test.rb
...
  it "doesn't create a new user on repeat login" do
    proc {
      first_session = login
      second_session = login
      second_session.must_redirect_to root_path
    }.wont_change 'User.count'
  end
```

#### Controller Tests

Now that we've verified that our sessions controller works as expected, we want to take a look at our existing controllers that are expecting a logged-in user. We will reuse some of the code we wrote to test the sessions controller to ensure these controller actions are set up correctly.

For these controllers, we can add a `before` block within our

You can test your other controllers which require a user to be logged in like this:


```ruby
  test "If a user is not logged in they cannot see their task." do
    session[:user_id] = nil  # ensure no one is logged in

    get :show, id: tasks(:sample_task).id
    # if they are not logged in they cannot see the resource and are redirected to login.  
    assert_redirected session_path
    assert_equal "You must be logged in first", flash[:notice]
  end
```

In this manner you can write tests to ensure:
-  That a visitor cannot see a protected resource without logging in first.
-  That the user can log in properly
-  That multiple copies of the same user do not enter the database.
-  That the correct message is sent to the visitor when they visit a page for which they do not have access.  
-  That the logout link works properly.

## Additional Resources
- [OmniAuth Integration Testing](https://github.com/omniauth/omniauth/wiki/Integration-Testing)
