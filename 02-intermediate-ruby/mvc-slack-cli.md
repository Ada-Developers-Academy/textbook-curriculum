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
- Is there a direction to them, with one component at the start and another at the end?

## Model, View, Controller



## Inheritance and Composition Together

MVC is a specific organization for the _composition_ relationships in our program. This relationship is separate and distinct from the _inheritance_ relationship between `Recipient` and `User`/`Channel`. Each solves a different part of the design problem:
- The _composition_ relationship determines how the classes work together to accomplish each task, helping us keep the program organized
- The _inheritance_ relationship allows us to reuse functionality without duplicating code, helping us keep the program DRY

In essence, composition allows us to separate distinct functionality, while inheritance allows us to group similar functionality.

![Inheritance and Composition](images/Composition-and-Inheritance.png)

## Summary

## Additional Resources