# Commands and Queries

## Learning Goals
By the end of this lesson, students should be able to...

- Differentiate between _commands_ and _queries_ in software systems
- Explain how splitting methods into commands and queries can help us write better software

## Introduction

As you write more and more object-oriented programs, and pay more and more attention to _object interfaces_, you may begin to notice a pattern emerging around how you write methods. Some methods are designed to change their object, while others are meant to return a result without changing it. We can formalize this idea by giving these patterns names:

- **Command:** change the state of the system
- **Query:** return a result, without changing anything

Here is an example in code:

```ruby
people = ['Ada', 'Katherine', 'Grace']

# .length is a query. It returns a result (the length
# of the array) without changing the it.
puts people.length

# .push is a command. It changes the array by adding
# a new element.
people.push('Maryam')

# .pop is a command. It removes and returns the first
# element in the array. Even though it has a return value,
# changing the array makes it a command.
first_person = people.pop
puts first_person
```

**Question:** Are the following methods queries or commands?
- `Array#first`
- `Array#shuffle`
- `Array#shuffle!`
- `Array#each`

The distinction between commands and queries is another _idiom_ of software engineering. There's nothing in the Ruby language definition to imply a difference between queries and commands, but thinking about our methods in this way can be very helpful to us as engineers. For example:

- If you know a method is a query, calling it is "free" in terms of cognitive load. You don't need to worry about unexpected side-effects.
- If you call several query methods in a row, changing the order won't change the result.
- If you know you're writing a query or a command, you can work that into the name of the method. For example, Ruby methods ending in a `!` are always commands.

Most of these are benefits for the code that's calling your method, not for the method itself. The distinction is very useful for reading, understanding, and debugging code. In fact, figuring out whether methods are queries or commands is one of the first things many engineers do when learning a new codebase.

## Example: Solar System

Here are some examples from the Solar System project:

 Method                            | State change             | Return value                     | Command or Query? 
-----------------------------------|--------------------------|----------------------------------|---
 `Planet#name`                     | none                     | the name of the planet           | query 
 `Planet#summary`                  | none                     | a one-line summary of the planet | query 
 `SolarSystem#star_name`           | none                     | the name of the star             | query 
 `SolarSystem#add_planet`          | add a planet to the list | none                             | command 
 `SolarSystem#find_planet_by_name` | none                     | a `Planet`                       | query 
 `SolarSystem#distance_between`    | none                     | the distance                     | query 

From this table, we can tell the following

- Asking for a `Planet`'s `name` or `summary`, or asking a `SolarSystem` to `find_planet_by_name`, is "safe". Calling these methods won't change the state of the program.
- Calling the `distance_between` method won't change anything about either of the `Planet`s
- If we're calling `add_planet`, we need to be a little more intentional

Those observations may seem a little obvious - _of course_ calling `Planet#name` shouldn't change anything. However, having it explicitly spelled out like this makes the process of connecting the pieces just a little easier, and the bigger the project, the more important that is.

### Command Line Actions

The distinction between queries and commands applies to other aspects of software engineering too. For example, when a user is interacting with a program's command line interface, it can be useful to divide the available actions into these categories. Again returning to the Solar System project:

 Action           | State change | Program output         | Command or Query? 
------------------|--------------|------------------------|-------------------
 `list planets`   | none         | list of planets        | query             
 `planet details` | none         | details about a planet | query             
 `add planet`     | new planet   | ask for details        | command           
 `exit`           | program ends | none                   | command           

Now a "state change" refers to the state of the entire program, not a single object. `exit` is a particularly interesting case here, since it quits the program. Quite a state change! As developers, we can use this table to reason about how our program might behave.

You could create a table like this for any interface that includes multiple actions. Other examples include:
- Endpoints for an API
- Interactions with the filesystem from the terminal
- Git commands

## Exercise: Commands and Queries in the Filesystem

Complete the following table of terminal actions that interact with the filesystem.

Action | State change | Output | Command or Query?
--- | --- | --- | ---
`ls` |
`pwd` |
`cd` |
`touch` |
`mkdir` |
`rm` |
`cat` |

## Commands, Queries and Testing

Categorizing methods as commands or queries can help us write tests for those methods.

For a _query_, the important part is the method's return value. The focus of testing should be that the return is correct, even given strange parameters or an odd initial state. For example, the query `SolarSystem#find_planet_by_name` might have the following tests:
- Can it find and return a planet that exists?
- Does it return `nil` if asked for a planet that doesn't exist?

For a _command_, the important part is the method's effect on the state of the object. The focus of testing should be that the object's state has changed in the correct way. For example, the command `SolarSystem#add_planet` might have the following tests:
- Is the planet added to the end of the list?
- Assuming that adding a duplicate planet produces an exception, if you attempt to add a duplicate planet, in addition to getting an error, what happens to the list?

## Exercise: Commands and Queries in the Slack CLI project

With your partner, revisit the requirements for the Slack CLI project, and do the following:

- Make a table similar to the one we made for SolarSystem above for the different actions the user can take
- Make a similar table for each public instance method on each of your classes
  - Is your test coverage appropriate for these commands and queries?
- Make a similar table for the endpoints you're using from the Slack API

## Summary

- The distinction between _commands_ and _queries_ is an important part of designing clean interfaces
- **Commands** make a change to the system
- **Queries** return a result without changing anything

## Additional Resources

- [Martin Fowler on Command/Query Separation](https://martinfowler.com/bliki/CommandQuerySeparation.html)
- [Microsoft Azure documentation on Command and Query Responsibility Segregation (CQRS) pattern](https://docs.microsoft.com/en-us/azure/architecture/patterns/cqrs) - might make more sense after the first couple weeks of Rails