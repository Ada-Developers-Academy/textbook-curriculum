# Testing Session

Our controller tests up to this point have followed a pattern: send one request, and verify that the server did the right things. With the introduction of `session` our controllers have become more complex, and our strategy for controller testing must evolve as well.

## Learning Goals

By the end of this lesson, students should be able to...

- Write controller tests for a user workflow that spans multiple request/response cycles
- Define helper methods for tests

## Review: Controller Tests in Rails

When we write controller tests in Rails, we do so _in the role of the **browser**_. That is, our controller tests simulate a browser accessing our site by making HTTP requests to the server. Just like the browser, our test code is limited to making those requests and asserting various things about the response received back.

In particular, this means we cannot modify the `session` or `flash` directly from our tests, since the data stored there is supposed to be opaque to the browser.

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

## Creating a Helper Method

Seeing the details page for the current user is the only workflow in our books app that currently requires multiple request/response cycles to complete. However, we could imagine adding many restrictions about things that can only be done by a logged-in user, or by a specific user.

Every test case for these workflows would need to repeat this work of logging in the user before getting down to business. This work would be spread across different `describe` blocks and possibly even different test files, making DRYing up this code a challenge. Using a `before` block to organize them isn't going to cut it.

Instead, we can add a helper method to our code. Rails provides a convenient place for us to do this: `test/test_helper.rb`. We will move our login code to an instance method inside of `class ActiveSupport::TestCase`.

```ruby
# test/test_helper.rb

# ...
# Test setup stuff - don't touch this
# ...

class ActiveSupport::TestCase
  # ...
  # Keep anything that was here before
  # ...

  # Here's the code we're adding
  def perform_login(user = nil)
    user ||= User.first

    user = User.first
    login_data = {
      user: {
        username: user.username,
      },
    }
    post login_path, params: login_data

    # Verify the user ID was saved - if that didn't work, this test is invalid
    expect(session[:user_id]).must_equal user.id

    return user
  end
end
```

<details>
<summary>
<strong>Question:</strong> This code is a little different than our original version. What changed? Why might we have done it this way?
</summary>

Our helper method takes an optional user, to allow the caller to specify who they want to log in as. If no user is provided, it will pick one from the database. It also returns the user, in case the caller that information.
</details>

Now that we've written our helper we can shorten and clarify our test for `users#current`:

```ruby
it "returns 200 OK for a logged-in user" do
  # Arrange
  perform_login

  # Act
  get current_user_path

  # Assert
  must_respond_with :success
end
```

## Summary

- When we write controller tests in Rails, we do so from the perspective of the browser
    - We cannot set `session` or `flash` directly
    - We can _read_ this data after it has been set by a controller action
- If a user workflow requires multiple request/response cycles to complete, our tests for that workflow must send multiple requests
- It is often useful to extract repeated test code like logging in to a helper method
    - These helper methods should be added to `test/test_helper.rb`