# Event Handling

## Learning Goals
- Use an event handler to handle a change on a component's element
- Modify state via an event handler

### Overview
React supplies support on many different events. We'll focus on a few of the common events, keyboard and click, but just know that you should reference the [full list](https://reactjs.org/docs/events.html#supported-events) if you want more information.

### Context
In this lecture, we are going to create a thrilling application that will make us happy by adding SPLATS to our page.

For this exercise, we'll start with a basic component definition: https://codepen.io/adadev/pen/qYBGWV?editors=0010. We're going to use a CodePen just for simplicities sake so we don't have to create a brand new React application.

We're going to add the functionality to the button so that when it is clicked, it will add a new SPLAT graphic.

### Event Handler
Let's start with a common event, `onClick`. This should look familiar since we've used a similar event in jQuery. We will add this event directly to the HTML element in the `render` function. Note that this is one of many places where we might overlap HTML with JavaScript in a component.

```html
<button onClick={}>Add a Splat</button>
```

Next, we should create an event handler function that we will then link up with this `onClick` event. We'll fill it with a basic logging statement to start so we can verify the linking between the button and the event handler function.

```javascript
handleAdd(){
  console.log("We are in the handle add!");
}
```

How should we then link the event handler function with the button's `onClick` event?

<details>
  <summary>click to see the result</summary>

  ```html
  <button onClick={ this.handleAdd }>Add a Splat</button>
  ```

</details>



**Verify!** Open the developer console in the browser (we'd recommend on the right hand side of the screen when using CodePen) and verify that you see the console message.

### Event Handler Functions

### Exercise

Add a button that will allow you to clear all of the splats that have been added.

### Passing Event Handlers as `props`


## Vocabulary
| Term     | Definition     |
| :------------- | :------------- |
| Item One       | Item Two       |

## Key Takeaway
Description of one or two sentences with key takeaway.

## Additional Resources
- [React Docs: Handling Events](https://reactjs.org/docs/handling-events.html)
- [Advanced Docs: Supported Events](https://reactjs.org/docs/events.html#supported-events)
