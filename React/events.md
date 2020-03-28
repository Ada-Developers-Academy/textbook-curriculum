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

**Note** the arrow function syntax for this event handler function. You could define the event handler function `onButtonClick` as a regular function, but making it an arrow function in this case is a bit more condense and keeps the `this` context to the current component.  

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

#### Change the Name

Another variable that we store is the name. Unfortunately right now, we are passing the `fullName` from props and we **cannot** change the value of our props.  

**1.  Convert `fullName` from using props to state.**

This will require you to use `useState` a second time to set the student's fullName in state.  Then make sure it renders in the browser.

**2.  Add an input field with the value of the `fullName`**

Now we can add an input field and assign it the value of our `fullName` state variable.

```javascript
return (
    <div>
      <h3>{fullName}</h3>
      <input value={fullName} />
      <ul>
   ...
```

Notice however that changing the input doesn't change how `fullName` displays in the `h3` tag.  We need to add an `onChange` event handler to set the state when the input changes.

**3.  Make the state change when the input changes**

Next we will add an event handler function to change the state of `fullName` when the method is called.

```javascript
const onFullNameInputChange = (event) => {
  setFullName(event.target.value);
};
```

Pay attention to the way we've named this callback. Starting event handler names with `on` is a standard convention, and lets other programmers know your intent. The name also gives information about:

- What event happened (`change`)
- Which DOM element was the target of the event (the name input)

Next, we'll need to add the event handler function that our code will be called when the input is edited.

```javascript
      <input value={fullName} onChange={onFullNameInputChange} />
```

You can see the final version of this [code here](https://codesandbox.io/s/ada-students-with-state-and-events-08fui).

## Key Takeaway
We tie events to HTML elements in our JSX to handle changes in the state of our components. When we change state (using `setState`), the component will automatically re-render given it's updated values.

## Additional Resources
- [React Docs: Handling Events](https://reactjs.org/docs/handling-events.html)
- [Advanced Docs: Supported Events](https://reactjs.org/docs/events.html#supported-events)
- [React Armory: When should I use Arrow Functions?](https://reactarmory.com/answers/when-to-use-arrow-functions)
