# More Intro to JavaScript!

## Learning Goals

- Recognize the difference of declaration and assignment in JavaScript
- Know that the different types of variables in JavaScript differ in scope and assignment
- See the different syntax to declare the different types of variables in JavaScript
- Understand that we prefer `let` and `const` variables in JavaScript
- Gain exposure in how to do conditional logic in JavaScript
- Gain exposure to how to do some kinds of iteration in JavaScript with `for` and `while`

## Variables are Declared, then Assigned, then Maybe Re-Assigned

## Variables
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