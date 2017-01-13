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

- `GET /pets` show all pets
- `GET /pets/:id` shows a pet with the provided id
- `POST /pets` add a pet to the collection

Given the context of our application, we should have a model and controller that reference our main resource, pets. Once you clone this repo, you'll notice that we have these things already created for you!

[https://github.com/AdaGold/ada-pets](https://github.com/AdaGold/ada-pets)

Once you've downloaded it, take a few minutes to go through this Rails app with the person next to you.

- What components does the project have?
- What steps would you perform to set up a project like this from scratch?

## Listing Pets
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

Notice in the example above, I used `:ok` instead of the official numeric value of 200 to inform the consumer that the request was a success. I tend to use the built-in Rails symbols for this, as they're easier to read, but its good to know at least the most common [HTTP status codes](http://billpatrianakos.me/blog/2013/10/13/list-of-rails-status-code-symbols/).

+ 200 - :ok
+ 204 - :no_content
+ 400 - :bad_request
+ 401 - :unauthorized
+ 403 - :forbidden
+ 404 - :not_found
+ 500 - :internal_server_error

## Showing Pet Details
Working with the person next to you, and following the same pattern we used for `index`, implement the `show` action.

Questions to consider:
- How will `show` be different than `index`?
- What fields should be returned?
- What should you do if the user asks for a pet that doesn't exist?
- What test cases might be useful for this endpoint?

## Adding a New Pet

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
