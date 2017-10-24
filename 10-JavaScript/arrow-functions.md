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
const foo = () => {
  return "bar";
}

console.log(foo());  
> bar
```

So what have we done?  We've gotten rid of the `function` keyword and placed a "fat arrow" to the right of the function parameters.  This lets us create a function with less typing, but we can do this with even less code.

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
let hello = function() {
  return "hello world"
};
```

### Arrow Functions with parameters

```javascript
(numbers) => numbers.map(function(num) {return num * num});
```

This arrow function takes an array and returns each element of that array squared.  Like normal functions arrow functions have their parameters listed in the parentheses.  

Note that this function is not called or assigned to a value to refer later, so if we define it in the way above, it will be lost. Here the is same example, but we assign it to a variable to refer to execute the function afterwards.

```javascript
let squared = (numbers) => numbers.map(function(num) {return num * num});
squared([3, 4, 5]);
> [ 9, 16, 25 ]
```

So this is a pretty compact syntax, but... we're not done.  Because this function takes a **single** argument, we can dispense with the parentheses around `numbers`.

```javascript
let squared = numbers => numbers.map(function(num) {return num * num});
squared([3, 4, 5]);
> [ 9, 16, 25 ]
```

**Note**: This works **only** for functions with a single argument.  Zero parameters or more than one will require you to include the parentheses.  

For example with two parameters

```javascript
let add = (x, y) => x + y;
```

## Inline Arrow Functions Returning Objects

If your arrow function returns a JavaScript object like this normal function.

```javascript
let makePerson = function(id, name) {
  return {id: id,
    name: name
  };
}
```

You would need to surround the returned object with parentheses like this:

```javascript
let makePerson = (id, name) => ({ id: id, name: name });
```

### More Reason to use Arrow Functions

There are additional benefits to using arrow functions beyond minimized syntax.  

Lets look at a more complex example:

```javascript
let Dog = function(name, age) {
  this.name = name;
  this.age = age;
  // every 1 second the dog grows older
  this.interval = setInterval(function() {
    this.age++;
    console.log(this.age);
    if (this.age > 100) clearInterval(this);
  }, 1000);
};

let fido = new Dog("Fido", 1);
```

The code above is **supposed** to make the dog 1 year older each second.  Instead it prints `NaN` over and over again.  The reason is that every traditional function gets it's own instance of `this`.  So the anonymous function does not know about Dog's instance variables.

The traditional work-around to this situation is to save the context (`this`) into another variable and use that variable instead of `this`.

```javascript
let Dog = function(name, age) {
  this.name = name;
  this.age = age;
  let that = this;
  // every 1 second the dog grows older
  this.interval = setInterval(function() {
    that.age++;
    console.log(that.age);
    if (that.age > 5) clearInterval(this);
  }, 1000);
};

let fido = new Dog("Fido", 1);
```

Notice the line `let that = this;`  saving the current context in `that` allows the anonymous function to access `age` without the confusion surrounding `this`.

**Arrow functions do not have their own `this` context**, instead they inherit `this` from the surrounding block.  So using an arrow function makes the resulting code less confusing and error-prone.

```javascript
let Dog = function(name, age) {
  this.name = name;
  this.age = age;
  // every 1 second the dog grows older
  this.interval = setInterval( () => {
    this.age++;
    console.log(this.age);
    if (this.age > 5) clearInterval(this.interval);
  }, 1000);
};

let fido = new Dog("Fido", 1);
```

Because arrow functions do not have their own context (`this`), they make excellent anonymous callback functions.  


## Places **Not** To Use Arrow Functions

Arrow functions are great for callbacks, and are great shortcuts for regular functions, but there are a couple of places you don't want to use them.

### As Constructors

An Arrow function will give you an error if you use it as a constructor.  **Why?**  What does the example below use, that arrow functions don't have?

```javascript
var Dog = (name, age) => {
  this.name = name;
  this.age = age;
}

let fido = new Dog("Fido", 3); // <-- TypeError!
```

**Answer:** `this`!  Since Arrow functions do not have a `this` reference the interpreter cannot resolve things like `this.name`.  Further arrow functions do not have a **prototype** attribute, so `Dog.prototype` will generate an error.

### As Methods

Closely related to their unsuitability as constructors, arrow functions make poor methods.  Because they do not contain a reference to `this`, you cannot access an object's instance variables.

```javascript
var fido = {
  name: "Fido",
  age: 3,
  toString: () => {
    return `${this.name} is ${this.age} years old`; // error!
  }
}
```

The above example will generate an error because the toString method doesn't have a `this` reference.  

## Older Browsers

One final note.  Arrow functions are a relatively new feature introduced in ES6.  Some older browsers may not understand them.  If you build a project that may run on older browsers you will need to use a tool like [Babel](https://babeljs.io/) which can convert or transpile ES6 code to run allow it to run on older browsers.  

## Summary

Arrow functions are a great way to minimize your JavaScript typing and make very good anonymous callback functions.  

However they lack a `this` context, making them useful as callback functions, but unsuitable for constructors or as object methods.  

On older browsers newer features like Arrow Functions, template strings etc will not work requiring a tool to convert newer (ES6) code like Babel

## Additional Resources
- [MDN Docs on Arrow Functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions)
- [Learning ES6 Arrow Functions](https://www.eventbrite.com/engineering/learning-es6-arrow-functions/)
