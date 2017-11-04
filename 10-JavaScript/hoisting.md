# JavaScript Hoisting & `var` vs `let`

## Learning Goals
Be able to explain:
- What is hoisting?
- Why is hoisting in JS important?
- How variables declared with `let` and `var` differ

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

## Block-Level Scoping with `let`

Variables, including functions, declared using `let` differ from `var` in that they are scoped to the block-level rather than the function.  

If you use var to declare variables:

```javascript
function foo() {
  if (false) {
    var x = 1;
  }
  return;
  var y = 1;
}
```

The JavaScript interpreter will move the declarations to the top of the function as below.  

```javascript
function foo() {
  var x,y;
  if (false) {
    x = 1;
  }
  return;
  y = 1;
}
```

However if we had used `let`

```javascript
function foo() {
  if (false) {
    let x = 1;
  }
  return;
  let y = 1;
}
```

The interpreter will not hoist the variable declaration to the top of the function when using let. The interpreter will keep the scope in which these variables are declared.  Variables declared with `let` only exist in the scope in which they are declared.

JavaScript also gives variables declared with `var` scope throughout the entire function so:

```javascript
function sum(max) {
  var sum = 0;
  for (var i = 0; i < max; i++) {
    sum += i;
    console.log(i); // <-- 0...max
  }
  console.log(`i = ${i}`); // 5 <-- Works
  return sum;
}
```

**Why is this important**

Using Var:
1.  Even if you declare a variable with `var` inside a block, like a `for` loop the variable will have scope and can be accessed throughout the function.    
1.  With closures like below, using `let` can avoid some common errors.

The code below looks like it will print `a b c`, but because the anonymous function is called later, after the loop completes the function will use the last value of `i`.  Each subsequent call of the anonymous function accesses the same instance of `i`.  

```javascript
var fun = function() {

  var list = ["a","b","c"];

  for (var i = 0; i < 3; ++i ) {
     var msg = list[i];
     setTimeout(function() { console.log(msg); }, i*1000);
  }
}

fun(); // output: c c c
```

Using `let`, each call to the function receives the value of `i` at the time the callback was created.

```javascript
var fun = function() {

  var list = ["a","b","c"];

  for (let i = 0; i < 3; ++i ) {
     let msg = list[i];
     setTimeout(function() { console.log(msg); }, i*1000);
  }
}

fun(); // output:  a b c
```



## Additional Resources
- [You Don't Know JS: Hoisting](https://github.com/getify/You-Dont-Know-JS/blob/master/scope%20%26%20closures/ch4.md)
- [MDN on `let`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/let)
