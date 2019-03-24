# Intro to Testing Responses in Controllers: Testing the `index` Action

Controller tests are all about how your website responds to the user. This includes a friendly user doing what they should, a curious user banging into things, and a malicious user trying to break your site. This makes it a little different from the testing we've seen before.

## Learning Goals
- Identify the matchers we can utilize with controllers
- Setup controller tests with HTTP verb and action
- Use parameters in controller tests
- Understand what sort of functionality ought to be covered by a controller test

## Controller Testing Tools
Controller tests are all about verifying all the pieces of a Rails application work together for realistic user workflows. This means we need to be able to send requests from our tests, and to check the responses. To do this, we need a bit of extra testing infrastructure.

There are several helper methods that let us send requests from our controller tests. They look like this:

```ruby
get books_path
```

There is a helper method for each HTTP verb, and each helper method takes the path as an argument. Every controller test we write will call at least one of these helper methods (this is the _Act_ step of the test).

Rails controller tests also add several new expectations to use:

1. Testing for a correct HTTP status code in response
1. Testing that a controller redirects correctly

First, we have a matcher used to check the response of the controller.  Each of these response types correspond to an HTTP status code.

```ruby
must_respond_with :success
must_respond_with :redirect
must_respond_with :missing
must_respond_with :error
```

Next, we have a redirect matcher. This indicates that a controller action should be redirecting the browser to another location.


```ruby
must_redirect_to "/"
must_redirect_to root_path
must_redirect_to controller: 'post', action: 'index'
```

**Question:**  What is one example of a controller action that commonly redirects the user?

## Testing the `index` action

The index action takes the following inputs.
-   A get HTTP verb and a path

And it should respond with:
-   An HTTP response code of 200 ok
-   A rendered view

For our Ada-Books application we could write the test as:

```ruby
describe BooksController do
  it "should get index" do
    get books_path
    must_respond_with :success
  end
end
```
Notice that we are **not** testing the body content of the response.  The particular HTML page in the response is likely to change and is difficult and expensive to test.  Instead controller tests focus on the bigger picture including response code, and changes to the database.

## Nominal Cases & Edge Cases for `index`

For the `index` action, we will guide you all to consider writing the following tests for the `index` action:

- Nominal case: check that the response is with the HTTP response code of 200 ok
- Edge case: if the view for the `index` action relies on any variables, check that if those variables are `nil` or empty, then it still responds with the status code you expect. For example, in the Books app, if the `index` action is going to show a view that displays all books defined in `@books`, and that the controller _isn't_ supposed to break if `@books` is empty, be sure to test that.
  - Alternatively, if the controller is supposed to _redirect_ in certain cases, be sure to test that.

## Rails Matchers

For your reference, here are the most common matchers we will use for controller tests:

|   Matcher	|   Sample	|
|---	|---	|
|   `must_respond_with`	|   `must_respond_with :success`	|
|   `must_redirect_to`	|   `must_redirect_to root_path`

### Testing The Show, Edit & New Actions

In the `show` action we will call the method with a `get` http verb, and a path including the id of a model instance in the database.  We should expect to see a response of `success`, if the instance is in the database, and a 404 or `:not_found` if the item is not.

**Exercise** Write 2 tests for the `show` action in our Ada Books Rails application.

Once you have finished you can see a solution [here.](code_samples/show_controller_test.rb)

**Exercise** With your neighbor discuss how many and what tests should the `edit` and `new` actions include.

You can see completed tests for `new` and `edit` actions [here.](code_samples/edit_new_controller_tests.rb)

## Summary

In this lesson we investigated:
- Controllers take in several inputs including:
  - An HTTP Verb
  - A path
  - A request body
- We can test a controller against all these inputs and verify the following outputs:
  - HTTP Status code

## Resources
-  [The Rails Guide on Testing: Controllers](http://guides.rubyonrails.org/testing.html#functional-tests-for-your-controllers)
-  [Testing Assertions](http://api.rubyonrails.org/classes/ActiveSupport/Testing/Assertions.html)
-  [Minitest Cookbook](https://chriskottom.com/minitestcookbook/)
-  [Minitest-Rails](https://github.com/blowmage/minitest-rails)
