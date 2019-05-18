# Functional Expressions vs. Function Declarations

## Learning Goals

- Recognize the difference in syntax between functional expressions vs. function declarations
- Know that our preference will be to use functional expressions
- Know that we will always use `const` for our functions

## What's the Difference?

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

**We will always prefer to define functions with the functional expression syntax.**

When we use a functional expression, with `const`, the assignment operator `=`, and the right-hand side with defining the function (`function foo(bar)`), we are setting ourselves up for success in the following ways:

1. It makes the function immutable, so we don't have to worry about that function being changed by some other piece of code. (Turns out, with functional declarations, we _do_ have to worry about this)
1. We are setting ourselves up for the right pattern for some advanced syntax around functions that we'll learn about later this week
1. If we don't do it this way, the advanced syntax we will learn about later this week will not give us the benefits around `this` that we want to see later

### We May See Functional Declarations Online

The old-school way of JavaScript typically teaches functions with functional declaration syntax. While best practices of ES6 (and moving forward) will point us towards function expressions, you may see this outdated syntax. Your best move in this case is to convert it to function expression syntax.

## Conclusion

In many cases the differences are nominal, but every once in a while they'll bite you. The vast majority of the time, a functional expression is what you want. In other words, **always define your functions with the `const` keyword**. The declaration style (no `const`) should be avoided unless you have a good reason to use it.