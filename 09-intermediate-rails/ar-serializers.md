# ActiveModel Serializers

## Learning Goals
- What is serialization?
- Why would you use a Serializer?
- Apply a Serializer to a model

## Introduction
### What is serialization?
**Serialization** is the process of translating data structures into a format that can be transmitted.

We have already utilized serialization in Rails without being fully aware of it. Rails is built to do some of this for us by default, but we have the opportunity to customize the way our data is serialized for even more control over our JSON responses.

### API Application
Let's recall what a controller method looked like in our ada-pets example:
```ruby
def index
  pets = Pet.all
  render json:  pets.as_json(only: [:id, :name, :age, :human]), status: :ok
end
```

We use the `as_json` method to allow us to control exactly the data we want to be returned, rather than returning all of the data that our model provides.

The problem arises in our `show` controller method. What if we want this to return the same fields?
```ruby
def show
  pet = Pet.find_by_id(params[:id])
  render json: pet.as_json(only: [:id, :name, :age, :human]), status: :ok
end
```

We have been programming for a _while_ now, and can see the trouble here is that we've duplicated this code in two different controller methods. So let's come up with a plan to DRY things up!

We will create a **Serializer** to manage the JSON that a model object will return. This will allow us to determine what the JSON response will be for a model in only one place, removing the need for individual controller customization.


## Setup
### Remove `as_json`
We'll start off by removing the `as_json` method in our controller methods so we can ensure that our modifications will have the desired effect.

1. Remove the `as_json` in the `index` and `show` controller actions.
2. Run the server and hit those endpoints in the browser or Postman to verify that all model fields are returned.

### Gemfile
Rails and ActiveRecord have thought about this concept a lot and therefore have provided us with a great gem to help us out.

1. Add `gem "active_model_serializers"` to your `Gemfile`
2. run `bundle install`

## Create the Serializer

### Generate Serializer File
Now that we've installed the gem, we have the ability to generate a serializer file using a `rails generate` command.

Let's create a pet serializer:

`rails g serializer pet`

This will create a new serializer file called `pet_serializer` in the `app/serializer/` folder.

### Configure Serializer
Now that we have a serializer file, we want to set it up to contain the relevant fields and methods that we want to utilize in returning this model's data.

Let's see what it gives us by default:
1. Open the `/app/serializers/pet_serializer.rb` file. Examine the contents of the file that was created by default.
1. Hit the `/pets` and `/pets/:id` endpoints. What has changed about the JSON returned?

The serializer uses the `attributes` collection to determine the attributes on the model that should be included when the data is serialized to JSON.

We know that we want more than just the `id` returned in our API response, so go ahead and update the `attributes` collection to include all of the fields that we originally had in `as_json`.

Test it out again! Success!

### Now what?
Using `attributes` in a serializer just barely scratches the surface of what a serializer can provide for us. Serializers can also specify how to return data from related models, provide custom methods, and more! Read through the additional resources in this section for more information.

## Key Takeaways
- We use serializers to centralize data transformation for our model objects
- In Rails, we can use a gem which will allow for this integration
- We don't need to use `as_json` if we utilize a model serializer

## Additional Resources
- [Better Serialization, less `as_json`](https://robots.thoughtbot.com/better-serialization-less-as-json)
- [Engine Yard Blog: Active Record Serializers](https://www.engineyard.com/blog/active-model-serializers)
- [Active Record Serializers and JSON and more!](https://www.sitepoint.com/active-model-serializers-rails-and-json-oh-my/)
