# Creating an API

## Learning Goals
- Apply our Rails knowledge to a new construct
- See how to render results other than views
- Use status codes to communicate outcomes

### Introduction
Last week, we learned about using APIs that already exist. Now, our goal is to create APIs ourselves.

When creating an API, usually the goal is to provide data to a consumer, whether that be a human (not normally) or another system (usually). Many of the applications that we have created previously could have been APIs instead of web applications.

### Getting Started
When we think about using an API vs using a web application, what is the key difference? **HTML** for humans to consume versus **JSON** for systems to consume.

What are some of the key similarities? They both use **routes** to determine what specific **data** we want to see, and there is also some sort of **data** involved.

### Create an API

Let's build a small Rails app that will act as an API for providing data about our amazing, adorable pets, to other applications. The app will have the following routes:

- `/pets` show all pets
- `/pets/:id` shows a pet with the provided id
- `/pets/search?query=<the search term>` fuzzy searches pets by name, shows all matching pets

Given the context of our application, we should have a model and controller that reference our main resource, pets. Once you clone this repo, you'll notice that we have these things already created for you!

[https://github.com/AdaGold/ada-pets](https://github.com/AdaGold/ada-pets)

### Let's Get Started
We are going to approach this application creation from a TDD approach. Right now, you'll see that we have a few tests already created for you. You can run the tests using the usual `rake test`.

You'll notice that we have one basic get route created for pets, and one basic controller action that corresponds with that route.

The error below is where we diverge from our "normal" rails approach. Normally, we'd create a view that would correspond with our controller action.  The error should be something like:

```bash
Missing template pets/index, application/index...
```

Since we are building a JSON API, we don't want to render an HTML template (or really use any of the view layer). Instead we want to return the requested data in a standard format. Using the `render` method in the controller with some new options, we can choose to return json:

```ruby
# pets_controller.rb
def index
  @pets = Pet.all
  render :json => { ready_for_lunch: "yassss" }
end
```

Notice that we didn't for realsies write any JSON. We provided a plain Ruby hash and let Rails do the conversion for us (with the `render :json =>` call. So to make progress on our tests, we could do something like:

```ruby
# pets_controller.rb
def index
  pets = Pet.all
  render :json => pets
end
```

Note that we have removed the `@pets` instance variable here that we are normally used to creating. Why do you think we've done that?

### Filtering Fields
You won't always want to send _everything_ in your database to the user. Databases often contain sensitive data that should be treated judiciously. Or, that data might just not be relevant, like `created_at` or `updated_at`. Right now Rails is sending all these fields back in the JSON response.

To filter what Rails sends back, you can use the `as_json` method as follows:

```ruby
# pets_controller.rb
def index
  pets = Pet.all
  render json: pets.as_json(only: [:id, :name, :age, :human]), status: :ok
end
```

Rails is smart enough to know how to use `as_json` for both a Collection and an individual Model, so this same technique will work later when we test and implement `show`.

### Response Codes

We've built a simple API that responds with some data. We could let the consumer of our API parse that data to figure out if their request was successful or if there was an error of some sort, but that seems cumbersome for them. Instead, we should use HTTP status codes to provide a quick and easy way for our API's users to see the status of their request.

To set status code in your controller, just pass `:status` to our render method.

```ruby
def index
  pets = Pet.all
  render :json => pets, :status => :ok
end
```

Notice in the example above, I used `:ok` instead of the official numeric value of 200 to inform the consumer that the request was a success. I tend to use the built-in Rails symbols for this, as they're more explicit, however its good to know at least the most common [HTTP status codes](http://en.wikipedia.org/wiki/List_of_HTTP_status_codes).

+ 200 - :ok
+ 204 - :no_content
+ 400 - :bad_request
+ 401 - :unauthorized
+ 403 - :forbidden
+ 404 - :not_found
+ 500 - :internal_server_error

### `show`
Let's add this same approach for the show action, start by adding a route, then updating the controller:

```ruby
# pets_controller.rb
def show
  pet = Pet.find(params[:id])
  render :json => pet
end
```

#### What if we can't find a pet?
What if we get params that don't match a pet? What do we do? How should our code change? At the very least, we should make sure that we don't throw an error. Also, we should return a **status code** that indicates to the consumer that we couldn't find any content to match their request. Fortunately, the `204` status code exists for exactly this reason. Let's change our `show` method to:

**Note** that we switch from using the `find` method to the `find_by` method because `find` will return an error before getting to the conditional if the given Pet has not been found.

```ruby
def show
  pet = Pet.find_by(id: params[:id])

  if pet
    render :json => pet, :status => :ok
  else
    render :json => [], :status => :no_content
  end
end
```

## Activity: Adding Search with your Chair Pair
1. Write at least one positive (search found pets) and one negative (search didn't find pets) test.
1. Implement the search feature in the `Pet` model
1. Create a route and controller action for searching for a pet by name
1. Make the action return a collection of pets as json

## Resources
- [`.as_json` documentation](http://api.rubyonrails.org/classes/ActiveModel/Serializers/JSON.html#method-i-as_json)
- [ActiveModel Serializers](http://railscasts.com/episodes/409-active-model-serializers)
- [blog post by thoughtbot about serialization](http://robots.thoughtbot.com/better-serialization-less-as-json)

### Appendix A: Performance
Rails does have an alternate configuration optimized for APIs. It takes enough extra setup that we're not going to bother with it in class, but it's worth knowing about.

Following these steps will turn off many of the features that allow Rails to serve normal websites, and turn it into a lean, mean, API-serving machine. In particular, it disables the ERB templating engine and tuns of things like cookies, `session` and `flash`, giving a reasonable improvement in both memory footprint and performance.

First, when you build your rails application, add the `--api` flag:
```bash
rails new ada-pets --api
```

Second, includ the `rails-api` gem:
```ruby
# Gemfile
gem 'rails-api'
```

Remember to `bundle install`.

Third, make your `ApplicationController` inherit from `ActionController::API` instead of `ActionController::Base`, and change the way it protects from forgery:
```ruby
# app/controllers/application_controller.rb
class ApplicationController < ActionController::API
  include ActionController::RequestForgeryProtection
  protect_from_forgery with: :null_session
end
```

That's it. Your Rails app is now set up to _only_ serve APIs.

You can read more about all this here:
- [Rails API Development Guide](http://edgeguides.rubyonrails.org/api_app.html)
