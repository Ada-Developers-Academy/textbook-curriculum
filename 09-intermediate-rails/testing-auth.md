# Testing Authentication

## Learning Goals:
- Better understand integration tests
- Know how to simulate a multi-request browser session in your tests
- Understand some useful tests for login and logout functionality
- Know how to setup OmniAuth for testing
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

This is a natural dichotomy because controllers, when following the "heavy model, light controller" approach, are mostly "glue" between models and views. If you try to strip them of their entire context, as you should with a unit test, it quickly becomes clear that there's nothing much to test.

So instead we create integration tests which _use_ the controller actions we've defined, but also involve testing additional code from the models and routes.

### How to use integration tests in Rails
Because our integration tests are going to run code from all areas of our Rails app (models, views, controllers, and routes), we need to write our tests from the "perspective" of something outside of those areas.

Specifically, we need to write our integration tests _in the role of the browser_. That is, our integration tests simulate a browser accessing our site by making HTTP requests to the server. Just like the browser, our test code is limited to making those requests and asserting various things about the response received back.

#### Testing Authentication
Unit tests should always mock objects not actively being tested. More so, tests shouldn't be dependent on external objects or network connections in order to run.

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

The above code will populate the OmniAuth request data hash with the information that you have provided here. This is especially useful and necessary when you are testing controller action that may require a user to be logged in.

#### In your Test-cases

Then you can test your session controller like this:

```ruby
  def login_a_user
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
    get :create,  {provider: "github"}
  end

  test "Can Create a user" do
    assert_difference('User.count', 1) do
      login_a_user
      assert_response :redirect
      assert_redirected_to root_path
  	end
  end

  test "If a user logs in twice it doesn't create a 2nd user" do
    assert_difference('User.count', 1) do
      login_a_user
    end
    assert_no_difference('User.count') do
      login_a_user
      assert_response :redirect
      assert_redirected_to root_path
    end
  end
```

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
