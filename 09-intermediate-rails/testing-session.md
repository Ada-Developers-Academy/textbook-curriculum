# Testing Session

Our controller tests up to this point have followed a pattern: send one request, and verify that the server did the right things. With the introduction of `session` our controllers have become more complex, and our strategy for controller testing must evolve as well.

## Learning Goals

By the end of this lesson, students should be able to...

- Verify `flash` and `session` inside a controller test
- Define helper methods for tests
- Write controller tests for a user workflow that spans multiple request/response cycles

## Review: Integration Tests in Rails

Because our integration tests are going to run code from all areas of our Rails app (models, views, controllers, and routes), we need to write our tests from the perspective of something outside of our application.

Specifically, we need to write our integration tests _in the role of the **browser**_. That is, our integration tests simulate a browser accessing our site by making HTTP requests to the server. Just like the browser, our test code is limited to making those requests and asserting various things about the response received back.

In particular, this means we cannot modify the `session` or `flash` directly from our tests. 

<details>
<summary>
<strong>Question:</strong> If we can't modify `session` directly from our tests, how can we test controller actions that require the user to log in?
</summary>

Just like the browser, our tests will send two requests:
- One to log in as part of the _arrange_ step
- One to the action we're interested in in the _act_ step
</details>

Note that we can *read* `session` and `flash` *after* a request has been sent, to check they were filled in correctly. It is only attempting to *set* them from a controller test that Rails disallows.

## Testing the `users#current` Action

<details>
<summary>
<strong>Question:</strong> What different behaviors does the `users#current` action have? What does this tell us about likely test cases?
</summary>

There are 2 behaviors:
- **Success:** If a user is currently logged in, show their details
- **Failure:** If no user is logged in, set a flash message and redirect to the root path

Each of these deserves a test case.
</details>

The failure case doesn't require us to do anything special, so we will focus on the success case, showing details for a logged in user. Our test will follow this pattern:

1. **Arrange:** Select a user from the database, send a request to log in as that user
1. **Act:** Send a request to the `users#current` action
1. **Assert:** Check that the second request completed successfully

```ruby
# test/controllers/users_controller_test.rb
describe UsersController do
  describe "current" do
    it "returns 200 OK for a logged-in user" do
      # Arrange
      user = User.first
      login_data = {
        user: {
          username: user.username
        }
      }
      post login_path, params: login_data

      # Verify the user ID was saved - if that didn't work, this test is invalid
      expect(session[:user_id]).must_equal user.id

      # Act
      get current_user_path

      # Assert
      must_respond_with :success
    end
  end
end
```

As promised, this test makes two requests against the server: the `post` in the _arrange_ step, and the `get` in the _act_ step. We also verify that the `session` was set up correctly after making the `post` request.

<details>
<summary>
<strong>Question:</strong> Even though we're testing after writing this code, it's still worthwhile to make this test fail, to confirm it's really testing something. Is there some line of code we could comment out to watch it fail?
</summary>

The simplest thing to do is to comment out both the `post` request and the following expectation in the _arrange_ step.
</details>
