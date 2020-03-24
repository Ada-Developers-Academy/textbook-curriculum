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

### Calling useState

We can then call `useState` in our Student component.

```javascript
// src/components/Student.js
// ...
const Student = (props) => {

  const [present, setPresent] = useState(false);
  // ...
```

When we called `useState` above we passed in the initial value of the state.  In this example we are defaulting students to being not present (absent).

`useState` returns an array.  We could have written the above as `const presentArray = useState(false)` and then `presentArray[0]` would the the value and `presentArray[1]` would be a function to change the state, but again we are using a feature called destructuring to break that array into two variables `present` and `setPresent`.  This is a common technique when using hooks in React.

Then if we want to change the state of present to `true` we can use the `setPresent` function with:  `setPresent(true)`.  This will cause the state variable `present` to change and the Student function to execute again, which is called re-rendering.

### Adding a button to Student

So right now the Student component has state, but no way for the use to change the state in the browser.  We will add a button to the component as follows:

```javascript
// src/components/Student.js
// ...

const Student = (props) => {

  const [present, setPresent] = useState(false);
  // Component functions always return JSX
  return (
    <div>
      <h3>{props.fullName}</h3>
      <ul>
        <li>Class: C13</li>
        <li>Birthday: {props.birthday}</li>
        <li>Email: {props.email}</li>
      </ul>
      <button>
        Mark {present ? 'Absent' : 'Present'}
      </button>
    </div>
  );
};
```

Now the component renders with a button that displays "Mark" and either present or absent depending on the current value of `present`.  Try changing the default value of `present` and see the change in the browser.

### onClick Event

The button displays, but does not yet respond when the user clicks on it.  We can add a `onClick` attribute to the button and give it a function to execute when the button is clicked.

```javascript
// src/components/Student.js
// ...

const changePresent = () => setPresent(!present);

  // Component functions always return JSX
  return (
    <div>
      <h3>{props.fullName}</h3>
      <ul>
        <li>Class: C13</li>
        <li>Birthday: {props.birthday}</li>
        <li>Email: {props.email}</li>
      </ul>
      <button onClick={changePresent}>
        Mark {present ? 'Absent' : 'Present'}
      </button>
    </div>
```

Above we made a function, `changePresent` which calls `setPresent` and passes in the opposite of the current state.  Then we told the button when it is clicked to call that function.

You can also define the function directly in the JSX with an anynomous function like:

```javascript
<button onClick={() => setPresent(!present)}>
        Mark {present ? 'Absent' : 'Present'}
      </button>
```

Now whenever the user clicks on the button the student's present state toggles between true and false!

## Rules with Hooks

There are a few rules to keep in mind with hooks like `useState`.

### 1.  You must call hooks from the top-level of a component.

This means that you cannot put `useState` in a loop like this:

```javascript
  let i = 0;
  // Big NO NO!
  studentList.forEach((student) => {
    [counter, setCounter] = useState(i);  // will generate an error
    i += 1;
  });
```

**Why?**

React depends on the hook functions being called in a specific order when a functional component is run.  It will not allow you to put code into your component which could affect the order in which `useState` is called.  You cannot even put `useState` inside an if statement.

### 2.  You can only call hooks in functional components or other hooks

Creating your own hooks is a more advanced topic, but state is intended to provide a way for a component to have information it remembers and changes internally over time.  So it does not make sense for state to be used outside of a component.  Therefore only call `useState` inside a React component.  Later if you create your own hooks, you can call them there.

## Getting initial values from props

You can use props to set an initial value for the state of a component.  For example we can add a `present` field in `App.js` to give an initial attendance value for a Student.

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
