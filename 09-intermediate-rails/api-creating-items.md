# Testing A Rails API

## Learning Goals
Students should be able to...

- Compare testing a Rails API with a Rails website
- Test API response body & response codes
- Identify edge cases in testing an API endpoint


### Introduction
Earlier we learned to create API endpoints.  Now we will write controller tests for those endpoints.

When testing a normal controller, we normally do **not** test the body of the response, because HTML and styling often change.  However an API endpoint should return consistently formatted JSON data.  Therefore we will write tests to verify the body of the response!


## Testing the `get '/pets'` endpoint

First we will write a test to verify that the route works.  This test should look mostly familiar:

```ruby
it "is a real working route and returns JSON" do
  # Act
  get pets_path

  # Assert
  expect(response.header['Content-Type']).must_include 'json'
  must_respond_with :success
end
```

Notice the `response.header['Content-Type']` in the test above.  When your test makes an HTTP request, it gets back an object named `response`, which contains the full response from the controller, including the header, body, etc.  In a normal controller this would include the HTML, as well as the full header.

By checking the `Content-Type` field in the response header, we can verify that Rails is telling the client that JSON is being returned.

### Testing The Response Body

We can now test the body of the response.

```ruby
it "returns an Array" do
  # Act
  get pets_path

  # Convert the JSON response into a Hash
  body = JSON.parse(response.body)

  # Assert
  expect(body).must_be_kind_of Array
end

it "returns all of the pets" do
  # Act
  get pets_path

  # Convert the JSON response into a Hash
  body = JSON.parse(response.body)

  # Assert
  expect(body.length).must_equal Pet.count
end

it "returns pets with exactly the required fields" do
  keys = %w(age human id name)

  # Act
  get pets_path

  # Convert the JSON response into a Hash
  body = JSON.parse(response.body)

  # Assert that each
  body.each do |pet|
    expect(pet.keys.sort).must_equal keys
    expect(pet.keys.length).must_equal keys.length
  end
end
```

In the tests above we verify that the JSON response contains an array with the proper number of elements, and that each element of the array is a JSON hash with the required fields.

## Exercise:  Write tests for the show action

Now with your partner, write tests for the `show` action.  If you get stuck you can find a solution [here](./code_samples/pet_controller_test.rb).

**Question:** What tests would you need to write for the `create` action?  Check with a partner and then review the tests written [here](./code_samples/pet_controller_test.rb).

## Summary

We have introduced controller testing for an API application.  In a controller test for an API, you can also test the body of the response and verify the expected data is being transmitted.  We also used the `JSON.parse` method to convert the JSON object into a Ruby Hash object.

## Resources
- [Testing a Rails API](https://www.learnhowtoprogram.com/rails/building-an-api/testing-a-rails-api)
