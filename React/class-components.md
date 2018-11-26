# Class Components

## Learning Goals

- Examine the syntax of creating a class component.
- Compare that syntax of a functional component with a class component.

## Functional Components

There are two main types of components in React.  _Class Components_ and _Functional Components_.  Until now all the components you created in React were functions like this:

```javascript
// components/Student.js
const Student = (props) => {
  return (
    <div>
      <h3>{props.fullname}</h3>
      <p>{props.email}</p>
    </div>
  );
};
```

These are called, _functional components,_ because they are composed of one function.  Functional components take in data from `props` and return JSX.  These components are easy to read, test and debug because given a set of props they always return the same JSX back.  However often we want to keep track of information over time, or the _state_ of our component.  This is why functional components are often called _Stateless Components_ in React.  They take props as input and return JSX, which can be a mixture of nested components and HTML.

If you remember back to Ruby, we built objects which combined data, which could change over time, with functionality by defining classes.  We can build React components which can do the same!

## Class Components 

We have already seen a class component `create-react-app` generates one for us called `App`.  

```javascript
class App extends Component {
  render() {
    return (
      <div className="App">
       ...
      </div>
    );
  }
}
```

This class extends `Component` a class defined in the React library and inherits a bunch of functionality we will go into further in following lectures.  All classes **must** have a `render` method which returns a block of JSX like the functional components we have created thus far.  

### What about `props`

Because a class component is not a single function, any props must be passed into the constructor.

We can see an example by re-writing our Student component as a class.

```javascript
// components/Student.js
import React from 'react';

class Student extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <h3>{this.props.fullname}</h3>
        <p>{this.props.email}</p>
      </div>
    );
  }  
}

export default Student;
```

In the Student class, `props` are passed into the contructor as arguments and saved as an instance variable by the superclass, Component.  In a class component you can always access props from any method with `this.props`, just like you could access a ruby instance variable with the `@` character.  Because this is the default behavior of a React component, you can leave off the constructor, if this is all you are doing.

**Questions:**

1. What is the superclass for `Student`?
1. What is accomplished with `super(props)`?

### Is it `extends React.Component` or `extends Component`

You may have noticed that `App` inherits from `Component` while the `Student` inherits from `React.Component`.  They are both inheriting from the same class, but in `App.js` we have _destructured_ the `React` object with `import React, { Component } from 'react';`.  The `{ Component }` part of the line is the equivalent to:  `const Component = React.Component`.  It's a way of assigning elements of an object to individual variables.  

## When to use a Functional or Class Component

At Ada we start writing functional components because we believe they are the clearest to understand and easiest to get started writing JSX.  Furthermore, most of the time you will likely start a component as a functional component, even if you later change it into a class because you need the additional functionality.  

Functional Components

- Involve less complicated and lengthy syntax.
- Can be understood more quickly because of their short, declaritive nature.
- Are easier to test and debug because they are `deterministic`, i.e. given a set of props, they **always** return the same JSX.
- In future releases they will provide better **performance** because they do not inherit functionality provided by the Component class.  
- Are more reusable because by only providing the most basic functionality with fewer dependencies, functional components can be reused more often

Class components however provide access to the state and lifecycle functionality provided by the `Component` class.  In the next lecture we will examine [`state`](state.md) and how it works.  Your applications going forward will consist of a mix of class and functional components.  You will find that most of your business logic resides in your class components, while functional components provide much of the presentation structure.

## Recap

- A React component can be written as either a function or a class.
- A class component extends React's `Component` class.  
- A class component **must** have a `render` method.
- `props` are passed into a class component from it's constructor method.
- Functional components are easier to read and understand, but _stateless_.

## Additional Resources

- [React Documentation on state & props](https://reactjs.org/docs/components-and-props.html)
- [React Functional or Class Components: Everything you need to know](https://programmingwithmosh.com/react/react-functional-components/)
