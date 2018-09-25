# Unit Testing Controllers
## Learning Goals
- Identify the matchers we can utilize with controllers
- Setup controller tests with HTTP verb and action
- Use parameters in controller tests
- Utilize fixture data to populate parameters
- Understand what sort of functionality ought to be covered by a controller test


## What Kind of Thing Should You Test in the Controller?
Controller tests are all about how your website responds to the user. This includes a friendly user doing what they should, a curious user banging into things, and a malicious user trying to break your site. This makes it a little different from the testing we've seen before.

### Controller Inputs & Outputs

One thing to consider is what inputs do controller actions take.  These inputs include:

-   HTTP Verb & Path (the route)
-   The request body, including any form values
-   Cookie settings (session, to be discussed later)
-   The current state of the database

The controller will then run and provide the following outputs:

-   An HTTP Response code such as 200 OK, 404 Not Found, redirect, etc
-   Cookie settings (session & flash)
-   Changes to the databse

![Controller inputs & Outputs](images/TestingControllers2.png)

<!-- Image source:  https://www.draw.io/#G1eHnA4Fko9GRA8wi5fwHs66UKKJv-C_Gz -->

So when we test the controller we will provide the given inputs and verify that controller responds with the correct response code, cookie settings and database changes.

Exactly what's worth testing depends on your site, but here are some general guidelines.
- If your controller action reads a Model ID from the URL, you need at least 2 cases:
  - The ID corresponds to a model in the DB
  - The ID is not found in the DB
- If your controller action reads form data and creates a model object, you need at least 2 cases:
  - The data was valid
  - The data was bad and validations failed
- If your controller action reads something like a user ID from the session (we'll talk about this soon), you need 2 or more cases:
  - Someone is logged in
  - No one is logged in
  - If the action touches a Model that belongs to a user, then you also need to test when the wrong user is logged in

That's not an exhaustive list, but it's a good starting point.

In general, controller tests should operate at a higher level than Model tests. For example, in Model testing you need 2 or more test cases for every validation.  When testing the corresponding Controller you only need to test the case where all validations pass, and the case where one or more fail, since those are the two different behaviors your Controller action can exhibit. You do, however, need to test those cases for both the `create` and `update` actions.

## So that's what I test, now how do I write them?

### Expectations
In controller tests, you have several new expectations to use:
1. Testing for a correct HTTP status code in response
1. Testing that a controller redirects correctly
1. Testing that a model is updated

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


## Testing the index action

The index action takes the following inputs.
-   A database
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
Notice that we are **not** testing the body content of the response.  The particular HTML page in the response is likely to change and will not be tested.  Instead controller tests focus on the bigger picture including response code, and changes to the database.

### Testing The Show, Edit & New Actions

In the `show` action we will call the method with a `get` http verb, and a path including the id of a model instance in the database.  We should expect to see a response of `success`, if the instance is in the database, and a 404 or `:not_found` if the item is not.

**Exercise** Write 2 tests for the `show` action in our Ada Books Rails application.

Once you have finished you can see a solution [here.](code_samples/show_controller_test.rb)

**Exercise** With your neighbor discuss how many and what tests should the `edit` and `new` actions include.

You can see completed tests for `new` and `edit` actions [here.](code_samples/edit_new_controller_tests.rb)


## Testing Database Changes


Lastly, we must ensure that the controller action appropriately changes the related model for the `destroy`, `create` and `update` actions.  We'll see how to use the `must_change` matcher with some examples later on.

The sample below illustrates testing the `destroy` action and verifies that the database reduces the number of records by one.

```ruby
describe "destroy" do
  it "can destroy a model" do
    id = books(:poodr).id

    expect {
      delete book_path(id)
    }.must_change 'Book.count', -1

    must_respond_with :success
  end
end
```

**Question** What other test(s) should we write for the `destroy` action?

### Sending form params in a controller test

Remember that when we submit a form using `form_with` Rails recieves the data as a sub-hash in params.  For our test we can pass such a hash into the request body like this:

```ruby
describe "create" do
  it "can create a book" do
    book_hash = {
      book: {
        title: 'A Wrinkle in Time',
        author_id: authors(:metz).id,
        description: 'A fabulous adventure'
      }
    }

    expect {
      post books_path, params: book_hash
    }.must_change 'Book.count', 1

    must_respond_with  :redirect

    expect(Book.last.title).must_equal book_hash[:book][:title]
    expect(Book.last.author_id).must_equal book_hash[:book][:author_id]
    expect(Book.last.description).must_equal book_hash[:book][:description]
  end
end
```

The example above illustrates that the test can pass in a mock-params hash into the request with the `params: params_hash` argument.  Notice we verify that the number of books in the database increases and that the last book in the database has the correct title, author and description.

**Exercise** You also need to create a test in which the params are invalid, violating validations.  With a partner write another test in which the params are invalid.  You can see an example [here.](code_samples/create_controller_test.rb)

**Exercise** Similar to the `create` action tests, write tests to verify the correctness of the `update` action.  You can find a solution[here.](code_samples/update_controller_test.rb)

**Exercise** Now write tests for the `update` action.  You should have at least 3 tests. You can see a solution [here.](code_samples/update_controller_tests.rb) **Question**: Why 3 tests?

## Summary

In this less we investigated:
-   Controllers take in serveral inputs include:
  - An HTTP Verb
  - A path
  - A request body
  - An Existing Database
-   We can test a controller against all these inputs and verify the following outputs:
  - HTTP Status code
  - Cookie changes (flash & session)
  - Database changes


## Rails Matchers

|   Matcher	|   Sample	|
|---	|---	|
|   `must_respond_with`	|   `must_respond_with :success`	|
|   `must_redirect_to`	|   `must_redirect_to root_path`	|
|   `must_change`	|   `proc {delete post_path(posts(:post_a).id) }.must_change 'Post.count', -1`	|


## Resources
-  [The Rails Guide on Testing: Controllers](http://guides.rubyonrails.org/testing.html#functional-tests-for-your-controllers)
-  [Testing Assertions](http://api.rubyonrails.org/classes/ActiveSupport/Testing/Assertions.html)
-  [Minitest Cookbook](https://chriskottom.com/minitestcookbook/)
-  [Minitest-Rails](https://github.com/blowmage/minitest-rails)
