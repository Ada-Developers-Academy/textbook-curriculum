# Creating an API

## Learning Goals

Students should be able to...

- Develop a Rails API to provide CRUD functionality
- Use HTTP status codes to communicate outcomes
- Test get requests in a Rails API application

### Introduction

Previously, we learned how Rails can render JSON and how we can test that JSON response. Now, our goal is to use model data in our JSON response.

## Listing Pets

So currently our controller is responding with:

```ruby
def index
  render json: { ready_for_lunch: "yassss" }, status: :ok
end
```

Our tests are passing.  However we want data on our pets!  So we can add another test to ensure that our controller index action is providing pet data.

```ruby
  # pets_controller_test.rb
  it "responds with an array of pet hashes" do
    # Act
    get pets_path

    # Get the body of the response
    body = JSON.parse(response.body)

    # Assert
    expect(body).must_be_instance_of Array
    body.each do |pet|
      expect(pet).must_be_instance_of Hash
      expect(pet.keys.sort).must_equal ["age", "human", "name"]
    end
  end
```

The test above:

1. Performs a get request to `/pets`
1. Takes the body of the server's response and parses the JSON into regular Ruby arrays and hashes.
1. Ensures that the response is an array
1. Ensures that each response has only the age, human and name fields
    - The age, human and name fields are strings because JSON doesn't know about symbols and returns all the keys as strings.

The test fails and now we can edit our controller to match.  

### Responding With Model Data

So our test wants a list of pets, luckily Rails knows how to convert a model collection into JSON.  Sweet!  We can do so by passing the list of pets into the render method.

```ruby
  # pets_controller.rb
  def index
    pets = Pet.all
    render json: pets, status: :ok
  end
```

Rails converted all the pets into JSON like this:

```json
[{"id":1,"name":"Peanut","age":2,"human":"Ada","created_at":"2019-10-29T21:19:34.854Z","updated_at":"2019-10-29T21:19:34.854Z"},{"id":2,"name":"Horsetooth","age":14,"human":"Grace","created_at":"2019-10-29T21:19:34.857Z","updated_at":"2019-10-29T21:19:34.857Z"},{"id":3,"name":"Beansprout","age":1,"human":"Katherine","created_at":"2019-10-29T21:19:34.859Z","updated_at":"2019-10-29T21:19:34.859Z"}]
```

Very handy!  Our tests are _almost_ passing.  We just need a way to exclude some fields.

So we can adjust our controller:

```ruby
  # pets_controller.rb
  def index
    pets = Pet.all.as_json(only: [:name, :age, :human])
    render json: pets, status: :ok
  end
```

All models in Rails have an `.as_json` method to convert the model data into JSON and this method can be used to limit which fields are returned.

**Question** Why did we use `pets` instead of `@pets` for our variable name?

### Covering the Edges

We can also include a test for when there are no pets in the database:

```ruby
  # pets_controller_test.rb
  it "will respond with an empty array when there are no pets" do
    # Arrange
    Pet.destroy_all

    # Act
    get pets_path
    body = JSON.parse(response.body)

    # Assert
    expect(body).must_be_instance_of Array
    expect(body).must_equal []
  end
```

















## Showing Pet Details
Working with the person next to you, and following the same pattern we used for `index`, implement the `show` endpoint.

Questions to consider:
- How will `show` be different than `index`?
- How will this endpoint be accessed?
  - HTTP verb
  - URI
- What fields should be returned?
- What should the API do if the client asks for a pet that doesn't exist?
  - Status code
  - Response body
- What test cases might be useful for this endpoint?
  - There should be at least one test already in the project but see if you should add more
- How do the two endpoints we've implemented so far compare to similar functionality in a non-API Rails app?

## Creating a New Pet
Now that we can send data via our API, the next step is to consume data sent to us. To demonstrate this, we'll create an endpoint that allows a client to add their own pet to our list.

### Adding a Create Action
Questions:
- What should the URI be for our new endpoint? Why?
- What HTTP verb should it use? Why?
- In a web app, we would need both a `new` action and a `create` action. Do we need both for an API?

For this endpoint, we'll be handling `POST` requests to the `/pets` URI, routing them to `pets#create`. Set up the route and add a stub controller action now, and check your work with `rails routes`.

The `create` action will look very similar to how it would in a web app. Rails provides the data sent by the user via `params`, so we'll pull this data out and use it to create a pet. Remember to use strong params to make sure only the fields you want go through.

```ruby
# app/controllers/pets_controller.rb
def create
  pet = Pet.new(pet_params)
  pet.save!
  render json: { id: pet.id }, status: :ok
end

private
def pet_params
  params.require(:pet).permit(:name, :age, :human)
end
```

As before, the big difference from a web app is in what we send back. While in a web app we would probably redirect the client to the resource they created, that doesn't make sense for an API. Instead, we just send back some JSON containing the ID of the newly created pet as well as the appropriate status code.

### Cross-Site Request Forgery (CSRF)
**ALERT!** Rails is built with CSRF protection which essentially prevents malicious requests. You might remember seeing notes in passing about this in our forms curriculum, where we had to explicitly add an _authenticity token_ to each form.

Since preventing these cross site requests doesn't apply in an API context, we will add a Rails helper method to our controller to allow these `POST` requests to go through:
```ruby
class PetsController < ApplicationController
  protect_from_forgery with: :null_session

  ...
```

You can [read more about CSRF](http://guides.rubyonrails.org/security.html#cross-site-request-forgery-csrf) in the Rails documentation.

### Sending POST Data
While we could use our browser to exercise the `index` and `show` endpoints, sending data to our API is a little trickier. For this, we'll use Postman.

First, the setup. Select `POST` from the list of verbs and type in your endpoint's URI. Then, in the `Headers` tab, add a new key-value pair: `Content-Type` -> `application/json`. Postman should try to autocomplete these fields for you.

![Setting up a Postman POST](images/10-creating-apis/Postman-POST-settings.png)

Next, the data. Click the `Body` tab, select `raw`, and enter your JSON data in the text area.

![Adding data to a Postman POST](images/10-creating-apis/Postman-POST-data.png)

Click send, and see what the new pet ID is.

### Handling Errors
So far our pet creation endpoint assumes everything goes swimmingly, but this won't always be the case. For example, our Pet model has some validations - what happens if they fail? What should we send back to the client?

We need to make sure we set an appropriate status code - `:bad_request` will do nicely. It would also be polite to send back some information about what went wrong.

```ruby
def create
  pet = Pet.new(pet_params)
  if pet.save
    render json: { id: pet.id }, status: :ok
  else
    render json: { errors: pet.errors.messages },
      status: :bad_request
  end
end
```

## What Have We Accomplished?
- Build an _API_ - a web server that serves JSON for machines rather than HTML for humans
- Read client data and use it to create a new resource
- Handle errors in a polite and helpful manner

## Resources
- [`.as_json` documentation](http://api.rubyonrails.org/classes/ActiveModel/Serializers/JSON.html#method-i-as_json)
- [ActiveModel Serializers](http://railscasts.com/episodes/409-active-model-serializers)
- [blog post by thoughtbot about serialization](http://robots.thoughtbot.com/better-serialization-less-as-json)
- [Rails API Development Guide](http://edgeguides.rubyonrails.org/api_app.html)
