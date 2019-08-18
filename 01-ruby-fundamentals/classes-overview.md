# Object-Oriented Design in Programming: Overview

## Learning Goals

By the end of this lesson, students should be able to...
- Describe the role that _classes_ fill in Ruby
- Differentiate between _classes_ and _instances_
- Identify the _state_ and _behavior_ of an _object_

## The Story So Far

## Introduce: Objects

### State and Behavior

### What is Object-Oriented Programming?

## OOP Means Defining Blueprints, And Using Instances

## In Ruby, OOP Means Classes and Relationships

### We've Seen Classes

### What to Look Forward to

## Objects So Far

An `object` is the representation of an idea within a program. Let's look at a common type of object we've used already: `Time`.

![variable-assignment](images/variable-assignment.png)

A class can be identified by its __capitalized first letter__. In the above snippet `Time` is a class. When you call `.new` on a class, you get an _instance_ of that class. In any program, there may be zero, one or many instances of any given class.

Now let's examine another class we're familiar with: `String`

```ruby
my_animal = "elephant"
your_animal = "giraffe"
empty_string = ""
```

Turns out every string we've ever used is an instance of the class `String`. Because strings are so common, Ruby lets us use _string literals_ like `""` or `"elephant"` to create a new one. If feeling verbose, you could also call the `.new` method on the `String` class to create a new string object:

```ruby
my_animal = String.new("elephant")
```

The same is true for arrays and hashes. `[]` is short for `Array.new`, and `{}` for `Hash.new`. `""`, `[]`, and `{}` are syntactic sugar; using _literals_ to _initialize_ a new _instance_ of an _object type_. Most classes do **NOT** have this kind of convenience.

In general, using the syntactic sugar is the right way to go. `"elephant"` is much easier to read than `String.new("elephant")`, and there's rarely a reason to use longer version.

## State and Behavior

Objects are used to tie together _state_ and _behavior_.
- **State:** data or attributes the object will keep track of
    - _the letters "a", "b" and "c" in a string `"abc"`_
- **Behavior:** methods that rely upon or modify the state
    - _the String `upcase` method_

```ruby
# state
my_animal = "elephant"
your_animal = "giraffe"

# behavior - same method but results vary based on state
my_animal.upcase # "ELEPHANT
your_animal.upcase # GIRAFFE
```

In Ruby, state will be represented using _attributes_, also known as _instance variables_, and behavior will be defined using _methods_.

## What Are Objects Used For?

It can be intimidating to look at `String`, `Hash` or `Array` when learning about objects for the first time. These are fundamental programming concepts that get used in almost every program, how can we ever hope to build or reason about something as complex as that?

Although any abstract idea can be represented as an object, it's sometimes more approachable to think of a physical object to get the idea. Let's imagine a program designed to keep track of a library catalogue, which might have a class called `Book`.

**Question:** what _state_ and _behavior_ might a `Book` class need?

Note that all this state and behavior is for a particular instance of a `Book`. Think about the abstract concept of a book, what is its title or author? That doesn't make any sense. Only when we create an instance do these properties come into focus.

When modeling a real-world object like a book or a person, it's important to remember that you don't need to track everything about it, only what's important to your program. You certainly could include information about the color of the book's cover or how tall it is in your catalogue, but you should only do so if that information is useful to you.

Different kinds of objects have different state and behaviors, and the same real-world object in two different programs might have totally different representations. Think about how different a model of a person would be in a medical application versus in a gradebook. What information is relevant is totally different for the two programs.

## Summary

- An _object_ is a piece of a program that ties together _state_ (variables) and _behavior_ (methods)
- A _class_ is used to define a type of object
  - Any program may have zero, one or many _instances_ of a class
  - We've seen many of Ruby's built-in classes already, like `String`, `Array` and `Time`
- Reasoning about what _state_ and _behavior_ your classes should have is one of the fundamental skills of designing software

## Vocab

Term              | Definition | Examples&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
---               | ---        | ---
Object            | A representation of an idea within a program. Ties together _state_ (variables) and _behavior_ (methods). | A number, an array, any instance of a class
Class             | A type of object. A class is _abstract_ in that it defines what those objects will look like, but doesn't itself have state. | `Array`, `Time`
Instance          | One particular object. Follows the format defined by its class, but has state that makes it specific. | `[1, 2, 3]`, `Time.new(2017, 'jul', 29)`
State             | Data or attributes an object will keep track of | The elements of an array, the days and years stored in a `Time` object
Behavior          | Methods that rely upon or modify state | `Array#sort`, `Time#friday?`
