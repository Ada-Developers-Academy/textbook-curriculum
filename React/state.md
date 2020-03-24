# Managing data using `state`

# TODO - Update for `useState` Hook

## Learning Goals

- Examine how React allows components to manage data
- Use `state` within a component
- Examine how `props` and `state` affect component rendering

## `state`

State is managed **within a given component**. State can be accessed using the `useState` hook and it can be modified using the a function that `useState` returns.

**Wait what's a hook?**  A hook is a special function react provides to "hook" into the lifecyle of a React component and access specific functionality.  The `useState` hook function allows us to have a variable, like an instance variable for a Ruby class for our component.  It also provides a function to change the value of that variable, or it's state.  When this state variable is changed, the component is re-rendered.  React has a number of hooks, and you can even create your own, but for now, we will focus on `useState`.

`useState` allows us to have components with data they remember internally and change over time, like instance variables in a Ruby object.

#### useState Overview

- will take the initial value of the state object as a parameter
- will return an array with two elements
  - the current value of the state
  - a function to change the state

## Adding State to the Student Component

Lets say we want each student component to keep track of if the student is present or absent and we want to be able to change that value if they are present and re-render the component.

### Importing useState

We start by importing the `useState` function.  

```javascript
// src/components/Student.js
import React, { useState } from 'react';
```

**Why do we have { } around `useState`**?

We could call `useState` with `React.useState`, but JavaScript provides a feature called _destructuring_, which we will cover in depth later, which allows us to reference `React.useState` with a variable `useState`, to save typing.

A really important aspect of state is that whenever the state of a component is changed, it will be **updated**, calling the `render` function. For now, you can think of `setState` as doing the `setState` operation PLUS the `render` _automatically_. We'll learn even more about what else our component does when it is updated later on.

#### Examples

**Syntax**

Commonly, initial state is set in a component's constructor function. This is set using variable assignment (the equals sign).

```javascript
// NameDisplay.js
import React from 'react';

class NameDisplay extends React.Component {
  constructor() {
    super();
    this.state = {
      name: 'Ada',
      displayName: true
    };
  }
}

export default NameDisplay;
```

Once we know that the initial state is set, we can use this value within our component class. In this example, we'll use the combination of two state variables to determine whether or not to display a specific property value in our render function.

```javascript
// NameDisplay.js
import React from 'react';

class NameDisplay extends React.Component {
  constructor() {
    super();
    this.state = {
      name: 'Ada',
      displayName: true
    };
  }

  render() {
    let display = 'Sorry, I don\'t know your name.';
    if (this.state.displayName) {
      display = `Hello, ${this.state.name}.`;
    }
    return (
      <section>
        { display }
      </section>
    );
  }
}

export default NameDisplay;
```

Once the initial state is set, we can then make changes using the `setState` function. (**Note:** `setState` will work even if that state variable was not included in the initial `state` object.) This function will merge this object with the existing state object, overriding any existing values on the same variables. `setState` function calls are very often triggered by events that our users can trigger.

We are going to use this in conjunction with **events** later, but for now we're just going to start with setting the defaults in state and then accessing them using `this.state`.

## Changing `props` and `state`
Now that we have learned about both `props` and `state`, we'll need to consider which concept to use for which scenarios.
Here is a helpful chart to assist you in determining whether data belongs in `props` or `state`. For any line item that has "Yes" for both, it means you need to make that decision based on the context of the problem you are trying to solve.

 | ?                                            | props | state |
 | :------------------------------------------- | :---- | :---- |
 | Can get initial value from parent component? | Yes   | Yes   |
 | Can be changed by parent component?          | Yes   | No    |
 | Can change inside component?                 | No    | Yes   |
 | Can set initial value for a child component? | Yes   | Yes   |
 | Can change in a child component?             | Yes   | No    |

## Key Takeaway
Using `state` will help you manage data within a React component. Using `props` and `state` together is a powerful way to share and manage data between components. They each have their own purpose, but they can be used together to provide the most dynamic applications.

## Additional Resources
- [React Docs: State and lifecycle](https://reactjs.org/docs/state-and-lifecycle.html)
