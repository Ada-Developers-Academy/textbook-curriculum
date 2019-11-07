# More Intro to JavaScript: Variables, Conditionals, and Iteration

## Learning Goals

- Recognize the difference of declaration and assignment in JavaScript
- Know that the different types of variables in JavaScript differ in scope and assignment
- See the different syntax to declare the different types of variables in JavaScript
- Understand that we prefer `let` and `const` variables in JavaScript
- Gain exposure in how to do conditional logic in JavaScript
- Gain exposure to how to do some kinds of iteration in JavaScript with `for` and `while`

## We Declare Variables, Then Assign (Then Maybe Re-Assign)

We've dealt with variables in Ruby plenty! We've made them, assigned them a value using the assignment operator (`=`), and modified them.

```ruby
my_favorite_greeting = "Hello World!"
```

All of those concepts hold up in JavaScript. We will continue to declare variables, assign values to these variables, re-assign them.

However, in JavaScript, it's worth it to know that we have two distinct steps when dealing with variables: **declaration** and **assignment.** There are formal definitions of _declaration_ we could get into, but for now, let's think of it this way:

In JavaScript, when we create a new variable with a new name, we need to declare it first. When we declare it, we want to give it two things:
1. A unique name for the variable
1. A variable keyword that will determine some of its properties around scope and re-assignment

This is an example of variable declaration:

```javascript
let myFavoriteGreeting;
```

Giving a variable a unique name is something we do all the time in Ruby. The second principle is a detail that we'll get into soon.

To _use_ this declared variable, we can _assign_ a value to it using the assignment operator (`=`), just like in Ruby. We can continue to re-assign its value using the assignment operator.

```javascript
let myFavoriteGreeting; // <- declaration
myFavoriteGreeting = 'Hello World'; // <- assignment
```

We only need to declare a variable once. We never need to re-declare it.

### We Can Do Declaration and Assignment Together

By the way, we can do declaration and initial assignment on one line:

```javascript
let clicheGoodbye = 'Don\'t forget to like and subscribe';
```

## Variables

> What's the syntax for defining a variable in this language? What's the syntax for accessing them?

> _-- Some cool programmer learning a new language_

In JavaScript, in order to define a variable, we do explicit variable declaration.

There are three keywords to use to declare a variable, all specifying different things:

1. `var`
1. `let`
1. `const`

Observe variable declaration and assignment below:

```javascript
var deesFavoriteColor = 'green';
let deesFavoriteNumber = 72;
const deesFavoriteGame = 'night in the woods';
```

### We Prefer `let` for Reassignable Variables

`var` and `let` declare variables that can be re-assigned. `var` and `let` mean subtly different things, both having to do with [scope](https://stackoverflow.com/questions/762011/whats-the-difference-between-using-let-and-var-to-declare-a-variable) which we'll get to later.  **A good rule of thumb and our best practice moving forward is to always use `let` for variables we expect to be re-assigned.**

`var` was the normal keyword to use in older versions of JavaScript. It may make sense to use `var` if you are working with an older version of the JavaScript interpreter. You may also see `var` when looking at old Stack Overflow posts.

### We Prefer `const` for All Other Variables

Constants cannot change their value through reassignment. **We will always use `const` for variables we expect to not be re-assigned.** You should _always_ be using `const` by default, unless there's a good reason for that variable to be reassigned. Start every variable as `const`, and then refactor to `let` if you need to.

In your Node REPL, input these lines. Do you get what you expect?

1. `var deesFavoriteColor = 'green';`
1. `deesFavoriteColor;`
1. `let deesFavoriteNumber = 72;`
1. `deesFavoriteNumber;`
1. `const deesFavoriteGame = 'night in the woods';`
1. `deesFavoriteGame;`
1. `deesFavoriteNumber = 16;`
1. `let deesFavoriteNumber;`
1. `deesFavoriteGame = 'butterfly soup';`

<details>

  <summary>
    Compare your answers here
  </summary>

  1. `undefined`
  1. `'green'`
  1. `undefined`
  1. `72`
  1. `undefined`
  1. `'night in the woods'`
  1. `16`
  1. `Thrown: SyntaxError: Identifier 'deesFavoriteNumber' has already been  declared` You only need to do the variable declaration (using `let` or `const`) once. You can just re-assign a `let` variable without the keyword `let`.
  1. `Thrown: TypeError: Assignment to constant variable.` You can't re-assign a `const` variable.

</details>

### Always Declare!

Declaring a variable without one of these three keywords creates a global variable, which is bad practice and leads to unintended consequences-- don't do it!

## Playing with Multi-Line JavaScript

We are now in the zone where what we want to learn about JavaScript is going to take multiple lines, so working with the Node REPL will be frustrating.

From now on:

1. We'll be making JavaScript files with a `.js` extension
1. Running these files from the terminal with `$ node file.js`
1. Printing to the terminal using `console.log()` (much like `puts`)

Observe the following:

```bash
$ touch intro-to-javascript.js
```

Copy and paste the following code into `intro-to-javascript.js`:

```javascript
const testVariable = 'Hello World!';
console.log(testVariable);
```

```bash
$ node intro-to-javascript.js
```

## Conditionals

[We can do `if ... else` logic in JavaScript!](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/if...else)

We use the keywords `if`, `else if`, and `else`. Note `else if` instead of `elsif` like in Ruby!

Conditional expressions are surrounded by parenthesis `()` and each block is surrounded by brackets `{}`.

To test equality, we use `===`. Note triple instead of `==` like in Ruby!

```javascript
const babyAnimal = 'kitten';
let animal;

console.log(`What's the adult name for a ${babyAnimal}?`);

if (babyAnimal === 'puppy') {
  animal = 'dog';
} else if (babyAnimal === 'kitten') {
  animal = 'cat';
} else {
  animal = `I have no idea what ${babyAnimal} is!`;
}

console.log(animal);
```

**Note:** `==` _does_ exist in JavaScript, but it doesn't do exactly the same thing that `==` does in Ruby. Again: to test equality, we use `===`. Do some research as to _why_!

### Exercise

Based off of the `babyAnimal` code above, copy and paste it into your own file on your own machine and run it.

Then, change the value of `babyAnimal` in line 1 so it is not `'kitten'`, but so the overall script prints out `'dog'` when we run it.

Then, change the value of `babyAnimal` in line 1 so it prints out the `'I have no idea what'` line.

### Ternary

JavaScript also has the ternary operator, which we all adore, amirite?

```javascript
const someonesAge = 50;
const isAdult = (someonesAge > 18) ? 'yes' : 'no';
console.log(`Are they an adult?: ${isAdult}`);
```

## Iteration

How do we iterate over data in JavaScript? We will begin to learn about iteration in JavaScript with `for` loops and `while` loops.

### `for` Loop

[The basic `for` loop](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/for) looks something like this:

```javascript
for (initialization; condition; increment) {
  // do iteration work!
}
```

Looks similar to a conditional! This syntax comes from the programming language C. There's not a direct equivalent in Ruby, but it's common in many other languages. Aside from the keyword `for` and all the parentheses, there are three main components, separated by _semicolons_:
- **Initialization:** Runs before the loop, often used to set up a counter variable
- **Condition:** Runs before each iteration (including the first), determines whether the loop should keep going
- **Increment:** Runs after each iteration, sets up the following iteration

Here's an example:

```javascript
for (let i = 0; i < 5; i += 1) {
  console.log(`Iteration ${i}`);
}
```

To point out the three components:
- **Initialization:** `let i = 0`
- **Condition:** `i < 5`
- **Increment:** `i += 1`

Before running this code, predict the answers for the following questions:

1. How many times will this for loop run? How do you know this?
1. What will it print out?

<details>

  <summary>
    Now run it, and compare your answers here!
  </summary>

  1. `i` will start at zero. It will go up by one with each iteration. The for loop goes as long as `i` is less than five. The loop will go five times.
  1.
      ```
      Iteration 0
      Iteration 1
      Iteration 2
      Iteration 3
      Iteration 4
      ```

</details>

<br/>

**Question:** Take one minute. What is one way you could write this in Ruby?

### `for...in` Loop

Another kind of `for` loop in JavaScript is the `for...in` loop.  This loop iterates through the keys or indicies of an object or array.

```javascript
const list = ['Ada', 'Jacob', 'Babbage', 'Grace'];
let string = '';

for(element in list) {
  string += element;
  if (element < list.length -1)
  string += ', ';
}
console.log(string); // '0, 1, 2, 3'

const student = {
  classRoom: 'Ports',
  cohort: '11',
  name: 'Betty Holberton'
};


for (let key in student) {
  console.log(`Your ${key} is ${student[key]}`);
}
// Output:
// Your classRoom is Ports
// Your cohort is 11
// Your name is Betty Holberton
```

### `while` Loop

JavaScript also uses the `while` loop in a similar way to the way we use it in Ruby.

```javascript
let i = 0;
while (i < 10) {
  console.log(`Iteration ${i}`);
  i += 1;
}
```

Before running this code, predict the answers for the following questions:

1. How many times will this while loop run? How do you know this?
1. What will it print out?

<details>

  <summary>
    Now run it, and compare your answers here!
  </summary>

  1. `i` will start at zero. It will go up by one with each iteration. The while loop goes as long as `i` is less than ten. The loop will go ten times.
  1.
      ```
      Iteration 0
      Iteration 1
      Iteration 2
      Iteration 3
      Iteration 4
      Iteration 5
      Iteration 6
      Iteration 7
      Iteration 8
      Iteration 9
      ```

</details>

<br/>

**Question:** Take one minute. What is one way you could write this in Ruby?

### [The `forEach` loop](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach)

JavaScript has a `forEach` loop that allows you to iterate over the elements of an array, similar to Ruby's `each` loop. However, there are some substantial differences - `forEach` takes a function as an argument.

Since we haven't learned about those yet we'll hold off on showing the syntax until later.

## Summary: The Variables/Conditionals/Iteration Ruby vs. JavaScript Abbreviated List

| Concept | Things to note about Ruby vs. JavaScript |
| --- | --- |
| Variable declaration | In JavaScript, we declare each variable them ONCE with the keywords `var`, `let`, and `const`.  You should _always_ be using `const` by default, unless there's a good reason for that variable to be reassigned. Start every variable as `const`, and then refactor to `let` if you need to.
| Printing to the terminal | In JavaScript, we use `console.log()` and put in our things to print in the parens `()`
| Conditionals Syntax | We use `if ... else if ... else` in JavaScript. There are a lot more parentheses and curly braces, too.
| String Equality | In JavaScript, to check if two strings are equal, we use `===`
| Iteration Syntax | We will use `for`, `while`, and `forEach` loops in JavaScript to iterate. There are a lot more available, too!
