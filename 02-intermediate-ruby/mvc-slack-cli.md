# The MVC Pattern

As seen in the Slack CLI project

## Learning Goals

By the end of this lesson, students should be able to...

## Design Patterns in the Slack CLI Project

**Activity:** Think about the composition relationships (has-a, has-many) in the Slack CLI project.
- What is each class responsible for?
- How do the classes connect to each other? Where does one class call the method of another class, and which class is doing the calling?
- Draw a picture of these connections, with boxes for the classes, and arrows for method calls. Include the `main` method from `slack.rb` as well.

What patterns do you notice?
- How do method calls flow through the app?
- Is there a direction to the flow, with one component at the start and another at the end?
- How does this compare to other projects we've built in this course?

## Model, View, Controller

We can separate the components of the Slack CLI project into three distinct categories

Category | Description | In Slack CLI
--- | --- | ---
Model | Each class represents an individual domain object. They contain factory methods and business logic. A program typically contains many instances of these classes. | `User`, `Channel`
Controller | One class to keep track of models and program state. Typically there's only one instance per program. Methods correspond to things the user can do. | `Workspace`
View | A method or class to handle interacting with the user. For a CLI program, typically this is a command loop full of `puts` and `gets`. | The `main` method in `slack.rb`

This categorization is not unique to the Slack CLI project.
- OO Ride Share's , and `TripDispatcher` is a Controller, and `Trip`, `Driver` and `Passenger` are all Models
- Most Hotel designs contain a Controller (something like `Hotel` or `BookingSystem`) and several Models (`Room`, `Reservation`, `Block`)

(In both Hotel and OO Ride Share we skipped the View component)

This pattern is called MVC, short for Model, View, Controller. It is extremely common in object-oriented programming, especially when building user interfaces.

## MVC, Composition and Inheritance

MVC is a specific organization for the _composition_ relationships in our program. This relationship is separate and distinct from the _inheritance_ relationship between `Recipient` and `User`/`Channel`. Each solves a different part of the design problem:
- The _composition_ relationship determines how the classes work together to accomplish each task, helping us keep the program organized
- The _inheritance_ relationship allows us to reuse functionality without duplicating code, helping us keep the program DRY

In essence, composition allows us to separate distinct functionality, while inheritance allows us to group similar functionality.

![Inheritance and Composition](images/Composition-and-Inheritance.png)

## Summary

## Additional Resources