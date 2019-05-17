# Functions are First-Class

## Learning Goals

- Understand that first-class/higher-order functions allow us to attach functions to objects
- Practice creating objects that have functions as members
- Understand that first-class/higher-order functions allow us to use functions as objects
- Practice passing functions as arguments in other functions

## We Can Attach A Function to Objects

Recall our brief introductions to objects in JavaScript; objects are name/value pairs that can hold other pieces of data, including other objects.

```javascript
let testObj = {
  someNum: 5,
  someStr: 'this is a test string',
  someNestedObj: {
    someOtherNum: 4,
  }
};
```

We will be applying this idea of an object to much more realistic use-cases of organizing data:

```javascript
let task = {
  name: 'practice iteration in JavaScript',
  dueDate: 'end of the week',
  owner: 'dee',
  isComplete: false
}
```

And we access _members_ of this JavaScript object with bracket or dot notation:

```javascript
task.owner;
task.isComplete;
```

We can attach _behavior_ to an object by making it a member, using this syntax:

```javascript
let task = {
  name: 'practice iteration in JavaScript',
  dueDate: 'end of the week',
  owner: 'dee',
  isComplete: false,
  markComplete() {
    console.log('Wow...');
    console.log('This task is complete!');
    console.log('Congratulations! You won!');
  },
}
```

We have given the object `task` the method `markComplete()` by:
- continuing to comma-separate it on the same level as the other members of the object
- not following the `name: value` pattern
- giving it the name `markComplete` and with the `() { ... }` syntax
    - Note: The syntax _inside_ the function is the same as regular JavaScript syntax-- nothing special here, still semi-colons and all
    - If I need to add something after the `markComplete()` function inside the `task` object, I'll need to continue to comma-separate

Now, with `markComplete()` defined, we can call this behavior off of `task` with the following syntax:

```javascript
task.markComplete();
```

### A Function Accesses Other Members With `this`

Our new `task` object with the `markComplete()` behavior is cool, but doesn't make sense. Our next step is for the `task` object's value of `isComplete` to change from `false` to `true`. But how do we access the other member of the object?

Within an object itself, other members (such as properties) can be accessed through the `this` keyword, similar to Ruby's `self`.

```javascript
let task = {
  name: 'practice iteration in JavaScript',
  dueDate: 'end of the week',
  owner: 'dee',
  isComplete: false,
  markComplete() {
    console.log('Wow...');
    console.log(`The task "${this.name}" is complete!`);
    console.log('Congratulations! You won!');
    this.isComplete = true;
    return true;
  },
}

console.log(task.isComplete);
task.markComplete();
console.log(task.isComplete);
```

#### Exercise: Write More Behavior for the `task` Object

Given this base code for an object named `task`, make another method on it:

1. Name the method `describe`
1. The method should print out the text `"The task name is"` and then the task name
1. Then it should print out the text `"The task owner is"` and then the task owner
1. It should return `true` (Why? Just to practice returning things.)
1. At the end of the script, call the method with `task.describe();` and verify

<details>

  <summary>
    Compare your implementation with ours!
  </summary>

  ```javascript
  let task = {
    name: 'practice iteration in JavaScript',
    dueDate: 'end of the week',
    owner: 'dee',
    isComplete: false,
    markComplete() {
      console.log('Wow...');
      console.log(`The task "${this.name}" is complete!`);
      console.log('Congratulations! You won!');
      this.isComplete = true;
      return true;
    },
    describe() {
      console.log(`The task name is ${this.name}`);
      console.log(`The task owner is ${this.owner}`);
      return true;
    }
  }

  task.describe();
  ```

</details>
<br/>

Is there bonus time? If there is, add a new member named `daysExtended` with a value of `0`. Then, add a new member that is a function named `extendDueDate`. The function `extendDueDate` takes in one parameter: a number of days to increment `daysExtended` by.

#### Notable Things About Syntax

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
