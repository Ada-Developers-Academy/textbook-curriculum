## Arrow Functions

Now that you know how to use regular functions, let's talk about a function shortcut called the **arrow function**.

## Learning Goals
- Explore arrow function syntax
- Understand the difference between a regular function and an arrow function
- Use arrow functions
- Explain how `this` works in an arrow function

##  Overview
Arrow functions have minimized _syntactic sugar_ compared to regular JavaScript functions. The closest thing to an arrow function in JavaScript is a proc in Ruby. Arrow functions are especially useful if you intend to create a one-line anonymous function that does not need to be referenced after it's initial definition.

### Converting a function into an arrow function

Traditional functions look like this:

```javascript
const foo = function() {
  return "bar";
}

console.log(foo());  
> bar
```

Using an arrow function we could reduce it as:

```javascript
// if there are no parameters you need to include empty parentheses to indicate it's a function
const foo = () => {
  return "bar";
}

console.log(foo());  
> bar
```

So what have we done?  We've gotten rid of the `function` keyword and placed a "arrow" to the right of the function parameters.  This lets us create a function with less typing, but we can do this with even less code.

**Note**:  The arrow must be on the same line as the parentheses.  If they are on separate lines, it will generate a Syntax error.

Because our function has only a **one** line return, we can remove the return keyword and make it smaller.

```javascript
const foo = () => {  "bar"; }

console.log(foo());  
>  bar
```

Since `"bar"` is the only line in the function, it's considered an _implicit return_.  In other words, JavaScript assumes the function will return that value.  That's a lot less code, but we can reduce it further.  Since this is a 1-line function we can remove the curly braces and make them implicit as well.

```javascript
const foo = () => "bar";

console.log(foo());  
>  bar
```

Wow that's a lot less code.

### Exercise

Here is an example for defining a function with no parameters which returns a string "hello world".  Convert this into an arrow function and minimize the code typed.

```javascript
const hello = function() {
  return "hello world"
};
```

### Arrow Functions with parameters

```javascript
const squarer = (number) => {
  return number * number
}
```
This arrow function takes a single number and returns that number squared.  Like normal functions arrow functions have their parameters listed in the parentheses.  

So this is a pretty compact syntax, but... we're not done.  Because this function takes a **single** argument, we can dispense with the parentheses around `number`.

```javascript
const squarer = number => {return number * number;};
console.log(squared(3)); // 9
```

**Note**: This works **only** for functions with a single argument.  Zero parameters or more than one will require you to include the parentheses.  

For example with two parameters

```javascript
const add = (x, y) => x + y;
```

Just like earlier since `squarer` has a 1-line function body we can remove the curly braces.

```javascript
const squarer = number => return number * number;
squared([3, 4, 5]);
> [ 9, 16, 25 ]
```

**Note**  This is **not** good style as it's hard to identify the code above as a function.  You should avoid writing an arrow function with no parentheses around the argument and no curly braces around the method body.  However you will see this style of function outside of Ada.

## Inline Arrow Functions Returning Objects

If your arrow function returns a JavaScript object like this normal function.

```javascript
const makePerson = function(id, name) {
  return {
    id: id,
    name: name
  };
}
```

You would need to surround the returned object with parentheses like this:

```javascript
const makePerson = (id, name) => ( { id: id, name: name });
```

## As An Anonymous Function

Arrow functions work well with collection functions like `map`, `select`, and `sort`.

```javascript
let numbers = [3, 4, 5, 6];

let doubled = numbers.map(function(num) {
  return num + num;  
});

// as an arrow function

doubled = numbers.map( num => num + num);
```

In the above example we map an array to one where each element is doubled.  Looking at the two examples the arrow function, once you adjust to the new syntax, is more compact and visually conveys the concept that we're mapping each number (`num`) to twice it's value.

### More Reason to use Arrow Functions

There are additional benefits to using arrow functions beyond minimized syntax.  

Lets look at a more complex example:

```javascript
obj = {
  thing: 0,
  increment: function() {
    [1,2,3].forEach(function(num) {
      this.thing += num;
    });
  }
}

console.log(obj.thing); // 0
obj.increment();
console.log(obj.thing); // Expected 6, but prints 0
```

The code above is **supposed** to add each element of the array and store the result in `thing`, but... because the anynomous function has it's own instance of `this` it tries to add each number to the wrong... `thing`.

The traditional work-around to this situation is to save the context (`this`) into another variable and use that variable instead of `this`.

```javascript
obj = {
  thing: 0,
  increment: function() {
    let that = this;
    [1,2,3].forEach(function(num) {
      that.thing += num;
    });
  }
}

console.log(obj.thing); // 0
obj.increment();
console.log(obj.thing); // Expected 6, and prints 6
```

Notice the line `let that = this;`  saving the current context in `that` allows the anonymous function to access `thing` without the confusion surrounding `this`. Whew!  What a work-around!

**Arrow functions do not have their own `this` context**, instead they inherit `this` from the surrounding block.  So using an arrow function makes the resulting code less confusing and error-prone.

```javascript
obj = {
  thing: 0,
  increment: function() {
    [1,2,3].forEach((num) => {
      this.thing += num;
    });
  }
}

console.log(obj.thing); // 0
obj.increment();
console.log(obj.thing); // Expected 6, and prints 6
```

Because arrow functions do not have their own context (`this`), they make excellent anonymous callback functions.  


## Places **Not** To Use Arrow Functions

Arrow functions are great for callbacks, and are great shortcuts for regular functions, but there are a couple of places you don't want to use them.

### As Constructors for Prototype-based Objects

An Arrow function will give you an error if you use it as a constructor.  **Why?**  What does the example below use, that arrow functions don't have?

```javascript
const Dog = (name, age) => {
  this.name = name;
  this.age = age;
}

let fido = new Dog("Fido", 3); // <-- TypeError!
```

**Answer:** `this!` We know that arrow functions take the value of this from the context in which they are defined. Since our constructor is defined outside any other object, `this` doesn't make any sense, and our code does the wrong thing.  Further arrow functions do not have a **prototype** attribute, so `Dog.prototype` will generate an error.

### As Methods

Closely related to their unsuitability as constructors, arrow functions make poor methods.  Because they do not contain a reference to `this`, you cannot access an object's instance variables.

```javascript
let fido = {
  name: "Fido",
  age: 3,
  toString: () => {
    return `${this.name} is ${this.age} years old`; // error!
  }
}
```

The above example will generate an error because the toString method doesn't have a `this` reference.  

## Summary

Arrow functions are a great way to minimize your JavaScript typing and make very good anonymous callback functions.  

However they lack a `this` context, making them useful as callback functions, but unsuitable for constructors or as object methods.  

On older browsers newer features like Arrow Functions, template strings etc will not work requiring a tool to convert newer (ES6) code like Babel

## Additional Resources
- [MDN Docs on Arrow Functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions)
- [Learning ES6 Arrow Functions](https://www.eventbrite.com/engineering/learning-es6-arrow-functions/)
