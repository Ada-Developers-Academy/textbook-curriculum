# Closures Continued

## Introduction

Often when building a single page application, you will need to have many UI elements that each do something similar. An example of this is a list of contacts, where clicking on the name of a contact pops up a modal showing details.

A simpler example is a set of buttons which can each change the color of a box on the screen, [as in this codesandbox](https://codesandbox.io/s/kind-ritchie-6z3dz). Don't worry too much about the code itself yet, just the functionality of the buttons.

Because the UI elements have such similar behavior, we want to use the same function to handle each one. However, that function needs to know a little bit of extra information about which element it's attached to. This is where closures come in.

**A closure is a way to attach some extra information to a function.**


Doing event handling in the browser is something new and we will handle it a bit differently in React.  However these are common use-cases where people take advantage of closures when interacting with the DOM.

## Closures with vanilla (plain) JavaScript

Now that we've explored the concepts behind closures a bit, let's return to our [original example with the buttons](https://codesandbox.io/s/kind-ritchie-6z3dz).

With your neighbors, look at the JavaScript code in that pen, open your Dev Tools to see the console, and answer the following questions:

- Where is the closure created?
- What is the outer function?
- What is the inner function?
- What variable from the outer function is being referenced in the inner function?
- How many different click handlers are created by this code?

## JavaScript in the browser

### Where the code starts running

The code below tells Javascript to call `mainFunction` after the HTML page has finished loading.

```javascript
// Run the main function only after the HML has loaded
if (document.readyState === "loading") {
  // Loading hasn't finished yet
  document.addEventListener("DOMContentLoaded", mainFunction);
} else {
  // `DOMContentLoaded` has already fired
  mainFunction();
}
```

### The mainFunction

The `mainFunction` takes a list of colors and loops through them.  It finds an HTML element with the CSS selector `button.${color}`.  Then it creates a click handler for that color (more later).  Lastly it tells the browser that when that element is clicked (the click event) run the `clickHandler` function.

```javascript
const mainFunction = () => {
  ["red", "blue", "green"].forEach(color => {
    const element = document.querySelector(`button.${color}`);

    const clickHandler = buildClickHandler(color);

    element.addEventListener("click", clickHandler);
  });
};
```

### The buildClickHandler

The `buildClickHandler` function takes a color as a parameter and returns an **inner function** which:

1.  Finds the HTML element with the id `square`.
2.  Removes any class on that element
3.  Sets the class to be the same name as the color.

So this `buildClickHandler` creates a closure when called.  The extra information the returned function provides is the color to make the square.

## Exercise: Reading Closures

Take a look at the following code sanboxes:

- [Adder](https://codesandbox.io/s/makeadder-98hn4)
- [Stopwatch](https://codesandbox.io/s/stopwatch-nyd9o)
- [Helpful Hints](https://codesandbox.io/s/helpful-hints-f9utb)

With your neighbors, walk through the code and be able to identify in each example:

1. Where is the closure?
1. What does the code do?
1. How does the closure take advantage of the outer function's variables?
1. How does the inner function "get out" of the outer function? Pay special attention to `Stopwatch` and `Helpful Hints`.

## Exercise: Writing Closures

Open up the following [code sanbox](https://codesandbox.io/s/button-clicks-joh02) and fork the project.

You will see the HTML has 3 buttons.  

```html
    <section id="buttons">
      <button id="button-1">Click count: 0</button>
      <button id="button-2">Click count: 0</button>
      <button id="button-3">Click count: 0</button>
    </section>
```

Questions:  

  - How could you write code to select each of the buttons in a loop?
  - How would you change the text inside a button?

### Exercise Description

You want to write code to make the buttons track the number of times each were clicked. 
 
- Write JavaScript code to add a click event handler to each button that will keep track of how many times it has been clicked
- Use the examples above as a guide
- How would you need to change your code to display 1000 buttons?

When you finish or if you get stuck after 20 minutes you can check out our [solution](https://codesandbox.io/s/button-clicks-c99v2).