# Component Design

## Learning Goals
- Examine design patterns used by React developers
- Use the functional stateless components design pattern
- Use the container components with presentational components pattern

## Design Patterns
In software engineering, a [design pattern](https://en.wikipedia.org/wiki/Software_design_pattern) is a generic, reusable solution to a commonly occurring problem. In this discussion, we will examine one design pattern in React: Container Components with Presentational Components.

## Container Components with Presentational Components
This design pattern provides us with a common way to organize components within one another. Container components will manage the creation and data sent to presentation components. Presentation components will be solely responsible for displaying data, and not for managing state within themselves. Because of this, these presentation components are often the same as functional stateless components.

One way that this pattern can come about in our React applications, is by using the **container** component to manage **state**, and having two (child) **presentation** components, one which manages **data input and modification** and another which manages the **presentation of this data**.

![stateful components using stateless components](images/stateful-stateless-components.png)
<!-- https://drive.google.com/a/adadevelopersacademy.org/file/d/15lodApvgPRHN-aE5io1lYJgpdpWu9SuP/view?usp=sharing -->

## Key Takeaway
When we design our React applications, we should consider these design patterns to solve common problems. When our components get larger, it is important to take a step back to see how we can simplify using these patterns.

## Additional Resources
- [Container Components](https://medium.com/@learnreact/container-components-c0e67432e005)
