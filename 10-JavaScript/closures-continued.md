# Closures Applied

## Introduction

Often when building a single page application, you will need to have many UI elements that each do something similar. An example of this is a list of contacts, where clicking on the name of a contact pops up a modal showing details.

A simpler example is a set of buttons which can each change the color of a box on the screen, [as in this codepen](https://codepen.io/adadev/pen/ZmbMdq). Don't worry too much about the code itself yet, just the functionality of the buttons.

Because the UI elements have such similar behavior, we want to use the same function to handle each one. However, that function needs to know a little bit of extra information about which element it's attached to. This is where closures come in.

**A closure is a way to attach some extra information to a function.**

## Closures with jQuery

Now that we've explored the concepts behind closures a bit, let's return to our [original example with the buttons](https://codepen.io/adadev/pen/ZmbMdq).

With your neighbors, look at the JavaScript code in that pen, open your Dev Tools to see the console, and answer the following questions:

- What is the outer function?
- What is the inner function?
- What variable from the outer function is being referenced in the inner function?
- How many different click handlers are created by this code?

## Exercise: Reading Closures

Take a look at the following codepens:

- [Adder](https://codepen.io/adadev/pen/gXXaQm?editors=0010)
- [Stopwatch](https://codepen.io/adadev/pen/GwpXmJ?editors=1010)
- [Helpful Hints](https://codepen.io/adadev/pen/EbbVqq?editors=1010)

With your neighbors, walk through the code and be able to identify in each example:
1. Where is the closure?
1. What does the code do?
1. How does the closure take advantage of the outer function's variables?
1. How does the inner function "get out" of the outer function? Pay special attention to `Stopwatch` and `Helpful Hints`.

## Exercise: Writing Closures

- Start a new codepen (or a new HTML/JS project on your computer)
- Add jQuery to the project (on codepen you can do this through the settings menu)
- Add the following HTML:
    ```html
    <section id="buttons">
      <button id="button-1">Click count: 0</button>
      <button id="button-2">Click count: 0</button>
      <button id="button-3">Click count: 0</button>
    </section>
    ```
- Write JavaScript code to add a click event handler to each button that will keep track of how many times it has been clicked
- How would you need to change your code to display 1000 buttons?