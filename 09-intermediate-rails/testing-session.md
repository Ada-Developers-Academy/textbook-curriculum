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
<b>Question:</b> If we can't modify `session` directly from our tests, how can we test controller actions that require the user to log in?
</summary>

Just like the browser, our tests will send two requests:
- One to log in as part of the _arrange_ step
- One to the action we're interested in in the _act_ step
</details>

Note that we can *read* `session` and `flash` *after* a request has been sent, to check they were filled in correctly. It is only attempting to *set* them from a controller test that Rails disallows.

