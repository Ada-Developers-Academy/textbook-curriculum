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

> I want to learn a new programming language. The best way for me to learn it is by playing with it, seeing what I can do, and seeing what breaks it, in a safe and quick way. What tools can I use?

> _-- Some cool programmer learning a new language_

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
- `undefined`
- `Object`
- `Function`
  - similar to arrays, technically these aren't a distinct type, but we won't get into that now, and it's worthwhile to separate it on this list

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
1. `['foo', 1, 2, 'bar', 'baz'][0];`
1. `['foo', 1, 2, 'bar', 'baz'][3];`
1. `['foo', 1, 2, 'bar', 'baz'][-1];`
1. `['foo', 1, 2, 'bar', 'baz'].length;`
1. `['foo', ['this', 'is', 'a', 'nested', 'array'], 1, 2];`
1. `['foo', ['this', 'is', 'a', 'nested', 'array'], 1, 2].length;`

<details>

  <summary>
    Compare your answers here
  </summary>

  1. `[ 1, 2, 3, 4 ]`
  1. `[ 'foo', 1, 2, 'bar', 'baz' ]`
  1. `'foo'`
  1. `'bar'`
  1. `undefined` (we will get into what this means in a minute, but know that it means that we can't index by `-1` in JavaScript)
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

---

Take a break! After the break, we'll look at things that aren't so similar to Ruby

---

### `undefined` is what's returned when a value is undefined

When we try to access (retrieve) a variable with no assigned value, JS returns undefined.

We don't know how to define (declare and assign) a variable yet, but just go with us on this one:

In your Node REPL, input these lines. Do you get what you expect?

1. `apple;`
1. `let apple;`
1. `apple;`

<details>

  <summary>
    Compare your answers here
  </summary>

  1. `Thrown: ReferenceError: apple is not defined`
  1. `undefined`
  1. `undefined`

</details>

<br/>

What is our takeaway? When we work with variables in JavaScript, if we work with a variable with no defined value (as in, it's never been assigned a value with the assignment operator (`=`)), then we might see `undefined`.

### Objects are Everything

In JavaScript, [objects](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object) are things that have name/value pairs.

We will begin our understanding of objects in JavaScript by comparing them to hashes in Ruby. **However, it is crucial to know that JavaScript objects are very different from hashes in Ruby.** We will discover those differences later.

Note the following similarities between JavaScript objects and Ruby hashes:

- They are both declared (set-up) using curly braces (`{}`)
- You can access properties with bracket notation
- You can additionally access properties with dot notation

In your Node REPL, copy and paste these lines. Do you get what you expect?

1.
    ```javascript
    let testObj = {
      someNum: 5,
      someStr: 'this is a test string',
      someNestedObj: {
        someOtherNum: 4,
      }
    };
    ```
1. `testObj;`
1. `testObj['someNum'];`
1. `testObj.someNum;`
1. `testObj.someStr;`
1. `testObj.someNestedObj;`
1. `testObj.someNestedObj.someOtherNum;`

<details>

  <summary>
    Compare your answers here
  </summary>

  1. `undefined`
  1. 
      ```javascript
      { someNum: 5,
        someStr: 'this is a test string',
        someNestedObj: { someOtherNum: 4 } }
      ```
  1. `5`
  1. `5`
  1. `'this is a test string'`
  1. `{ someOtherNum: 4 }`
  1. `4`

</details>

### Functions

We will spend the rest of our time in JavaScript thinking about functions, so stay tuned. ;)

## What Did We Accomplish?

- Install Node, so we can run JavaScript from the command line
- Practice using the node REPL accessed with `$ node`
- Compare the different data types between Ruby and JavaScript
  - `Boolean`
  - `Number`
  - `String`
  - `Array`
  - `null`
  - `undefined`
  - `Object`
  - `Function`

## Summary: The Data Type Ruby vs. JavaScript Abbreviated List

| Data Type | Things to note about Ruby vs. JavaScript |
| --- | --- |
| Boolean | -
| Number | JavaScript has its own definitions for float math, infinity, and `NaN` (Not a Number)
| String | We prefer making Strings with single-quotes (`''`). To do string interpolation, we need to use the syntax `${}` and backticks instead of single-quotes
| Array | -
| null | -
| undefined | Will be useful when we think about variables that may have never been assigned a value
| Object | Our base understanding will come from Ruby's hashes, but will soon evolve
| Function | We will get into this more in-depth later

## Additional Resources

As with HTML and CSS, there are two main educational resources about JavaScript: W3Schools and the Mozilla Developer Network (MDN). While W3Schools has a flashier website and better SEO, their information is sometimes incomplete or out-of-date. MDN is considered to be a much more in-depth and reliable source.

- [MDN intro to JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Introduction)
- [MDN re-introduction to JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/A_re-introduction_to_JavaScript) - worth going over once you're comfortable with the basics
- [JavaScript: The Good Parts](http://shop.oreilly.com/product/9780596517748.do) - wonderful (and delightfully slim) dead trees book on the language
- [MDN Loops](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Loops_and_iteration)
