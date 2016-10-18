# Testing Authentication

## Learning Goals:
- Set up your Rails app for testing
- Determine what you should test

#### Testing Authentication
Unit tests should always mock objects not actively being tested. More so, tests shouldn't be dependent on external objects or network connections in order to run.

To be able to mock the interaction with Github, add this info to the test helper:

```ruby
# /test/test_helper.rb
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
```

The above code will populate the OmniAuth request data hash with the information that you have provided here. This is especially useful and necessary when you are testing controller action that may require a user to be logged in.
