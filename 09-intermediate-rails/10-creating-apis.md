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

Rails has a standard installation that gives us the default tools necessary to create an API. This setting will configure our application to exclude some of the things that are included with Rails by default. One other key difference is that controllers will inherit from `ActionController::API` rather than `ActionController::Base`.

```bash
rails new ada-pets --api
```

For the sake of time we aren't going to create everything from scratch, but you should still know that this is how you will want to start things off when you do this from scratch.

Given the context of our application, we should have a model and controller that reference our main resource, pets. Once you clone this repo, you'll notice that we have these things already created for you!

[https://github.com/AdaGold/ada-pets](https://github.com/AdaGold/ada-pets)

###
We are going to approach this application creation from a TDD approach. Right now, you'll see that we have a few tests already created for you. You can run the tests using the usual `rake test`.

You'll notice that we have one basic get route created for pets, and one basic controller action that corresponds with that route.

This error is where we diverge from our "normal" rails approach. Normally, we'd create a view that would correspond with our controller action.  The error should be something like:

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

Notice that we didn't for realsies write and JSON. We provided a plain Ruby hash and let Rails do the conversion for us (with the `render :json =>` call. So to make progress on our tests, we could do something like:

```ruby
# pets_controller.rb
def index
  pets = Pet.all
  render :json => pets
end
```

Note that we have removed the `@pets` instance variable here that we are normally used to creating. Why do you think we've done that?
