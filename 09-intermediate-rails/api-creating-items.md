# Creating items in a Rails API

## Learning Goals

Students should be able to...

- Compare testing a Rails API with a Rails website
- Test API response body & response codes
- Identify edge cases in testing an API endpoint

### Introduction

Earlier we learned to create API endpoints and display model details.  Now we will write code to perform the Create action.

## What do we want to happen

With a partner answer the following questions:

- Do we need `new` action for our API?
- When we create a new Pet, what should be returned? 
  - response code
  - JSON
- How do we send data to an API?

<details>
  <summary>Answers here</summary>

- We do <em>not</em> need a new action (only a create action) because we don't need a web-based form.
  
- The response code should be a 201 - created, if we can create the pet and a 400 - bad request if we cannot.

- We will decide to respond with just the new pet's id.  We could decide to return the entire pet, but instead we'll just return the id field.

- If we cannot create the pet, we should respond with the validation error messages.

- Data is sent in JSON format by the caller

</details>


## Testing a Post Request

In our API we can make a post request similar to our previous create actions

```ruby
  # pets_controller_test.rb
  describe "create" do
    let(:pet_data) {
      {
        pet: {
          age: 13,
          name: 'Stinker',
          human: 'Grace'
        }
      }
    }
    it "can create a new pet" do
      expect {
        post pets_path, params: pet_data
      }.must_differ 'Pet.count', 1

      must_respond_with :created
    end
  end
```

As before, the big difference from a web app is in what we send back. While in a web app we would probably redirect the client to the resource they created, that doesn't make sense for an API. Instead, we just send back some JSON containing the created pet's id, as well as the appropriate status code.

### Cross-Site Request Forgery (CSRF)

**ALERT!** Rails is built with CSRF protection which essentially prevents malicious requests. You might remember seeing notes in passing about this in our forms curriculum, where we had to explicitly add an _authenticity token_ to each form.

If we don't do this in an API application, we might need to modify our code if we wanted to serve both API (JSON) and browser requests (HTML).

You can [read more about CSRF](http://guides.rubyonrails.org/security.html#cross-site-request-forgery-csrf) in the Rails documentation.

### Creating A Resource

We can now write our `create` method to make this test pass!

```ruby
  # pets_controller.rb
  def create
    pet = Pet.new(pet_params)

    if pet.save
      render json: pet.as_json(only: [:id], status: :created)
      return
    else
      # Do something else
    end
  end
```

### Sending POST Data Via Postman

While we could use our browser to exercise the `index` and `show` endpoints, sending data to our API is a little trickier. For this, we'll use Postman.  Start up your rails server first!

First, the setup. Select `POST` from the list of verbs and type in your endpoint's URI. Then, in the `Headers` tab, add a new key-value pair: `Content-Type` -> `application/json`. Postman should try to autocomplete these fields for you.

![Setting up a Postman POST](images/10-creating-apis/Postman-POST-settings.png)

Next, the data. Click the `Body` tab, select `raw`, and enter your JSON data in the text area.

**NOTE** Notice the Response Type is shown in the orange drop-down to be **JSON**.

![Adding data to a Postman POST](images/10-creating-apis/Postman-POST-data.png)

Click send, and see what the new pet ID is.

### Handling Errors

So far our pet creation endpoint assumes everything goes swimmingly, but this won't always be the case. For example, our Pet model has some validations - what happens if they fail? What should we send back to the client?

We need to make sure we set an appropriate status code - `:bad_request` will do nicely. It would also be polite to send back some information about what went wrong.  Remember how weird it was that Slack always sends back a 200 - OK response?  We will do better and send an appropriate response code to conform to standards and so automated systems will understand our response better.

We can set up our tests as:

```ruby
  # pets_controller_test.rb
it "will respond with bad_request for invalid data" do
  # Arrange - using let from above
  pet_data[:pet][:age] = nil

  expect {
    # Act
    post pets_path, params: pet_data

  # Assert
  }.wont_change "Pet.count"

  must_respond_with :bad_request

  expect(response.header['Content-Type']).must_include 'json'
  body = JSON.parse(response.body)
  expect(body["errors"].keys).must_include "age"
end
```

In this test we checked for the proper response code, content type and verified that the proper validation error, or at least the field, is identified in the response.  We could also check the exact content of the response to verify the validation message and format.

Now we need to make the dern thing pass.

```ruby
  # pets_controller.rb
  def create
    pet = Pet.new(pet_params)

    if pet.save
      render json: pet.as_json(only: [:id), status: :created
      return
    else
      render json: {
        ok: false,
        errors: pet.errors.messages
      }, status: :bad_request
      return
    end
  end
```

## Optional - DRYing up our tests

Looking at our tests we have a lot of duplicated code.  We're doing a few things a lot including:

1. Checking for a response code
1. Checking for the proper response type (JSON)
1. Checking for the body of the response to be the proper type (array or hash)
1. Parsing the body of the request

So we can create a helper method & a constant:

```ruby
  # pets_controller_test.rb
  PET_FIELDS = %w(id age name human).sort

  def check_response(expected_type:, expected_status: :success)
    must_respond_with expected_status
    expect(response.header['Content-Type']).must_include 'json'

    body = JSON.parse(response.body)
    expect(body).must_be_kind_of expected_type
    return body
  end
```

We can now call this method in our tests, eliminating a great deal of duplicated code.  Using this method in our index actions would result in:

```ruby
# pets_controller_test.rb
describe "index" do
    it "responds with JSON and success" do
      # Act
      get pets_path

      # Assert
      check_response(expected_type: Array)
    end

    it "responds with an array of pet hashes" do
      # Act
      get pets_path

      # Assert
      body = check_response(expected_type: Array)

      body.each do |pet|
        expect(pet.keys.sort).must_equal PET_FIELDS
      end
    end

    it "will respond with an empty array when there are no pets" do
      # Arrange
      Pet.destroy_all

      # Act
      get pets_path

      # Assert
      body = check_response(expected_type: Array)
      expect(body).must_equal []
    end
  end
```

**Project Challenge**  Dry up your create and show tests using a similar method.

## What Have We Accomplished?

- Built an _API_ - a web server that serves JSON for machines rather than HTML for humans
- Read client data and used it to create a new resource
- Handled errors in a polite and helpful manner

You can find a completed [ada-pets](https://github.com/AdaGold/ada-pets/tree/solution) project on the Ada pets solution branch.

## Resources

- [`.as_json` documentation](http://api.rubyonrails.org/classes/ActiveModel/Serializers/JSON.html#method-i-as_json)
- [ActiveModel Serializers](http://railscasts.com/episodes/409-active-model-serializers)
- [blog post by thoughtbot about serialization](http://robots.thoughtbot.com/better-serialization-less-as-json)
- [Rails API Development Guide](http://edgeguides.rubyonrails.org/api_app.html)
- [Testing a Rails API](https://www.learnhowtoprogram.com/rails/building-an-api/testing-a-rails-api)
