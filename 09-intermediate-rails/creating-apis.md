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
  render json: { ready_for_lunch: "yessss" }, status: :ok
end
```

Our tests are passing.  However our *job* was to provide data about pets!  So we can add another test to ensure that our controller index action is providing pet data.

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

      required_pet_attrs = ["id", "name", "species", "age", "owner"]

      expect(pet.keys.sort).must_equal required_pet_attrs.sort
    end
  end
```

The test above:

1. Performs a get request to `/pets`
1. Takes the body of the server's response and parses the JSON into regular Ruby arrays and hashes.
1. Ensures that the response is an array
1. Ensures that each response has only the id, name, species, age, and owner fields
    - These fields are strings because JSON doesn't know about symbols and returns all the keys as strings.

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
[{"id":1054079548,"name":"Alligator","species":"Dog","age":10,"owner":"Sarah","created_at":"2020-05-20T23:49:35.198Z","updated_at":"2020-05-20T23:49:35.198Z"}]
```

Very handy!  Our tests are _almost_ passing.  We just need a way to exclude some fields.

So we can adjust our controller:

```ruby
  # pets_controller.rb
  def index
    pets = Pet.all.as_json(only: [:id, :name, :age, :owner, :species])
    render json: pets, status: :ok
  end
```

All models in Rails have an `.as_json` method to convert the model data into JSON and this method can be used to limit which fields are returned.

**Question** Why did we use `pets` instead of `@pets` for our variable name?

<details>
<summary>Answer</summary>
The `@` makes a regular variable into an instance variable. Rails (through some clever programming) _sort of_ treats a view as a method call from the controller. Sort of.

In this case, we aren't rendering a view, so there's no need to pass this value along by forcing it to be an instance variable.
</details>


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
  - Response body, **Hint**, you can respond with JSON without an available model.
- What test cases might be useful for this endpoint?
  - There should be at least one test already in the project but see if you should add more
- How do the two endpoints we've implemented so far compare to similar functionality in a non-API Rails app?

When you finish you can check your solution against the [solution branch](https://github.com/AdaGold/ada-pets/compare/solution) of our implementation.

## What Have We Accomplished

- Built an _API_ - a web server that serves JSON for machines rather than HTML for humans
- Read client data and used it to create a new resource

## Response Codes

Response codes and their corressponding Rails symbols.

- 200 - :ok
- 201 - :created
- 204 - :no_content
- 400 - :bad_request
- 401 - :unauthorized
- 403 - :forbidden
- 404 - :not_found
- 500 - :internal_server_error

## Resources

- [`.as_json` documentation](http://api.rubyonrails.org/classes/ActiveModel/Serializers/JSON.html#method-i-as_json)
- [ActiveModel Serializers](http://railscasts.com/episodes/409-active-model-serializers)
- [blog post by thoughtbot about serialization](http://robots.thoughtbot.com/better-serialization-less-as-json)
- [Rails API Development Guide](http://edgeguides.rubyonrails.org/api_app.html)
- [Testing a Rails API](https://www.learnhowtoprogram.com/rails/building-an-api/testing-a-rails-api)
