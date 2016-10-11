# Unit Testing Controllers
## Learning Goals
- Identify the assertions we can utilize with controllers
- Setup controller tests with HTTP verb and action
- Use parameters in controller tests
- Utilize fixture data to populate parameters

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
assert_redirect_to "/"
assert_redirect_to root_path
assert_redirect_to { controller: 'posts', action: 'index' }
```

Next, is the template assertion. This ensures that the appropriate template has been rendered. This is good for controller actions whose primary goal is to show a view.
```ruby
assert_template 'posts/index'
assert_template partial: '_customer', count: 2
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

## Resources
[The Rails Guide on testing: Controllers](http://guides.rubyonrails.org/testing.html#functional-tests-for-your-controllers)  
