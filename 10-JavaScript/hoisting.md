# JavaScript Hoisting

## Learning Goals
- What is hoisting?
- Why is hoisting in JS important?

What is hoisting? In JavaScript, __hoisting__ refers to the process of "lifting" and declaring things __prior__ to their explicit definition or declaration.

#### Ex 1
Let's see an example:
```javascript
function foo() {
  bar();
  var x = 1;
}
```

When we consider the way in which JavaScript will interpret this code, it would actually look more like this:
```javascript
function foo() {
  var x;
  bar();
  x = 1;
}
```

This is because JavaScript will __hoist__ the `x` variable declaration to the top of the function declaration, even though it is written in the code below.

This becomes a more powerful example when we begin to combine our understanding of the way that Scope applies to functions in javascript and _not_ other blocks like `if` statements.

#### Ex 2
```javascript
function foo() {
  if (false) {
    var x = 1;
  }
  return;
  var y = 1;
}
```

The above example, when considering how the JavaScript interpreter works, would look like:
```javascript
function foo() {
  var x, y;
  if (false) {
    x = 1;
  }
  return;
  y = 1;
}
```

#### Ex 3
Now that we see that variable declaration is hoisted, we can also see the way we discussed last week where function declarations (but not expressions) are hoisted.

Let's see another example.
```javascript
function test() {
	foo(); // TypeError "foo is not a function"
	bar(); // "this will run!"
	var foo = function () { // function expression assigned to local variable 'foo'
		alert("this won't run!");
	}
	function bar() { // function declaration, given the name 'bar'
		alert("this will run!");
	}
}
test();
```

In the example above, the `foo` function _will not_ be hoisted because it is an **expression** not a **declaration**. Though, the `foo` variable will be, which is why we get the "foo is not a function error".

Function `bar` _will_ be hoisted because it is a **declaration**.


## Additional Resources
- [You Don't Know JS: Hoisting](https://github.com/getify/You-Dont-Know-JS/blob/master/scope%20%26%20closures/ch4.md)
