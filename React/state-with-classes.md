# Managing State With Class Components

## Learning Goals

- Examine how React allows class components to manage data
- Use `state` within a class component
- Examine how `props` and `state` affect component rendering

## Review `state`

State is managed **within a given component**. In the functional components we have created state is retrieved using the `useState` hook, which returns the current state and a function to change the state.

In a class component state can be accessed using the `this.state` object and it can be modified using the `this.setState()` function.

#### Overview

In a class component state:

- `setState` will always take an object as the parameter
- `setState` will _merge_ any params passed in with the existing state data, it won't overwrite it
  - This is critically different from the `useState` hook which returns a function which will _replace_ the given state.  `setState` by contrast will only change the key-value pairs passed in.
- We often set the initial state in the constructor function

A really important aspect of state is that, just like a functional component, whenever the state of a component is changed, it will be **updated**, calling the `render` function. For now, you can think of `setState` as doing the `setState` operation PLUS the calling `render` _automatically_. We'll learn even more about what else our component does when it is updated later on.

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

## Triggering `setState` with user events

We can adjust our `NameDisplay` component to show/hide the name by adding a button and an event handler.  Notice how the event handler is an arrow function.

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

  onButtonClick = (event) => {
    event.preventDefault();

    this.setState({
      displayName: !this.state.displayName,
    });
  }

  render () {
    let display = 'Sorry, I don\'t know your name.';
    if (this.state.displayName) {
      display = `Hello, ${ this.state.name }.`;
    }
    return (
      <section>
        <div>
          {display}
        </div>
        <button onClick={this.onButtonClick}>
          {this.state.displayName ? 'Hide' : 'Show'} Name
        </button>
      </section>
    );
  }
}

export default NameDisplay;
```

First look at the JSX returned by the `render` method.  When the user clicks on the button an instance method called `onButtonClick` is called.  This is an arrow function and an instance method of the `DisplayName` component.  This method takes the event object and changes `display` field of state to be the opposite.

**Exercise** take the following component and add an event handler to increment the counter each time the button is clicked.

```javascript
import React, { Component } from 'react';

class Counter extends Component {
  constructor(props) {
    super(props);
    this.state = {
      counter: props.counter ? props.counter : 0,
    };
  }

  render () {
    return (
      <div>
        <p>Counter is {this.state.counter}</p>
        <button>Increment Counter</button>
      </div>
    );
  }
}

export default Counter;
```

You can check your answer against [our example](examples/Counter.js).

### `setState` is Asynchronous

Now consider if we wanted to increment the counter by 3 each time.  You could try this:

```javascript
  onButtonClick = (event) => {
    event.preventDefault();

    this.setState({
      counter: this.state.counter + 1,
    });
      this.setState({
      counter: this.state.counter + 1,
    });
      this.setState({
      counter: this.state.counter + 1,
    });
  }
```

This method **should** increase `state.counter` by three with each button click, but it doesn't.  Instead the counter increases by 1... why?  The answer is that **setState** is an asynchronous method.  React doesn't update and re-render the component immediately, but rather at some later time.  React does this to optimize performance and reduce the number of excess renders.  

It's unlikely that you would write sequential `setState` calls like the above, but if for example someone clicked the button faster than React could update state, or a similar event happens before React can update, this could lead to the last setState replacing the previous value.

So what do you do?

Instead you can pass `setState` in a function:

```javascript
  this.setState(function (previousState, props) {
    return {
      counter: previousState.counter + 1,
    }
  });
```

`setState` can be passed in a function which will take the current state and the current props as arguments and should return an object to update state with. 

## Key Takeaway

Class components provide an alternative to functional components.  In past versions of React, class components were the only way to manage state.  Now, hooks provide an alternative to `useState` for building stateful components.  `setState` is an asynchronous method and this can lead to unexpected side-effects.

## Additional Resources

- [React Docs: State and lifecycle](https://reactjs.org/docs/state-and-lifecycle.html)
