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

## We Can Pass Functions as Arguments

Remember how functions can take in arguments? We can define parameters, which is our way of defining inputs. Those arguments can be numbers, strings, other objects, and so on. We can read them, modify them, and return them as output.

In JavaScript, functions are objects. That means **you can pass functions as arguments to other functions.**

Let's look at the following example:

We are defining two functions:
1. A function named `doMath` whose responsibility is to do some generic math operation 10 times, with the numbers 0 through 9
1. A function named `doubleNum` whose responsibility is to represent a specific math operation: doubling a number

`doubleNum` is written so that it takes in a number as an argument. For any given input number, it will double it and return that value.

`doMath` is written so that it takes in a function as an argument. This function it takes in will be the generic math operation. No matter what the generic math operation function is, it will do that operation 10 times, with the numbers 0 through 9.

```javascript
const doMath = function doMath(operation) {
  for (let i = 0; i < 10; i += 1) {
    let result = operation(i);
    console.log(`${i}: ${result}`);
  }
};

const doubleNum = function doubleNum(num) {
  return num * 2;
};

doMath(doubleNum);
```

Answer the following questions:

1. For the `doubleNum` function, how many parameters does it take in, what are the names of the parameters, and what data type are we expecting for each parameters?
1. For the `doMath` function, how many parameters does it take in, what are the names of the parameters, and what data type are we expecting for each parameters?
1. What line _invokes_ the `doMath` function? What do we pass in as an argument? What data type is that argument?
1. In the `doMath` function, how do we use the variable `operation`?
1. What does running this script print out?

<details>

  <summary>
    Check your answers here!
  </summary>

  1. 1 parameter named `num` that is a number
  1. 1 parameter named `operation` that is a function
  1. `doMath(doubleNum)`. We pass in the `doubleNum` function as an argument.
  1. Because `operation` is a function, we _invoke_ the `operation` function with `let result = operation(i);`
  1.
      ```bash
      0: 0
      1: 2
      2: 4
      3: 6
      4: 8
      5: 10
      6: 12
      7: 14
      8: 16
      9: 18
      ```

</details>

<br/>

A function that is passed as an argument is often referred to as a _callback function_, or sometimes just a _callback_.

In this case, we can colloquially refer to the variable `operation` as a callback function.

## Summary

Objects can have functions in them. Within an object, we can reference other members of the object with `this`. `this` will end up being a very complex subject; for now, our one use of `this` will be in this context!

A programming language that allows you to pass functions around like this is said to support _higher order_ or _first-class_ functions. C, JavaScript and Python are examples of languages that support first-class functions; Ruby and Java are examples of languages that do not.
