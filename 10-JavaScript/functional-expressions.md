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

In many cases the differences are nominal, but every once in a while they'll bite you. The vast majority of the time, a functional expression is what you want. In other words, **always define your functions with the `const` keyword**. The declaration style (no `const`) should be avoided unless you have a good reason to use it.

If you're interested in more details, [this StackOverflow answer](http://stackoverflow.com/questions/3887408/javascript-function-declaration-and-evaluation-order) is one of the best we've seen in describing the difference and when it matters. We don't expect you to be able to recite the nitty gritty details, but we do expect you to be able to identify the two types of function and tell us which is correct.