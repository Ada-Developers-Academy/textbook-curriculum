# The MVC Pattern: Model View Controller

MVC was devised in '79 by the folks working on Smalltalk, which is one of the core influences of Ruby. What we call MVC today, especially in the realm of web stack, is pretty different than that original specification, but the core principles have help true.

Essentially, MVC is way to divide responsibilities to complete a task. It's especially well suited to object oriented programming because of the focus on messaging between objects.

## The Model
- Contains data for the application (often linked to a database)
- Contains state of the application (e.g. what orders a customer has)
- No knowledge of user interfaces, so it can be reused

## The View
- Generates the user interface which presents data to the user
- Passive, i.e. doesn’t do any processing
- Views work is done once the data is displayed to the user.
- Many views can access the same model for different reasons

## The Controller
- Receive events from the outside world (usually from views)
- Interact with the model
- Determine the next step in the process flow
- Often responsible for notifying the View of state changes

We can think of each of these roles as the responsibility of an object, and use those responsibilities to organize a web service, like this:

![MVC in Rails](railsmvc.png)

# RESTful Routing

REST (Representational State Transfer) is a pattern to help us provide a consitent method of accessing and managing our resources on the web. Many different languages and frameworks implement some sort of RESTful routing.

At its simplest, REST is a process in which a web server uses the combination of the requested __URL__ and __HTTP VERB__ to decide how to respond. The goal is a normalized, predictable strucuture for handling web requests. We've already started doing this with Sinatra; Rails formalizes this approach with a special file just for routes (we'll examine it in detail later).

## Here's some pseudo-code
__Assumption__: We've got a resource called `user` that can be recalled/manipulated by a unique identifier called `id`. In Sinatra, we'd represent getting a single instance of this resource with something like `get '/users/:id'`. 

We can extrapolate the entire RESTful suite of actions from this basic pattern. It'd look something like...

```
# Request         # Verb      # Response
/users/           GET         -> object: 'users', method: 'index'
/users/1          GET         -> object: 'users', method: 'show'
/users/new        GET         -> object: 'users', method: 'new'
/users/           POST        -> object: 'users', method: 'create'
/users/1/edit     GET         -> object: 'users', method: 'edit'
/users/1          PATCH       -> object: 'users', method: 'update'
/users/1          DELETE      -> object: 'users', method: 'destroy'
```

The combination of __VERB__ and __URL__ tell our web server (Sinatra, in this example) everything it needs to know to formulate an action and response. The methods we're calling on the `users` object follows a convention common to the Ruby community.
