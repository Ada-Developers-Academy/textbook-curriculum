# Testing Authentication

## Learning Goals:
- Set up your Rails app for testing
- Determine what you should test

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
