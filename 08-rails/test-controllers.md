# Unit Testing Controllers
## Learning Goals
- Identify the matchers we can utilize with controllers
- Setup controller tests with HTTP verb and action
- Use parameters in controller tests
- Utilize fixture data to populate parameters
- Understand what sort of functionality ought to be covered by a controller test


## What Kind of Thing Should You Test in the Controller?
Controller tests are all about how your website responds to the user. This includes a friendly user doing what they should, a curious user banging into things, and a malicious user trying to break your site. This makes it a little different from the testing we've seen before.

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

In general, controller tests should operate at a higher level than Model tests. For example, while in Model testing you need 2 or more test cases for every validation.  When testing the corresponding Controller you only need to test the case where all validations pass, and the case where one or more fail, since those are the two different behaviors your Controller action can exhibit. You do, however, need to test those cases for both the `create` and `update` actions.

## So that's what I test, now how do I write them?

### Expectations
In controller tests, you have several new expectations to use.

First, is a matcher used to check the response of the controller.  Each of these response types correspond to an HTTP status code.

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


Last is a way to ensure that the controller action appropriately changes the related model.  We'll see how to use the `must_change` matcher with some examples later on.

```ruby
proc {
  # run the delete verb on the post_path with a param equal to 1
  delete post_path(1)
}.must_change 'Post.count', -1
```

We still have the existing Minitest matchers, like `must_equal` and `must_be` to use as well.  


### Test Setup
First, we need to execute the controller action that we would like to test. We use the verb along with the path to execute the controller method.

```ruby
describe PostController do
  it "should get index" do
    get post_index_path
  end
end
```

The test starts with executing the controller with, in this case, a get request and a given path.  We could also put `get '/posts'` instead, assuming that our index page was at that path, but using the Rails path helper methods make it more portable and easier to change.  If the paths change the testing code doesn't need to be modified.  

Next, we need to use one (or more) of the expectations to ensure that the controller action executed as expected.

```ruby
describe PostController do
  ...
  it "should get index" do
    get post_index_path
    # Added expectation to verify the HTTP response code
    must_respond_with :success
  end
end
```

**Exercise:** Now you try it! Try setting up the next test for the `new` action on your last project.

### Test Setup with Params
When we create the controller actions, oftentimes they contain information that comes from the `params` hash, with data populated from the routes or forms. In order to appropriately test controllers, we must "mock" this information.

Let's refresh our memory with a controller action:
```ruby
def show
  @post = Post.find(params[:id])
end
```

In this case, we need to provide an `id` to the path helper method. 


```ruby
it "should get show" do
  get post_path(1)
  must_respond_with :success
end
```

Then, we added the expectation to ensure the show view is loaded successfully with `must_respond_with :success`.

### Test Setup with Fixtures
The problem with the test above is that it is using a hard-coded value for the `id`. We used fixtures with our model testing to ensure that we aren't relying on any specific data in the database. We can do the same for our controller tests.

Let's assume that we have some fixture data set up.
```ruby
one:
  title: This is a post on something
  body: La la la la
```

We can now utilize this fixture data within our test to ensure the data is valid.
```ruby
it "should get show" do
  get post_path(post(:one).id)
  must_respond_with :success
end
```

Using `post(:one).id` lets us use data in our fixtures in our test, rather than hard-coding id numbers.  **Exercise:** Write a test for the `edit` action and write it to use fixtures.  Then run `rails test` to make sure it runs properly.  

### Test the Difference

We have model tests to ensure that models act the way we anticipate. Oftentimes controllers create, and delete model objects, so we can check these types of changes in controller tests.

What is a type of controller action that would affect the number of Model objects? **Create!**

Let's see how a test of the create action would look:

```ruby
it "should be able to create a post" do
  post post_index_path, params: { post: {title: "Some post", body: "la la la"}  }
end
```

We must have appropriate parameters that would match up with parameters that would be populated from the form. These parameters must be passed along with the request.

The successful create action should redirect to the index view, so we should update our test to assert that:
```ruby
it "should be able to create a post" do
  post post_index_path, params: { post: {title: "Some post", body: "la la la"} } 
  
  must_respond_with :redirect
  must_redirect_to post_index_path
end
```

So above we executed a post request to the index path and sent a mock of the params hash to provide values simulating what the form would provide.  

Next, we can check that the count of model object has changed by 1 using the `must_change` matcher. For this matcher, in the first parameter, you put the expression that you would like to evaluate before and after the block you specify. In the second parameter, you can put a numeric value indicating how you expect the expression to change.

```ruby
it "should be able to create a post" do
  proc   {
    post post_index_path, params: { post: {title: "Some post", body: "la la la"}  }
  }.must_change 'Post.count', 1
  
  must_respond_with :redirect
  must_redirect_to post_index_path
end
```

We can do a similar test for deleting a model.  **Exercise:** Write a test for a delete/destroy action.  

### Changing a Model

We also want to test actions that modify a model rather than adding or deleting an entry.  So we also need to test update actions.  

We start by creating a test for a put request on a post_path.


```ruby
  it "should update a post" do
    put post_path(posts(:one).id), params: {post: {title: "Some title goes here", description: "la la la"} }
  end
```

So this test case starts by making a put request on a post using a fixture.  

Next we can then verify that the post in the database is changed.

```ruby
it "should update a post" do
  put post_path(posts(:one).id), params: {post: {title: "Some title goes here", description: "la la la"} }
    
  # find the post with that ID in the database
  post = Post.find(posts(:one).id)


     # verify the post was changed properly
  post.title.must_equal "Some title goes here"
  post.description.must_equal "la la la"

  must_respond_with :redirect
end
```

## Rails Matchers

|   Matcher	|   Sample	|
|---	|---	|
|   `must_respond_with`	|   `must_respond_with :success`	|
|   `must_redirect_to`	|   `must_redirect_to root_path`	|
|   `must_change`	|   `proc {delete post_path(posts(:one).id) }.must_change 'Post.count', -1`	|


## Resources
-  [The Rails Guide on Testing: Controllers](http://guides.rubyonrails.org/testing.html#functional-tests-for-your-controllers)  
-  [Testing Assertions](http://api.rubyonrails.org/classes/ActiveSupport/Testing/Assertions.html)  
-  [Minitest Cookbook](https://chriskottom.com/minitestcookbook/)
-  [Minitest-Rails](https://github.com/blowmage/minitest-rails)
