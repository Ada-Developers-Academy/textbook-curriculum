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
    const result = operation(i);
    console.log(`${i}: ${result}`);
  }
};

doMath(function(num) {
  return num * num;
});
```

Note the weird `});` on the last line. Anonymous functions can quickly become difficult to read, so use them judiciously.


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
      ```
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

### Exercise: Create More Anonymous Math Operation Callbacks

```javascript
const doMath = function doMath(operation) {
  for (let i = 0; i < 10; i += 1) {
    const result = operation(i);
    console.log(`${i}: ${result}`);
  }
};

// doMath(...)
```

Given the above code, call `doMath()` three more times, with three different anonymous function callbacks.

Each of these anonymous function callbacks should take in 1 number, and return either a number or a string.

Ideas for anonymous functions to write include:
- Cubing one number
- Formatting the input like it was currency
- Multiplying it by 1 million and then formatting it like currency and then adding text saying that it belongs to the Ada instructors

Run your script to make sure it works!

## Practical Example: `forEach` Loops

We've touched on iteration in JavaScript with a regular `for` loop and a `while` loop. However, going forward, `forEach` loops are going to be our most reliable loops to use.

The `forEach` loop in JavaScript is a function that operates off of a collection (like an array). It takes in one argument: a function, which takes in one argument that represents one iteratee item from the array.

Because of the nature of iteration (it's usually an operation we need to do one time, in a very specific manner), we will use an anonymous function.

Observe the following example, which has an array of numbers that represent a collection of cash tips, and then iterates through the array to increment a `sum` variable. Then, we use the sum to calculate the average cash tip.

```javascript
const cashTips = [4, 7, 9, 12, 3, 18, 6];
let sum = 0;

cashTips.forEach( function(tip) {
  sum += tip;
});

const average = sum / cashTips.length;
console.log(`The average cash tip is ${average}`);
```

## Danger Will Robinson Danger

There is one thing to note about the `forEach` loop.  Consider this linear search:

```javascript
const list = ['Alice', 'Cooper', 'Maria', 'Alyokhina', 'Alicia', 'Keys'];

list.forEach( function(element) {
  if (element == 'Cooper') {
    console.log('Found it!');
    return true;
  }
  console.log(`${element} is not Cooper`);
});
```

You would think that this would print out:

```
Alice is not Cooper
Fount it!
```

And stop.  However this is **wrong**.  Because `forEach` method takes a _function_ as a parameter the `return` causes us to leave the _anynomous function_ and **not** the entire loop.  

This code segment actually prints:

```
Alice is not Cooper
Found it!
Maria is not Cooper
Alyokhina is not Cooper
Alicia is not Cooper
Keys is not Cooper
```

You **cannot** break out of a `forEach` loop.  It will iterate throughout the collection.  This can be good, if this is the behavior you want, but if you want to short-circuit the loop, [another method might be preferable.](http://frontendcollisionblog.com/javascript/2015/08/15/3-reasons-you-should-not-be-using-foreach.html) Just remember if you are in a `forEach` loop, you are in for the full ride.

If you wanted to see if `Cooper` was in the list using `.find` is a better choice.

```javascript
const list = ['Alice', 'Cooper', 'Maria', 'Alyokhina', 'Alicia', 'Keys'];

const foundElement = list.find( function(element) {
  return element == 'Cooper'
});

if (foundElement != undefined) {
  console.log('I found Cooper!')
}
```

### Exercise: `forEach`

Complete the following exercises in JavaScript using `forEach` an anonymous functions.

1. Given the array `[ 2, 5, 8, 11, 14 ]`, iterate through the array. For each item `num`, print to the terminal `2 * num + 7`
1. Given the array `['puppies', 'meerkats', 'red pandas']`, iterate through the array. For each item `critter`, print to the terminal `"I am as amazing as"` critter!
1. Given the array `['puppies', 'meerkats', 'red pandas']`, iterate through the array. Print out only the longest string in the array.

## Vocab List

- The `this` keyword
- Callback function
- Anonymous function
- "Higher order" or "first-class" functions
- Functional expression
- Function declaration

## Summary

Often we want to pass a function as an argument in JavaScript.  One term for these is a _callback function_.  Sometimes these callback functions are only used in one function call and do not need a name.  These nameless functions are called _anonymous functions_.  

Similar to Ruby's `.each` method, JavaScript arrays have a `.forEach` function.  The difference between the two is that `.forEach` takes a *function as a parameter*.  This takes advantage of JavaScript's functional features, but means we _cannot_ break out of a loop mid-iteration.

## Resources

- [Three Reasons `forEach` is dangerous](http://frontendcollisionblog.com/javascript/2015/08/15/3-reasons-you-should-not-be-using-foreach.html)
- [MDN on `forEach`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach)