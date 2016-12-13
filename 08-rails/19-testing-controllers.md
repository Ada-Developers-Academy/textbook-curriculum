# Unit Testing Controllers
## Learning Goals
- Identify the assertions we can utilize with controllers
- Setup controller tests with HTTP verb and action
- Use parameters in controller tests
- Utilize fixture data to populate parameters
- Understand what sort of functionality ought to be covered by a controller test

### Assertions
In controller tests, you have several new assertions to use.

First, we have the set of responses. These are used to determine what type of response the controller method sent. Each of these response types correspond to the HTTP status codes.
```ruby
assert_response :success
assert_response :redirect
assert_response :missing
assert_response :error
```

Next, we have the redirect assertions. This indicates that a controller action should be redirecting to another location. What is one example of a redirect in a controller action we have seen before?
```ruby
assert_redirected_to "/"
assert_redirected_to root_path
assert_redirected_to { controller: 'posts', action: 'index' }
```

Next, is the template assertion. This ensures that the appropriate template has been rendered. This is good for controller actions whose primary goal is to show a view.
```ruby
assert_template 'posts/index'
assert_template partial: '_customer', count: 2
```

Last is a way to ensure that the controller action appropriately changes the related model. We'll see some examples for exactly how this works in a bit.
```ruby
assert_difference('Post.count', -1) do
  # Controller here that would delete something
end
```

### Test Setup
First, we need to execute the controller action that we would like to test. We use the verb along with the controller action to execute the controller.

```ruby
class StudentsControllerTest < ActionController::TestCase
  test "should get the new form" do
    get :new
  end
end
```

Next, we need to use one (or more) of the assertions to ensure that the controller action executed as expected.
```ruby
class StudentsControllerTest < ActionController::TestCase
  test "should get the new form" do
    get :new
    assert_response :success
    assert_template :new
  end
end
```

Now you try it! Try setting up the next test for the `edit` action.

### Test Setup with Params
When we create the controller actions, oftentimes they contain information that comes from the `params` hash, with data populated from the routes or forms. In order to appropriately test controllers, we must "mock" this information.

Let's refresh our memory with a controller action:
```ruby
def show
  @student = Student.find(params[:id])
end
```

In this case, we need to provide a key of `id` with a corresponding value. We specify this in a hash to correspond to `params` along with the verb and action.

We start our test in the same way we have previously seen:
```ruby
# test/controllers/students_controller_test.rb
class StudentsControllerTest < ActionController::TestCase
  test "load show with given student" do
    get :show, { id: 1 }
  end
end
```

Then, we should add the assertions that ensure the show view is loaded successfully.
```ruby
# test/controllers/students_controller_test.rb
class StudentsControllerTest < ActionController::TestCase
  test "load show with given student" do
    get :show, { id: 1 }
    assert_response :success
    assert_template :show
  end
end
```

### Test Setup with Fixtures
The problem with the test above is that it is using a hard-coded value for the `id`. We used fixtures with our model testing to ensure that we aren't relying on any specific data in the database. We should do the same for our controller tests.

Let's assume that we have some fixture data set up.
```ruby
one:
  first_name: Ada
  last_name: Lovelace
```

We can now utilize this fixture data within our test to ensure the data is valid.
```ruby
# test/controllers/students_controller_test.rb
class StudentsControllerTest < ActionController::TestCase
  test "load show with given student" do
    get :show, { id: students(:one).id }
    assert_response :success
    assert_template :show
  end
end
```

### Test the Difference
We have model tests to ensure that models act the way we anticipate. Oftentimes controllers still create, and delete model objects, so we can check these types of changes in controller tests.

What is a type of controller action that would affect the number of Model objects? Create!

Let's see how a post test would look:
```ruby
test "should create an entity" do
  post_params = { student: { first_name: "Grace", last_name: "Hopper" }}
  post :create, post_params
end
```

We must have appropriate parameters that would match up with parameters that would be populated from the form. These parameters must be passed along with the request.

The successful create action should redirect to the index view, so we should update our test to assert that:
```ruby
test "should create an entity" do
  post_params = { student: { first_name: "Grace", last_name: "Hopper" }}
  post :create, post_params
  assert_redirect_to students_path
end
```

Next, we can check that the count of model object has changed by 1 using the `assert_difference` matcher. For this assertion, in the first parameter, you put the expression that you would like to evaluate before and after the block you specify. In the second parameter, you can put a numeric value indicating how you expect the expression to change.

```ruby
test "should create an entity" do
  assert_difference('Student.count', 1) do
    post_params = { student: { first_name: "Grace", last_name: "Hopper" }}
    post :create, post_params
  end

  assert_redirect_to students_path  
end
```

### What Kind of Thing Should You Test in the Controller?
Controller tests are all about how your website responds to the input a user might give it. This includes a friendly user doing what they should, an idiot user banging into things, and a malicious user trying to break your site. This makes it a little different from the testing we've seen before.

Exactly what's worth testing will come with time, but here are some general guidelines.
- If your controller action reads a Model ID from the URL, you need at least 2 cases:
  - The ID corresponds to a model in the DB
  - The ID is not found in the DB
- If your controller action reads form data and creates a model object, you need at least 2 cases:
  - The data was valid
  - The data was bad and validations failed
- If your controller action reads something like a user ID from the session (we'll talk about this soon), you need 2 or more cases:
  - Someone is logged in
  - No one is logged in
  - If the action touches a Model that belongs to the user, then you also need to test when the wrong user is logged in

That's not an exhaustive list, but it's a good starting point.

In general, controller tests should operate at a higher level than Model tests. For example, while in Model testing you need 2 or more test cases for every validation, when testing the corresponding Controller you only need to test the case where all validations pass, and the case where one or more fail, since those are the two different behaviors you Controller action can exhibit. You do, however, need to test both those cases for both the `create` and `update` actions.

## Resources
[The Rails Guide on testing: Controllers](http://guides.rubyonrails.org/testing.html#functional-tests-for-your-controllers)  
[Testing Assertions](http://api.rubyonrails.org/classes/ActiveSupport/Testing/Assertions.html)  
