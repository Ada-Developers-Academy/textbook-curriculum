# Intro to Functions!

## Learning Goals

- Learn and practice the syntax for defining and calling/invoking functions in JavaScript
- Learn and practice the syntax for using functions that have parameters
- Understand that JavaScript requires explicit `return` calls

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

When we defined the function, we gave it the variable keyword `const`. We could have used `let`, but in general, we don't need any variable named `bark` to be reassigned. Because we don't need `bark` to ever be reassigned, it makes sense to make it a constant.

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

## Additional Resources
* [MDN on Functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Functions)
