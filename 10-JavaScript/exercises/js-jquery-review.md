# JavaScript and jQuery Review

## Learning Objectives

- Review JavaScript syntax
- Review functions
- Review using jQuery to manipulate the DOM

## Fundamentals Questions

For the following section, practice the following process with your seat squad:
- Read the question with your seat squad
- Answer it on your own
- Check the answer
- Check-in with your seat squad: Do you or your seat squad have any questions?

---
1. What is the following code snippet doing?

```javascript
const createCakeLabel = (ingredients) => {
  return `Delicious ${ingredients[0]} Cake 🍰. Ingredients: ${ingredients}`;
}

const groceries = ['strawberries', 'sugar', 'eggs', 'flour', 'cream'];

createCakeLabel(groceries);
```

<details>

  <summary>
    Click here for the answer
  </summary>

  First it defines an arrow function `createCakeLabel`. This function takes in one parameter: `ingredients`. It returns a string that interpolates cake type and the ingredients.
  <br/>
  Then it defines a `const` variable `groceries`, which is an array of strings.
  <br/>
  Lastly, it _invokes_ or _calls_ the method `createCakeLabel` and _passes in_ `groceries`

</details>

---

2. The following two code snippets are doing different things. What is the difference?

A:

```javascript
const sayHi = () => {
  return 'hi';
}

const sayLoudGreeting = () => {
  console.log( sayHi().toUpperCase() );
}

sayLoudGreeting();
```

B:

```javascript
const sayHi = () => {
  return 'hi';
}

const sayLoudGreeting = (callGreeting) => {
  console.log( callGreeting().toUpperCase() );
}

sayLoudGreeting( sayHi );
```

<details>

  <summary>
    Click here for the answer
  </summary>

  In both, calling `sayGreeting()` calls `console.log`.

  <br>

  In A, in `sayGreeting`, it will `console.log` the evaluation of `sayHi().toUpperCase()`, and it will call `sayHi()` directly. Calling `sayGreeting` does not take in an argument.

  <br>

  In B, in `sayGreeting`, it takes in one parameter: a function named `callGreeting`. In B, we invoke `sayGreeting` with the function `sayHi`. We do not invoke `sayHi` the function at that time. We only invoke `sayHi` when there are parentheses next to it: for example `sayHi()`. `console.log` will log the evaluation of `callGreeting().toUpperCase()`. It does not call `sayHi()`, but instead it calls the function `callGreeting`.
</details>

---

3. How are arrow functions and non-arrow functions similar? How are arrow functions different from non-arrow functions? Do we have a preference for one syntax over the other here at Ada?

<details>

  <summary>
    Click here for the answer
  </summary>

  Arrow functions and non-arrow functions both are valid syntaxes to define functions. They are different in how they look. Also, arrow functions do not have their own `this`. We prefer arrow function syntax at Ada.

</details>

---

4. In what ways have we seen that JavaScript and Ruby are different? In what ways have they been the same?

<details>

  <summary>
    There's actually no answer for this one, please just discuss it a little with your seat squad. :)
  </summary>

  :) :) :)

</details>


## Exercise

[Use this linked Codepen for the following exercise](https://codepen.io/adadev/pen/eQGryE).

Use JavaScript and jQuery to complete this exercise. The HTML and CSS is already provided and shouldn't be altered.

Given the following data in the array `pixels`, display the information onto the page. For each number in `pixels`, create an HTML element (`div` will be fine) that is "on" or "off". A zero means that the element should have the class `off`. A 1 means it should have the class `on`. If you add these pixels in order to the existing `.pixels__container`, you should see something interesting.

Try making one or more versions of solutions that include:

1. if/else conditionals
1. switch (case) statements
1. ternary
1. a helper function

<!-- Solution: https://codepen.io/adadev/pen/KrXRxW -->
