# Fun with Functions!

## Learning Goals
- Write and invoke some JavaScript functions
- Learn how JavaScript functions are different than Ruby methods
- Distinguish between a functional _expression_ and a function _declaration_
- Begin exploring what _higher order_ functions are

## Using Functions in JavaScript
The syntax for functions is a lot different in JavaScript than in Ruby.

### Defining Functions
All functions in JavaScript are variables. Just like any other variable, you declare functions with the `let` or `const` keywords and a name, but you set the value to be a function instead of a number or a string.

How do you set the value to be a function? With the `function` keyword of course!

```javascript
const bark = function bark() {
  console.log('Woof!');
};
```

**Note** we declared the function `bark` here with `const`.  We could have used `let` or `var`, but because we don't want `bark` to be reassigned, it makes sense to make it a constant.  We also added the function name to the right of the `function` keyword.  This is optional, but it can allow us to provide a [longer-more descriptive name for the stack trace](https://github.com/airbnb/javascript/issues/794).

#### Calling a Function
Unlike in Ruby, JavaScript requires you to type in parentheses if you want to invoke a function. You can access functions like you would any other variable:

```javascript
bark(); // "Woof!"
```

#### Parameters
Parameters are very similar to how they work in Ruby:

```javascript
const sayItTwice = function sayItTwice(text) {
  console.log(text);
  console.log(text);
};

sayItTwice('JS is OK!'); // "JS is OK!"
                         // "JS is OK!"
```

#### Default Function arguments

Sometimes, you may want to provide a default value in case a user does not specify an argument.  Just as with Ruby, JavaScript functions can take default Arguments.  You specify the default value for a parameter by setting the variable equal to a value in the function header's parentheses.

```javascript
const sayItTwice = function sayItTwice(text = 'JS is Awesome') {
  console.log(text);
  console.log(text);
};

sayItTwice();                   // "JS is Awesome"
                                // "JS is Awesome"
sayItTwice('JS is wonderful');  // "JS is wonderful"
                                // "JS is wonderful"
```

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
