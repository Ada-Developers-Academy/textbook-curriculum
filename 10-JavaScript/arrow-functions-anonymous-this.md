# Arrow Functions: as Anonymous Functions, and `this`

## Learning Goals

- Recognize using arrow functions as anonymous functions
- Practice refactoring anonymous functions as arrow functions
- Explain how `this` works in an arrow function

## Arrow Functions as Anonymous Functions

Arrow functions work well with collection functions like `map`, `select`, and `sort`.

```javascript
let numbers = [3, 4, 5, 6];

let doubled = numbers.map(function(num) {
  return num + num;  
});

// as an arrow function

let doubled = numbers.map(num => num + num);
```

In the above example we map an array to one where each element is doubled.  Looking at the two examples the arrow function, once you adjust to the new syntax, is more compact and visually conveys the concept that we're mapping each number (`num`) to twice it's value.

## Arrow functions do not have their own `this`

There are additional benefits to using arrow functions beyond minimized syntax.  

### Traditionally, `this` is an Interesting Problem

```javascript
const numberHaver = {
  value: 0,
  increment() {
    [1,2,3].forEach(function(num) {
      this.value += num;
    });
  }
}

console.log(numberHaver.value); // 0
numberHaver.increment();
console.log(numberHaver.value); // Expected 6, but prints 0
```

The code above is **supposed** to add each element of the array and store the result in `value`, but... because the anonymous function has it's own instance of `this`, it tries to add each number to the wrong `value`.

The traditional work-around to this situation is to save the context (`this`) into another variable and use that variable instead of `this`.

```javascript
const numberHaver = {
  value: 0,
  increment() {
    const that = this;
    [1,2,3].forEach(function(num) {
      that.value += num;
    });
  }
}

console.log(numberHaver.value); // 0
numberHaver.increment();
console.log(numberHaver.value); // Expected 6, and prints 6
```

Notice the line `let that = this;`  saving the current context in `that` allows the anonymous function to access `value` without the confusion surrounding `this`. Whew!  What a work-around!

### Arrow Functions Inherit `this`

**Arrow functions do not have their own `this` context**, instead they inherit `this` from the surrounding block.  So using an arrow function makes the resulting code less confusing and error-prone.

```javascript
const numberHaver = {
  value: 0,
  increment() {
    [1, 2, 3].forEach((num) => {
      this.value += num;
    });
  },
};

console.log(numberHaver.value); // 0
numberHaver.increment();
console.log(numberHaver.value); // Expected 6, and prints 6
```

Because arrow functions do not have their own context (`this`), they make excellent anonymous callback functions.  

## Places **Not** To Use Arrow Functions

Arrow functions are great for callbacks, and are great shortcuts for regular functions, but there are a couple of places you don't want to use them.

### As Methods Inside Objects

Arrow functions make poor methods for objects.  Because they do not contain a reference to `this`, you cannot access an object's instance variables.

```javascript
let fido = {
  name: 'Fido',
  age: 3,
  toString: () => {
    return `${this.name} is ${this.age} years old`; // error!
  },
};
```

The above example will generate an error because the toString method doesn't have a `this` reference.

### As Constructors for Prototype-based Objects

We haven't closely looked at what prototype-based objects are in JavaScript, and it's likely we won't. However, for the sake of thoroughness, it's good to know that arrow functions do not work well with prototype-based objects. An Arrow function will give you an error if you use it as a constructor.  **Why?**  What does the example below use, that arrow functions don't have?

```javascript
const Dog = (name, age) => {
  this.name = name;
  this.age = age;
};

let fido = new Dog('Fido', 3); // <-- TypeError!
```

**Answer:** `this!` We know that arrow functions take the value of this from the context in which they are defined. Since our constructor is defined outside any other object, `this` doesn't make any sense, and our code does the wrong thing.  Further, arrow functions do not have a **prototype** attribute, so `Dog.prototype` will generate an error.

## Summary

Arrow functions are a great way to minimize your JavaScript typing and make very good anonymous callback functions.

However they lack a `this` context, making them useful as callback functions, but unsuitable for constructors or as object methods.  

On older browsers, newer features like Arrow Functions, template strings, etc, will not work. Older browsers require a tool, like Babel, to convert newer (ES6) code to older JavaScript

## Additional Resources
- [MDN Docs on Arrow Functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions)
- [Learning ES6 Arrow Functions](https://www.eventbrite.com/engineering/learning-es6-arrow-functions/)