# Intro to Functions!

## Learning Goals

- Intro to syntax (defining and calling), exercise, functions with parameters, exercise
- Learn and practice the syntax for defining and calling/invoking functions in JavaScript
- Learn and practice the syntax for using functions that have parameters
- Understand that JavaScript requires explicit `return` calls

<!-- - Write and invoke some JavaScript functions
- Learn how JavaScript functions are different than Ruby methods
- Distinguish between a functional _expression_ and a function _declaration_
- Begin exploring what _higher order_ functions are -->

## Functions in JavaScript are like Methods in Ruby

In JavaScript, we can use functions to define reusable behavior.

This should _feel_ similar to methods in Ruby. They're not the same, but we can get into those details later. For now, we'll use functions to name and structure sections of code.

Either way, the syntax for functions is a lot different in JavaScript than in Ruby.

## Functions Are Objects, So We Assign Variables to Them

### Declare

All functions in JavaScript are objects. For now, what that means to us is that we will make sure that variables hold onto these functions. You declare functions with the `let` or `const` keywords and a name.

### Assign

On the right-hand side of the assignment operator, you set the value to be a function, with the `function` keyword.

Let's make a function named `bark`, whose responsibility is to print to the terminal the sound a dog makes.

How do we do that? Let's declare a `const` variable named `bark`, and set its value to the function named `bark`. After we start the function with the words `function bark()`, we open up a block of code with curly braces, and put the inners of the function within the `{}`.

```javascript
const bark = function bark() {
  console.log('Woof!');
};
```

Open the `node` REPL and copy-and-paste in the following expressions. What do you get?

1.
    ```javascript
    const bark = function bark() {
      console.log('Woof!');
    };
    ```
1. `bark;`

<details>

  <summary>
    Compare your answers here
  </summary>

  1. `undefined`
  1. `[Function: bark]`
</details>

### Calling a Function

We've defined a function, so how do we call it?

Unlike in Ruby, JavaScript requires you to type in parentheses if you want to invoke a function:

```javascript
bark();
```

### The Finer Details About Defining Functions

When we defined the function, we gave it the variable keyword `const`. We could have used `let` or `var`, but in general, we don't need any variable named `bark` to be reassigned. Because we don't need `bark` to every be reassigned, it makes sense to make it a constant.

On another note, what's up with `const bark = function bark() { ... }`? In Ruby, we've never had to write the method name more than once, _do we need to write `bark` so many times?_  This is optional, but it can allow us to provide a [longer-more descriptive name for the stack trace](https://github.com/airbnb/javascript/issues/794). **This form is going to be our best practice moving forward.**

### Exercise: Make An Animal Noise Function

Given the `bark` function as a model:

```javascript
const bark = function bark() {
  console.log('Woof!');
};
```

Create a script that does the following:

1. Create a `ribbit` function that prints a frog noise to the terminal
1. Call the `ribbit` function
1. Create an `oink` function that prints a pig noise to the terminal
1. Call the `oink` function
1. Create a third function that prints an animal noise to the terminal
1. Call that function 5 times!

## Functions Can Have Parameters

Functions that can take in parameters are very similar to how parameters for methods work in Ruby. To define that a specific function takes in an argument, we define the name of that parameter when we define the function.

Observe the example below, which defines a function named `sayItTwice`. Its responsibility is to take in some input, and then print it to the console twice.

It takes in one argument named `text`. We can use `text` as a local variable within the function.

```javascript
const sayItTwice = function sayItTwice(text) {
  console.log(text);
  console.log(text);
};
```

When we invoke the function `sayItTwice`, we pass in an argument in the parentheses:

```javascript
sayItTwice('JS is OK!');
```

We can define a function with multiple parameters by comma-separating them:

```javascript
const sayCompoundWord = function sayCompoundWord(prefix, suffix) {
  console.log(`${prefix}-${suffix}`);
}

sayCompoundWord("jean", "shorts");
```

## JavaScript Requires Explicit `return`s

Ruby had something called the _implicit_ return, and our best practice was to always explicitly return something with the `return` keyword.

Functions in JavaScript can return things too using the `return` keyword. We'll be using `return` a lot in JavaScript still!

However, **JavaScript requires explicit `return` statements.** If you need to return something out of a function, you must explicitly say `return`.

Open the `node` REPL and copy-and-paste in the following expressions. What do you get?

1.
    ```javascript
    const meow = function meow() {
      return 'mmMMMME-OW!';
    }
    ```
1. `let catNoise;`
1. `meow();`
1. `catNoise;`
1. `catNoise = meow();`
1. `catNoise;`

<details>

  <summary>
    Compare your answers here
  </summary>

  1. `undefined`
  1. `undefined`
  1. `'mmMMMME-OW!'`
  1. `undefined`
  1. `'mmMMMME-OW!'`
  1. `'mmMMMME-OW!'`
</details>


## Exercise: Make Calculator Functions

Create a script that does the following:

1. Create a `addNums` function that takes in two parameters (`a` and `b` are decent variable names here).
    - It prints out `"The value of a is: ${a}"`
    - It prints out `"The value of b is: ${b}"`
    - It `return`s the two parameters added together
1. Outside of the function, create a `const` variable named `sum` and set it to equal the result of `addNums(3, 5);`
1. After that, print the variable `sum` with the line `console.log(sum);`. Run the script to confirm it runs, and runs as expected.
1. Create a `subtractNums` function that takes in two parameters.
    - It prints out `"The value of a is: ${a}"`
    - It prints out `"The value of b is: ${b}"`
    - It `return`s the result of `a - b`
1. Outside of the function, create a `const` variable named `difference` and set it to equal the result of `subtractNums(3, 5);`
1. After that, print the variable `difference` with the line `console.log(difference);`. Run the script to confirm it runs, and runs as expected.
1. Create a `multiplyNums` function that takes in two parameters.
    - It prints out `"The value of a is: ${a}"`
    - It prints out `"The value of b is: ${b}"`
    - It `return`s the result of a and b multiplied together
1. Outside of the function, create a `const` variable named `product` and set it to equal the result of `multiplyNums(3, 5);`
1. After that, print the variable `product`
1. Run the script to confirm it runs, and runs as expected

Compare with a neighbor and check you're both in the right direction. Now, refactor:

1. Create a `printInputs` that takes in two parameters. It prints out `"The value of a is: ${a}"`. It prints out `"The value of b is: ${b}"`. It returns `null`.
1. Refactor the `addNums`, `subtractNums`, and `multiplyNums` functions to call `printInputs()` inside of it.
1. Delete any redundant code!

#### Attaching Functions to Objects
Like any other variable, you can include a function as member of an object. Recall: [Objects](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object) are similar to Ruby hashes, but much more versatile. They are declared with braces(`{}`). You can access properties in an Object with bracket notation (like an array) or dot notation.

Within an object itself, other members (such as properties) can be accessed through the `this` keyword, similar to Ruby's `self`.

```javascript
const animal = {
  species: 'dog',
  sound: 'woof',
  describe() {
    console.log(`A ${this.species} goes ${this.sound}`);
  }
};

animal.describe(); // "A dog goes woof"
```

<details>

  <summary>
    As with much of JavaScript, there's two versions of the syntax to define a function inside an object. Click here to expand and view the old (pre-2015) syntax.
  </summary>

  ```javascript
  // Old syntax for defining a function inside an object
  const animal = {
    // ...
    describe: function() {
      console.log(`A ${this.species} goes ${this.sound}`);
    }
  };
  ```

  It's just different enough to trip you up if you see it on Stack Overflow. In this course we'll be using the new-style syntax (the first example).

</details>
<br/>

While reviewing the first syntax, **ask yourself:** What is the value of the variable `animal`? What properties does it have? What is the value of those properties? In the code snippet `A ${this.species} goes ${this.sound}`, what is the value of `this.species` and the value of `this.sound`?

Be aware that JavaScript's `this` keyword has some strange behavior. Many times it won't refer to quite what you'd expect. This can be one of the most frustrating things about JavaScript, especially for a beginner, and we'll have more to say about it later. For now, just know that it's a thing that might come up.

### Passing Functions as Arguments
One of the big differences between Ruby and JavaScript is that in JavaScript, functions are objects. That means **you can pass functions as arguments to other functions.** A function that is passed as an argument is often referred to as a _callback function_, or sometimes just a _callback_.

```javascript
// Invoke the callback function on every number from 0 through 9,
// and print the results to the command line
const doMath = function doMath(callback) {
  for (let i = 0; i < 10; i += 1) {
    let result = callback(i);
    console.log(`${i}: ${result}`);
  }
};

const double = function double(number) {
  return number + number;
};

// Pass the function by name
doMath(double);
// Prints out:
// 1: 2
// 2: 4
// 3: 6
// ...
```

A programming language that allows you to pass functions around like this is said to support _higher order_ or _first-class_ functions. C, JavaScript and Python are examples of languages that support first-class functions; Ruby and Java are examples of languages that do not.

#### Anonymous Functions
You can also define an _anonymous_ callback function inside the argument list. This has a similar result to using a block in Ruby.

```javascript
// define a function inside the argument list
doMath(function(x) {
  return x * x;
});
// Prints out:
// 1: 1
// 2: 4
// 3: 9
// ...
```

Note the weird `});` on the last line. As with most syntactic sugar, anonymous functions can quickly become difficult to read, so use them judiciously.

#### Practical Example: `forEach` Loops
JavaScript's `forEach` is an example of a function that takes another function as an argument. Note how it behaves similarly to a block in Ruby.

```javascript
let data = [4, 7, 9, 12, 3, 18, 6];
let sum = 0;

// Another anonymous function
data.forEach(function (num) {
  sum += num;
});

let average = sum / data.length;
console.log(`Average is ${average}`);
```

### Functional Expressions vs. Function Declarations
Something that may come up in your exploration of JavaScript is the difference between a functional expression and a function declaration. A functional expression is what we've seen so far:

```javascript
// functional expression - this is the right way
const foo = function foo(bar) {

};
```

A functional declaration looks like this. Note the lack of `const` and a semicolon, and the different word order.

```javascript
// functional declaration - this is the wrong way
function foo(bar) {}
```

In many cases the differences are nominal, but every once in a while they'll bite you. The vast majority of the time, a functional expression is what you want. In other words, **always define your functions with the `const` keyword**. The declaration style (no `const`) should be avoided unless you have a good reason to use it.

If you're interested in more details, [this StackOverflow answer](http://stackoverflow.com/questions/3887408/javascript-function-declaration-and-evaluation-order) is one of the best we've seen in describing the difference and when it matters. We don't expect you to be able to recite the nitty gritty details, but we do expect you to be able to identify the two types of function and tell us which is correct.

## JavaScript Function Exercises
### Exercise #1: Create a ToDo object, with the following properties:
- `description` (string) - a description of the thing to do
- `assignee` (string) - the name of a person to do it
- `done` (boolean) - is the task done or not?
- `printStatus` (function) - print the description, assignee and status to the command line

### Exercise #2: Find the biggest number in the array
- Utilize the stub code below to complete the problem:
- `getBiggest` should accept an array as a parameter and return the largest number in the array

```javascript
let arrayOfNums = [2, 7, 7, 3, 9, 0, 1, 6, 8, 3, 8, 4, 7, 9];

const getBiggest = function getBiggest(array) {
  // your code goes here!!
};

//
// pass an array to getBiggest;
// get a return value that is the biggest number in the array
//
let biggest = getBiggest(arrayOfNums);
console.log(`The biggest is: ${biggest}`);
```

## Vocab List

- The `this` keyword
- Callback function
- Anonymous function
- "Higher order" or "first-class" functions
- Functional expression
- Function declaration

## Additional Resources
* [MDN on Functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Functions)
