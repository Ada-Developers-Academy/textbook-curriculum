# Organizing Data with Models and Collections

As we've worked with JavaScript, up until this point all our data in has been stored as arrays of objects. This is fine for simple programs, but for more complex applications we'll need a more robust way to organize things. In the Backbone framework, this problem is solved through Models and Collections.

## Learning Goals

By the end of this lesson, you should be able to...

TODO DPR: seems too long
- Explain what a Backbone Model is
- Differentiate between Backbone Models and JavaScript objects
- Define a Backbone Model
- Instantiate a Backbone Model and assign attributes
- Explain what a Backbone collection is
- Place models into a collection
- Manipulate models in a collection
- Respond to events emitted by collections

## What are Models and Collections in Backbone?

Backbone Models are much like Rails Models.  They keep track of your data and help in saving and loading information to and from your back end.

Things you can do with a model in Backbone include:
- Setting default values for new data
- Validating changes to the data
- Reading data from and writing it to an API
- Abstracting away complex bits of business logic
- Triggering events when the data changes

Collections are a specific type of model that keep track of a set of related objects, rather than one individual piece of data. The relationship between Collections and Models is like the one between arrays and objects.

Thinking back to Rails and ActiveRecord, a Backbone Collection contains things that would be class methods for an AR Model: built-in methods like `.all`, `.find` and `.order`, as well as any custom methods that operate on a group of objects.

Organizing all this functionality ourselves would be a ton of work, so instead let's create a Model and a Collection for our books!



## Defining Book and BookList

Our first step in organizing
