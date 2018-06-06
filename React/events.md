# Event Handling

## Learning Goals
- Use an event handler to handle a change on a component's element
- Modify `state` via an event handler

### Overview
React supplies support on many different events. We'll focus on a few of the common events, keyboard and click, but just know that you should reference the [full list](https://reactjs.org/docs/events.html#supported-events) if you want more information.

### Context
In this lecture, we are going to expand upon the `NameDisplay` component that we created in the [state lecture](state.md). This was a great component that we created that was storing a name and a boolean in the state. We used the boolean in the render function to determine what to display.

### Adding More Meaning
#### Toggle our Boolean
The boolean value that we're storing in the state seems a little bit useless right now. We set it to `true` within the constructor and we don't ever change it! We will set up a button and handle the `onClick` event to affect the state within this component.

Let's add a button that we will use to toggle the display of the name variable. We'll first add the button element within the `return` of our `render` function. Then we'll add the `onClick` attribute whose value will refer to an event handler function that we will create next.

```javascript
// NameDisplay.js
  render() {
    return (
      ...
      <button onClick={ this.onButtonClick }>Toggle Display</button>
    );
  }
```

**Questions**:
1. Based on the code above, what is the name of the function that we want to create to handle the event when this button is clicked?
2. Is the function being **called** when it is tied to the event?

**Think back!**

When we set up events in jQuery, recall that we would tie a function to the event, but we would never **call it**.

```javascript
$(li).click(myFunction)
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

**Exercise:** Take a few minutes with your seat squad to figure out how to access the input box's value (from the  `event` parameter) and use `setState` to update the name accordingly.


You can see the final version of this [code here](https://codepen.io/adadev/pen/ELpvyM?editors=0011).

## Key Takeaway
We tie events to HTML elements in our JSX to handle changes in the state of our components. When we change state (using `setState`), the component will automatically re-render given it's updated values.

## Additional Resources
- [React Docs: Handling Events](https://reactjs.org/docs/handling-events.html)
- [Advanced Docs: Supported Events](https://reactjs.org/docs/events.html#supported-events)
- [React Armory: When should I use Arrow Functions?](https://reactarmory.com/answers/when-to-use-arrow-functions)
