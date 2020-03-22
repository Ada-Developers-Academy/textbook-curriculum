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
      <h3>{props.fullName}</h3>
      <p>{props.email}</p>
    </div>
  );
};
```

These are called, _functional components,_ because they are composed of one function.  Functional components take in data from `props` and return JSX.  When functional components **only** use props and not the `useState` hook these functional components are often called _Stateless Components_ in React.  These stateless components are attractive because they are relatively straightforward to read, test and debug.  

However we often need to keep track of information over time or the _state_ of our component like we have done with the `useState` hook.

If you remember back to Ruby, we built objects which combined data, which could change over time, with functionality by defining classes.  React _class components_ provide an alternative to the `useState` hook to manage the state of a component, and provide a set of lifecycle methods to manage a component's rendering and state.

### So Why Didn't We Learn Class Components Earlier?  

At Ada we feel that, in most cases, that the recent introduction of hooks make class components _unnecessary_.  With hooks most applications can be written exclusively with functional components.  There are a few [specialized cases](https://reactjs.org/docs/error-boundaries.html) which require class components, but these scenarios are few and far between and may be replaced hook-based solutions at a later date.

### So Why Learn About Class Components?

React has been around for a while now and a great deal of code and documentation has been written using class components.  React is not eliminating class components and a great number of developers find the abstraction of class components attractive.  It's important to know how they work and how to convert between functional and class components.

## Class Components

We could rewrite the `App` component `create-react-app` generates for us like this.

```javascript
import React, { Component } from 'react';

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

This class extends `Component` a class defined in the React library and inherits a bunch of functionality we will go into further in following lectures.  All class components **must** have a `render` method which returns a block of JSX like the functional components we have created thus far.

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

## When to use a Stateless, Functional-with hooks or Class Component

At Ada we start writing functional components because we believe they are the clearest to understand and easiest to get started writing JSX.  Furthermore, writing functional components is seen as best-practice in industry.

Stateless Components

- Involve less complicated and lengthy syntax.
- Can be understood more quickly because of their short, declaritive nature.
- Are easier to test and debug because they are `deterministic`, i.e. given a set of props, they **always** return the same JSX.
- In future releases they will provide better **performance** because they do not inherit functionality provided by the Component class.
- Are more reusable because by only providing the most basic functionality with fewer dependencies, functional components can be reused more often.

Functional Components with `useState`

- Also involve less lengthy syntax and complicated lifecycle methods
- Often result in smaller bundle size when deployed in production

Class Components
- Provide a set of lifecycle methods from their parent `Component` class which are called as the class componenent is created, mounted, rendered, and eventually, removed.

In general, you should default to using **only** a mix of stateless and stateful functional components unless a class is required.

## Recap

- A React component can be written as either a function or a class.
- A class component extends React's `Component` class.
- A class component **must** have a `render` method.
- `props` are passed into a class component from it's constructor method.
- Functional components are easier to read and understand, but _stateless_.

## Additional Resources

- [React Documentation on state & props](https://reactjs.org/docs/components-and-props.html)
- [React Functional or Class Components: Everything you need to know](https://programmingwithmosh.com/react/react-functional-components/)
