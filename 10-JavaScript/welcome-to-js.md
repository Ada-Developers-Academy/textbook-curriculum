# Welcome to JavaScript!
## Learning Goals
- What & Why JavaScript?
- Discover the varying applications of JavaScript
- Learn where Node and npm fit in all of this
- Learn about _datatypes_ and _functions_ in JS

## The roots of JS
Straight from [Wikipedia](https://en.wikipedia.org/wiki/JavaScript): JavaScript was originally developed in 10 days in May 1995 by Brendan Eich, while he was working for Netscape Communications Corporation.

Although it was developed under the name Mocha, the language was officially called LiveScript when it first shipped in beta releases of Netscape Navigator 2.0 in September 1995, but it was renamed JavaScript when it was deployed in the Netscape browser version 2.0B3.

The change of name from LiveScript to JavaScript roughly coincided with Netscape adding support for Java technology in its Netscape Navigator Web browser. The final choice of name caused confusion, giving the impression that the language was a spin-off of the Java programming language, and the choice has been characterized as a marketing ploy by Netscape to give JavaScript the cachet of what was then the hot new Web programming language.

## Node is changing the game
[Node.js](https://nodejs.org/en/) is an open-source, cross-platform runtime environment for developing server-side Web applications. Although Node.js is not a JavaScript framework, many of its basic modules are written in JavaScript, and developers can write new modules in JavaScript. The runtime environment interprets JavaScript using Google's V8 JavaScript engine (same as what's in Chrome).

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

Alright. Now, `node --version` should report to you something like `v8.X.X`. Yay! We'll use Node's command line program to do all the same things we did with Ruby's. We can use Node to run JavaScript programs (`$ node my_program.js`) and use Node as a _REPL_ (`$ node`).

Node is also packaged with __npm__, the _Node Package Manager_. npm is to Node like gem is to Ruby. We'll use npm to define, install, and manage dependencies in our Node applications.

## JavaScript and Ruby are like cousins
JavaScript is an _interpreted_ language, like Ruby. It's also object oriented and dynamically typed, like Ruby. Syntactically, it is comparable to Ruby, but with some cornerstone differences. Here's an example:

```ruby
x = 10
y = 15
puts x + y
```

```javascript
let x = 10;
let y = 15;
console.log(x + y);
```

We'll talk in detail about all the code above, but the similarities are striking. Here's a Ruby array: `[1,2,3,4,5]` and the equivalent array in JavaScript: `[1,2,3,4,5]`. Funny, right?

Ok, don't let these similarities lull you into thinking JS is just like Ruby. While we will reuse much of the language to describe code--functions, objects, variables, arguments, scope, and so on--JavaScript has a different approach to organizing and accessing objects and functions.

## Using the Node REPL
Start the REPL by typing `node` in the terminal. You'll get a caret (`>`) prompt. From here, you can enter code and have it evaluated, just like using `irb` or the Rails console:

```
$ node
> let x = 7;
undefined
> x + 2
9
> typeof x
'number'
>
```

__Hint: Use `.exit` or ctrl-d to get out of the Node REPL__

Now that we've got a REPL available to us, let's jump in with some JavaScript specifics. We are going to talk about __variables__, __datatypes__, and __functions__.

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
[MDN Data Types and Data Structures](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures)

JavaScript's basic _types_ are similar to Ruby's: `Boolean`, `Null`, `Undefined`, `Number`, `String`, `Array`, `Object`, and `Function`.

#### `Boolean` is `true` or `false`
```javascript
let t = true;
let f = false;
```

#### `Null` is the value null. This represents an "empty" value.
```javascript
let empty = null; // similar to Ruby's nil
```

#### `Undefined` is the value undefined.
When a variable which has not declared is accessed, JS returns undefined.

```javascript
let u;
console.log(u); //-> undefined
```

#### `Number` is a numeric value
It includes integers (1, 2, 3, etc.), floats (1.4, -40.1), infinity (+Infinity, -Infinity), and `NaN` which means "not a number." `NaN` is returned when you do a numeric operation on anything that's not a `Number`.

```javascript
let four = 4,     // Note the comma-separated variable declarations
    two = 2.0;

Infinity < Number.MAX_VALUE  // false
Infinity > Number.MAX_VALUE  // true

two == four / two; // true

// All JS numbers are floats, and floats are not 100% accurate...
0.1 + 0.2 == 0.3; // false!
0.1 + 0.2;

'asdf' - 5; // NaN
```

#### `Strings` are declared with `""` or `''` or use backticks `    ``    `.
The first two are the same. Pick one and stick with it!

Using backticks will allow you to do string interpolation, but some browsers may not have implemented it yet.

```javascript
let str = "This is a string";
str.length;      // 16 - access the length property
str.substr(2,5); // "is is" - call the substr function

let e = "elephant";
console.log("${e} hotdog"); // "${e} hotdog" js doesn't do interpolation with ""
console.log(`${e} hotdog`);  // `elephant hotdog`
```

**Note** JavaScript uses `${}` for string interpolation instead of Ruby's `#{}`
**Note Note** We will standardize on using single quotes `' '` for strings, except in cases of string interpolation (where backticks are required).

JavaScript does not have symbols, and uses strings wherever Ruby would use symbols.

#### Arrays
[Arrays](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) are similar to Ruby arrays. They are declared and accessed with square brackets ([]).

```javascript
let arr = [1, 2, 3, 4];
arr.length;  // 4 - access the length property
             // Note this *cannot* be accessed like a method with parentheses
arr[0];      // 1
arr.pop()    // 4 - call the pop() function
             // Note this method *cannot* be used without the parentheses
arr;         // [1, 2, 3]; pop() mutates the array
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
