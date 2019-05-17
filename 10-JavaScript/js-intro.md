# Welcome to JavaScript!

## Learning Goals

- What is JavaScript? Why is it worth learning?
- Discover the varying applications of JavaScript
- Learn where Node and npm fit in all of this
- Recognize the different data types in JavaScript
- Understand that Objects are very different in JavaScript compared to Ruby

## The Roots of JS

JavaScript was originally developed in **ten days** in May 1995 by Brendan Eich, while he was working for Netscape Communications Corporation ([Wikipedia](https://en.wikipedia.org/wiki/JavaScript))

Although it was developed under the name Mocha, the language was officially called LiveScript when it first shipped in beta releases of Netscape Navigator 2.0 in September 1995. It was renamed JavaScript when it was deployed in the Netscape browser version 2.0B3.

### JavaScript != Java

The change of name from LiveScript to JavaScript roughly coincided with Netscape adding support for _Java_ technology in its Netscape Navigator Web browser. The final choice of name caused confusion, giving the impression that the language was a spin-off of the Java programming language, and the choice has been characterized as a marketing ploy by Netscape to give JavaScript the cachet of what was then the hot new Web programming language.

## Node is the name of the game

[Node.js](https://nodejs.org/en/) is an open-source, cross-platform **runtime environment** for developing server-side Web applications. Node.js is not a JavaScript framework... It is a runtime environment that interprets JavaScript using Google's V8 JavaScript engine (same as what's in Chrome).

To get started, let's install node using `$ brew install node`. It should go something like this:

```
$ brew install node
==> Downloading
...
...
...

Bash completion has been installed to:
  /usr/local/etc/bash_completion.d
==> Summary
🍺  /usr/local/Cellar/node/8.6.0: 3,655 files, 38.8M
```

Alright. Now, `node --version` should report to you something like `v11.X.X`. Yay! We'll use Node's command line program to do all the same things we did with Ruby's. We can use Node to run JavaScript programs (`$ node my_program.js`) and use Node as a _REPL_ (`$ node`).

Node is also packaged with __npm__, the _Node Package Manager_. npm packages are to Node like gems are to Ruby. We'll use npm to define, install, and manage dependencies in our Node applications.

## JavaScript and Ruby are like cousins

JavaScript and Ruby share the following similarities:

- Ruby and JavaScript are both _interpreted_ languages
- Both support object-oriented programming
- Both are dynamically typed

## Using the Node REPL

Instead of `irb` (the interactive ruby shell as a REPL for Ruby), we will use Node's REPL for playing around with JavaScript. Start the REPL with the terminal command `$ node`. You'll get a caret (`>`) prompt. From here, you can enter code and have it evaluated, just like using `irb` or the Rails console.

Open the `node` REPL and put in the following commands. What do you get?

1. `'Hello World!';`
1. `2 + 1;`
1. `100 * 4;`
1. `2 + 'Hello World!';`
1. `let x = 7;`
1. `x + 2;`
1. `typeof x;`
1. `2 - 'Hello World!';`

<details>

  <summary>
    Compare your answers here
  </summary>

  1. `'Hello World!'`
  1. `3`
  1. `400`
  1. `'2Hello World!'`
  1. `undefined`
  1. `9`
  1. `'number'`
  1. `NaN`

Keep a note of what answers are surprising. We will get into what some of these answers mean, soon.

</details>

</br>

### Exit the Node REPL

Use `.exit` or ctrl-d to get out of the Node REPL

Now that we've got a REPL available to us, let's jump in with some JavaScript specifics.

## Data Types in JavaScript

> How can I represent data in this language? What are the data types available in this language?

> _-- Some cool programmer learning a new language_

JavaScript has types that are similar to Ruby:

- `Boolean`
- `Number`
- `String`
- `Array`
  - technically these aren't a distinct type, but we won't get into that now
- `null`

And also some that are distinct from Ruby:
- `Undefined`
- `Object`
- `Function`

The best way for us to get into JavaScript at the moment is to blitz through all of the familiar types. Feel free to follow along in the Node REPL to verify that these these are real things in JavaScript.

#### An Example Error in Node REPL

If something is not real, Node REPL will let us know by _throwing an error._

For example, if we have the Node REPL open and type in something that the Node REPL doesn't recognize, it may have output that looks like any of these options:

```
> asdf
Thrown:
ReferenceError: asdf is not defined
> this isn't real
Thrown:
this isn't real
     ^^^

SyntaxError: Unexpected identifier
```

### Boolean means `true` or `false`

Check in Node REPL that you can evaluate a boolean `true` or `false` and get back what you'd expect, with similar syntax.

In your Node REPL, input these lines. Do you get what you expect?

1. `true;`
1. `false;`
1. `true && true;`
1. `true && false;`
1. `false || true;`
1. `false || false;`

<details>

  <summary>
    Compare your answers here
  </summary>

  1. `true`
  1. `false`
  1. `true`
  1. `false`
  1. `true`
  1. `false`

</details>

### `Number` represents a Numeric Value

In JavaScript, the `Number` type includes support for the following kinds of numbers:

- integers (1, 2, 3, etc.)
- floats (1.4, -40.1)
- infinity (+Infinity, -Infinity)
- `NaN` which means "not a number." `NaN` is returned when you do a numeric operation on anything that's not a `Number`.

In your Node REPL, input these lines. Do you get what you expect?

1. `4;`
1. `2.0;`
1. `4 / 2;`
1. `4 / 2.0;`
1. `4.0 + 2.0`
1. `4 + 2.1`
1. `Infinity;`
1. `+Infinity;`
1. `-Infinity;`
1. `Number.MAX_VALUE;`
1. `Infinity > Number.MAX_VALUE;`
1. `0.1 + 0.2 == 0.3;`
1. `0.1 + 0.2;`
1. `'asdf' - 5;`

<details>

  <summary>
    Compare your answers here
  </summary>

  1. `4`
  1. `2`
  1. `2`
  1. `2`
  1. `6`
  1. `6.1`
  1. `Infinity`
  1. `Infinity`
  1. `-Infinity`
  1. `1.7976931348623157e+308`
  1. `true`
  1. `false`
  1. `0.30000000000000004`
  1. `NaN`

  We will not spend the time to go into the specifics and the "why"s of JavaScript at the moment; for now, be satisfied with the mystery, curiosity, and difference you can see.

</details>

### `Strings` are declared with `""`, `''`, or backticks `    ``    `.

The idea of Strings is the same between JavaScript and Ruby. However, these are the following differences we will highlight:

- In JavaScript, strings declared with double-quotes and strings declared with single-quotes are the same
- In those cases, we will standardize on using single-quotes `''`
- **We can only use backticks for string interpolation**
- The syntax for string interpolation is with `${}`
- JavaScript does not have symbols, and uses strings wherever Ruby would use symbols

In your Node REPL, input these lines. Do you get what you expect?

1. `"Hello World!";`
1. `'Hello World!';`
1. `'Hello World!'.length`;
1. `'A triangle has ${ 2 + 1 } sides.';`
1. `` `A triangle has ${ 2 + 1 } sides` ``

<details>

  <summary>
    Compare your answers here
  </summary>

  1. `Hello World!`
  1. `Hello World!`
  1. `12`
  1. `'A triangle has ${ 2 + 1 } sides.'`
  1. `'A triangle has 3 sides'`

</details>

### Arrays

[Arrays](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) are similar to Ruby arrays. They are declared and accessed with square brackets ([]).

In your Node REPL, input these lines. Do you get what you expect?

1. `[1, 2, 3, 4];`
1. `['foo', 1, 2, 'bar', 'baz'];`
1. `['foo', 1, 2, 'bar', 'baz'].length;`
1. `['foo', ['this', 'is', 'a', 'nested', 'array'], 1, 2];`
1. `['foo', ['this', 'is', 'a', 'nested', 'array'], 1, 2].length;`

<details>

  <summary>
    Compare your answers here
  </summary>

  1. `[ 1, 2, 3, 4 ]`
  1. `[ 'foo', 1, 2, 'bar', 'baz' ]`
  1. `5`
  1. `[ 'foo', [ 'this', 'is', 'a', 'nested', 'array' ], 1, 2 ]`
  1. `4`

</details>

### `null` represents an empty value

Similar to Ruby's `nil`, JavaScript's `null` represents an empty value.

In your Node REPL, input these lines. Do you get what you expect?

1. `null;`
1. `null == true;`
1. `null == false;`
1. `null.length;`

<details>

  <summary>
    Compare your answers here
  </summary>

  1. `null`
  1. `false`
  1. `false`
  1. `Thrown: TypeError: Cannot read property 'length' of null`

</details>

#### `Undefined` is the value undefined.
When a variable which has not declared is accessed, JS returns undefined.

```javascript
let u;
console.log(u); //-> undefined
```

#### Objects
[Objects](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object) are similar to Ruby hashes, but much more versatile. They are declared with braces(`{}`). You can access properties in an Object with bracket notation (like an array) or dot notation.

```javascript
let obj = {     // We can span lines; whitespace is mostly ignored.
  num: 5,
  str: 'This is a string',
  subObject: {
    otherNum: 4
  }
};

obj.num;    // 5
obj['num']; // 5; note we use a string!
obj.subObject.otherNum; // 4
obj.foo;    // undefined

```

### Variables
__Declare all variables with the var or let operators!__

```javascript
var five = 5;
let six  = 6;
```

If you omit `var` or `let` you will get a __global__ variable, which can lead to all sorts of problems. __JUST DON'T DO IT!__

`var` and `let` mean subtly different things, both having to do with [scope](https://stackoverflow.com/questions/762011/whats-the-difference-between-using-let-and-var-to-declare-a-variable) which we'll get to later.  A good rule of thumb is to use `let` unless you are working with an older version of the JavaScript interpreter.

#### Constants

You can declare a constant with the `const` operator.  Constants are like variables declared with `let`, but cannot change their value through reassignment.

```javascript
const FIVE = 5;
FIVE = 6;  // TypeError: Assignment to constant variable.
```

**Note** that each line of JavaScript code ends with the `;`. This is optional for the code to work (sometimes, and the rules are inconsistent) but **not** optional when taking into consideration style guidelines.

### Types


### [Conditionals](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/if...else)
Conditional expressions are surrounded by parenthesis `()` and each block is surrounded by brackets `{}`.

```javascript
let name = 'kittens';

if (name === 'puppies') {
  name += '!';
} else if (name === 'kittens') {
  name += '!!';
} else {
  name = `!${name}`;
}

console.log(name);
```

JavaScript also has the ternary operator, which we all adore, amirite?

```javascript
let adult = (age > 18) ? 'yes' : 'no';
```

### Iterators
There are three main types of loop in JavaScript: `for` loops, `forEach` loops and `while` loops.

#### `for` Loop
[The basic `for` loop](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/for) looks something like this:

```javascript
for (initialization; condition; increment) {
  // do work!
}
```

Looks similar to a conditional! This syntax comes from the programming language C. There's not a direct equivalent in Ruby, but it's common in many other languages. Aside from the keyword `for` and all the parentheses, there are three main components, separated by _semicolons_:
- **Initialization:** Runs before the loop, often used to set up a counter variable
- **Condition:** Runs before each iteration (including the first), determines whether the loop should keep going
- **Increment:** Runs after each iteration, sets up the following iteration

Here's an example:

```javascript
for (let i = 0; i < 5; i += 1) {
  console.log(`Iteration ${i}`);
}
```

To point out the three components:
- **Initialization:** `let i = 0`
- **Condition:** `i < 5`
- **Increment:** `i += 1`

**Question:** What would the above loop print out?

**Question:** What Ruby code could you use to achieve the same thing?

#### more `for` Loops
There are a few other types of for loops that are useful. These are a bit more similar to the `each` loops we are used to seeing in Ruby.

**`for`...`in`...**

The `for...in` loop iterates over the keys of a collection. This is most useful when working with an object (similar to a Ruby hash). We haven't discussed objects in detail yet, but the following syntax should seem familiar:

```javascript
let pets = {
  kari: 'Kylo',
  dan: 'Gecky',
  dee: 'Samson',
};

for (let human in pets) {
  console.log(`${ human }'s pets: ${ pets[human] }`);
}

// kari's pets: Kylo
// dan's pets: Gecky
// dee's pets: Samson
```

**Question:** What do you get when you use a `for...in` loop on an array? Why might this be useful?

**`for`...`of`...**

This `for` loop gives us access to each element's value within an array. This is the closest option to our `each` loop in Ruby, for this data type.

```javascript
let animals = ['horse', 'cat', 'dog'];

for (let animal of animals) {
  console.log(`A ${ animal } is a cool animal!`);
}
```

Note that this `for` loop can be used with many other data types beyond arrays. You can read more about those options [here](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/for...of).

#### `while` Loop
JavaScript also uses the `while` loop in a similar way to the way we use it in Ruby. The following code does the same thing as the `for` loop above, more verbosely.

```javascript
let i = 0;
while (i < 10) {
    console.log(`Iteration ${i}`);
    i++;
}
```

Like in Ruby, `while` loops are commonly used when you don't know quite how many iterations you need. This commonly comes up when interacting with humans or other things outside your program.

#### [The `forEach` loop](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach)

JavaScript has a `forEach` loop that allows you to iterate over the elements of an array, similar to Ruby's `each` loop. However, there are some substantial differences - `forEach` takes a function as an argument. Since we haven't learned about those yet we'll hold off on showing the syntax until later.

## What Did We Accomplish?

- Install Node, so we can run JavaScript from the command line
- Define variables
  - `let` for local variables
  - `const` for constants
  - `var` for legacy code
- Discuss the different variable types
  - `null`
  - `undefined`
  - Boolean
  - Number
  - String
  - Array
  - Object
- Demonstrate conditionals
- Briefly show the three types of loop
  - `for` loops
  - `while` loop
  - `forEach` loop

## Additional Resources

As with HTML and CSS, there are two main educational resources about JavaScript: W3Schools and the Mozilla Developer Network (MDN). While W3Schools has a flashier website and better SEO, their information is sometimes incomplete or out-of-date. MDN is considered to be a much more in-depth and reliable source.

- [MDN intro to JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Introduction)
- [MDN re-introduction to JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/A_re-introduction_to_JavaScript) - worth going over once you're comfortable with the basics
- [JavaScript: The Good Parts](http://shop.oreilly.com/product/9780596517748.do) - wonderful (and delightfully slim) dead trees book on the language
- [MDN Loops](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Loops_and_iteration)
