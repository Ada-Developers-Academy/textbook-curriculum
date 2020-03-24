# Event Handling

## Learning Goals
- Use an event handler to handle a change on a component's element
- Modify `state` via an event handler

### Overview
React supplies support on many different events. We'll focus on a few of the common events, keyboard and click, but just know that you should reference the [full list](https://reactjs.org/docs/events.html#supported-events) if you want more information.

### Context

In this lecture, we are going to expand upon the `Student` component that we created in the [state lecture](state.md). This was a great component that we created that was storing a student's present status in the component. We used the boolean in the function to determine what to display.

### Adding More Meaning

#### Toggle our Boolean

The boolean value that we're storing in the state seems a little bit useless right now. We set it to `true` as an initial value and we don't ever change it! We have a button and it doesn't do anything!  Next we will add code to change the state of `present` when the button is clicked on.

### onClick Event

Now we'll add the `onClick` attribute to the button whose value will refer to an event handler function that we will create next.

```javascript
// src/components/Student.js
// ...

// Function to toggle present
const onButtonClick = () => onButtonClick(!present);

  // Component functions always return JSX
  return (
    <div>
      <h3>{props.fullName}</h3>
      <ul>
        <li>Class: C13</li>
        <li>Birthday: {props.birthday}</li>
        <li>Email: {props.email}</li>
      </ul>
      <button onClick={onButtonClick}>
        Mark {present ? 'Absent' : 'Present'}
      </button>
    </div>
```

**Pause here** for a moment with the person sitting next to you. What is this code doing? Refer back to the [state lecture](state.md) if you can't remember what the `setPresent` function is supposed to do.

**Note** the arrow function syntax for this event handler function. You could define the event handler function `onButtonClick` as a regular function, but making it an arrow function in this case is a bit more condense and keeps the `this` context to the current component.  In [class components](class-components.md), you **must** define event handlers as arrow functions because you need to ensure that `this` refers to the current component.

Now that we have an event handler function defined and tied to this button, let's take a look at our application running on the server to see what the result is. What happens when the button is clicked?

Above we made a function, `onButtonClick` which calls `setPresent` and passes in the opposite of the current state.  Then we told the button when it is clicked to call that function.

Now whenever the user clicks on the button the student's present state toggles between true and false!

**Questions**:
1. Based on the code above, what is the name of the function that we want to create to handle the event when this button is clicked?
2. Is the function being **called** when it is tied to the event?

This function is not called immediately instead it is passed into the button to be called when click events occur.  This type of function is termed a _callback function_ that won't be executed until the event occurs. This is the same for all events defined here in our React components.

### onClick with an anynomous function

You can also define the function directly in the JSX with an anynomous function like:

```javascript
<button onClick={() => onButtonClick(!present)}>
        Mark {present ? 'Absent' : 'Present'}
      </button>
```

That is because it is a _callback function_ that won't be executed until the event occurs. This is the same as our events defined here in our React components.

Within our component (usually after the `constructor` and before the `render`), we'll add the event handler function that our code will call when the button is clicked.  

```javascript
// between constructor and render
onButtonClick = () => {
  this.setState({ displayName: !this.state.displayName });
}
```

**Pause here** for a moment with the person sitting next to you. What is this code doing? Refer back to the [state lecture](state.md) if you can't remember what the `setState` function is supposed to do.

**Note** the arrow function syntax for this event handler function. This is not optional. This is necessary for us to be able to use the `this.setState` function when this callback function is executed.

Now that we have an event handler function defined and tied to this button, let's take a look at our application running on the server to see what the result is. What happens when the button is clicked?

#### Change the Name
Another `state` variable that we store is the name. Unfortunately right now, we can only choose what the name is right at the beginning, but there is no option for us to change it (and therefore the display) later on. We're going to add an input box on which we'll handle the `onChange` event to affect the state.

Let's add an input box!

```javascript
render() {
  return (
    ...
    Change your name: <input onChange={ this.onNameChange }></input>
  );
}
```

Pay attention to the way we've named this callback. Starting event handler names with `on` is a standard convention, and lets other programmers know your intent. The name also gives information about:
- What event happened (`change`)
- Which DOM element was the target of the event (the name input)

Next, we'll need to add the event handler function that our code will call when the button is clicked. Again, make note of the arrow function syntax.

```javascript
// somewhere between constructor and render
onNameChange = (event) => {
  // Write your code here!!
}
```

**Exercise:** Take a few minutes with your neighbors to figure out how to access the input box's value (from the  `event` parameter) and use `setState` to update the name accordingly.


You can see the final version of this [code here](https://codepen.io/adadev/pen/ELpvyM?editors=0011).

## Key Takeaway
We tie events to HTML elements in our JSX to handle changes in the state of our components. When we change state (using `setState`), the component will automatically re-render given it's updated values.

## Additional Resources
- [React Docs: Handling Events](https://reactjs.org/docs/handling-events.html)
- [Advanced Docs: Supported Events](https://reactjs.org/docs/events.html#supported-events)
- [React Armory: When should I use Arrow Functions?](https://reactarmory.com/answers/when-to-use-arrow-functions)
