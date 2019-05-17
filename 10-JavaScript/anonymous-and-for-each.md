# Anonymous Functions and `forEach` Loops

## Learning Goals

- Explore that functions can be defined and used inline, in a pattern we call _anonymous functions_
- Recognize the syntax of anonymous functions
- Practice writing anonymous functions in `forEach` loops

## Sometimes It's Not Worth A Name

Callback functions, aka functions that are passed in as an argument to another function, are used often in JavaScript. It's a cool, powerful ability to be able to pass around functions into different functions, and we'll do it a lot!

We do it so often, that sometimes it isn't worth naming the function. Sometimes, we know that a callback function passed into another function will only be used once, and it sure would be nice to bypass the whole ceremony of declaring and assigning.

You can do this by defining an anonymous callback function inside the argument list itself:

```javascript
const doMath = function doMath(operation) {
  for (let i = 0; i < 10; i += 1) {
    let result = operation(i);
    console.log(`${i}: ${result}`);
  }
};

doMath(function(num) {
  return num * num;
});
```

Note the weird `});` on the last line. As with most syntactic sugar, anonymous functions can quickly become difficult to read, so use them judiciously.


Answer the following questions:

1. For the `doMath` function, how many parameters does it take in, what are the names of the parameters, and what data type are we expecting for each parameters?
1. What line _invokes_ the `doMath` function? What do we pass in as an argument? What data type is that argument?
1. Where is the anonymous function? For the anonymous function, how many parameters does it take in, what are the names of the parameters, and what data type are we expecting for each parameters?
1. What does the anonymous function do?
1. In the `doMath` function, how do we use the variable `operation`?
1. What does running this script print out?

<details>

  <summary>
    Check your answers here!
  </summary>

  1. 1 parameter named `operation` that is a function
  1. `doMath(...)`. We pass in an anonymous function as an argument.
  1. The anonymous function is in the line where we invoke `doMath()`. It takes in 1 parameter named `num` that is a number
  1. The anonymous function squares the number (multiplies it with itself)
  1. Because `operation` is a function, we _invoke_ the `operation` function with `let result = operation(i);`
  1.
      ```bash
      0: 0
      1: 1
      2: 4
      3: 9
      4: 16
      5: 25
      6: 36
      7: 49
      8: 64
      9: 81
      ```

</details>

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
