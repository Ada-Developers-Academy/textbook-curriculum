# Intro to Arrow Function Syntax

Now that you know how to use regular functions, let's talk about a function shortcut called the **arrow function**.

## Learning Goals
- Explore arrow function syntax
- Understand the difference between a regular function and an arrow function
- Use arrow functions

## Arrow Functions

Arrow functions have minimized _syntactic sugar_ compared to regular JavaScript functions. Arrow functions are especially useful if you intend to create a one-line anonymous function that does not need to be referenced after it's initial definition.

## Syntax

Traditional functions look like this:

```javascript
const foo = function foo() {
  return 'bar';
}

console.log(foo());  
> bar
```

Using an arrow function we could reduce it as:

```javascript
// if there are no parameters you need to include empty parentheses to indicate it's a function
const foo = () => {
  return 'bar';
}

console.log(foo());  
> bar
```

So what have we done?  We've gotten rid of the `function` keyword and placed an 'arrow' (`=>`) to the right of the function parameters.  This lets us create a function with less typing, but we can do this with even less code.

**Note**:  The arrow must be on the same line as the parentheses.  If they are on separate lines, it will generate a syntax error.

### One-line Returns

Because our function has only a **one** line return, we can remove the return keyword and the curly braces around the function body.

Since `'bar'` is the only line in the function, it's considered an _implicit return_.  In other words, JavaScript assumes the function will return that value.  Taking out the curly braces and return statement makes them implicit and reduces the amount of code we need to write.

```javascript
const foo = () => 'bar';

console.log(foo());
>  bar
```

Wow that's a lot less code.

### Exercise

Convert this into an arrow function and minimize the code typed.

```javascript
const hello = function hello() {
  return 'hello world';
};
```

## Syntax with Parameters

### With Multiple Parameters or Zero Parameters

Like normal functions, arrow functions have their parameters listed in the parentheses.

With zero parameters, we leave the parens empty:

```javascript
const sayHelloWorld = () => 'Hello World!';
```

With multiple parameters, they are comma-separated.

```javascript
const add = (x, y) => x + y;
```

### With One Parameter

This arrow function takes a single number and returns that number squared.

```javascript
const squarer = (number) => {
  return number * number;
}
```

So this is a pretty compact syntax, but... we're not done.  Because this function takes a **single** argument, we can dispense with the parentheses around `number`.

```javascript
const squarer = number => {return number * number;};
console.log(squarer(3)); // 9
```

**Note**: This works **only** for functions with a single argument.  Zero parameters or more than one will require you to include the parentheses.  

Just like earlier since `squarer` has a 1-line function body we can remove the curly braces and the `return` keyword.

```javascript
const squarer = number => number * number;
squarer(3);
> 9
```

**Note**:  This is **not** good style as it's hard to identify the code above as a function.  You should avoid writing an arrow function with no parentheses around the argument and no curly braces around the method body.  However you will see this style of function outside of Ada.

## Syntax to `return` Objects

If your arrow function returns a JavaScript object like this normal function...

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

### Note On Object Shorthand

When you have a function that returns an object like above you can also use the following shorthand when the key and value of an attribute are the same.  This is the case anywhere you're creating an object literal.

```javascript
const makePerson = (id, name) => ({ id, name });
```

## Summary

To convert a traditional-style syntax to an arrow function, we rid of the `function` keyword and placed a 'arrow' to the right of the function parameters.
