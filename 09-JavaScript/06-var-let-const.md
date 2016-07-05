# `var`, `let`, and `const`
## Learning Goals
- Meet the new-ish variable keywords
- Review what `var` means in terms of scope
- See how each variable keyword acts in similar situations

## `var`
`var` is now the weakest signal available when you define a variable in JavaScript. The variable may or may not be reassigned, and the variable may or may not be used for an entire function, or just for the purpose of a block or loop. It does the job of keeping a variable from being defined in the global scope, but isn't mush use otherwise.

```javascript
  var two = 10
  // two is available in child scopes
  function addsTwo (n) {
    return n + two
  }

  function addsTwoForReal (n) {
    // var creates a variable bound to the current scope
    var two = 2
    return n + two
  }

  console.log(addsTwo(2)) // 12
  console.log(addsTwoForReal(2)) // 4
  console.log(two) // 10
```

## `let`
Similar to `var`, let creates a variable bound to the local scope. The key difference is that __variables defined with `let` are not available outside their scope__. This means `let` works a lot like a local variable in Ruby; variables declared with `let` have _block scope_, while variables declared with `var` have _functional scope_.

```javascript
// functional scope - i will stick around after the loop
for (var i = 1; i < 3; i++) {
  console.log('i is ', i)
  // i is 1
  // i is 2
}
console.log('now i is', i) // now i is 3


// block scope - j will be cleaned up after the loop
for (let j = 10; j < 12; j++) {
  console.log('j is ', j)
  // j is 10
  // j is 11
}
console.log('now j is ', j) // error - j is not defined
```

`let`'s behavior is more what we'd expect from local variables. It was added in ES6 specifically to solve/simplify some of the common problems/complexities with managing variable scope in JavaScript. Here's another example of _block scope_ with `let`:

```javascript
var a = 1
var b = 2

if (a === 1) {
  var a = 11 // the scope is global; this mutates a
  let b = 22 // the scope is inside the if block; this allocates a new variable

  console.log(a) // 11
  console.log(b) // 22
} 

console.log(a) // 11
console.log(b) // 2
```

### Using `let`
If you're writing JS on the server with Node, you can use `let` anywhere you can use `var`.

If you're writing JS in the browser, using `let` is a little more complicated. Let's look at the browser compatibility table over on [MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/let#Browser_compatibility).

## `const`
Make constants with `const`! Mostly. It doesn't work in all browsers, and it only prevents _reassignment_, not _mutation_. ¯\\_(ツ)_/¯

Variables delcared with `const` have _block scope_, like `let`. Attmpeting to reassign a `const` will result in an error.

```javascript
const n = 20
n = 7 // TypeError: Assignment to constant variable.
console.log(n) // 20

// constants have block scope! don't forget!!!
if (n === 20) {
  const n = 'not 20' // this allocates a new constant in the block scope of `if`
  console.log(n) // not 20
}
console.log(n) // 20 - back to the original scope
```

So constant is rad as a signal to other developers that they shouldn't mess with a value. But let's look at how `const` variables can still be changed:

```javascript
const obj = {x: 1}
obj = 7 // TypeError: Assignment to constant variable. (as expected)
obj.y = 7 // no error; mutates obj
console.log(obj) // { x: 1, y: 7 } 

// one more example
const taco = ['tortilla', 'seasoned beef', 'cheese']
taco.push('salsa') // no error; mutates array
console.log(taco) // [ 'tortilla', 'seasoned beef', 'cheese', 'salsa' ]

taco.pop() // no error; mutates array
console.log(taco) // [ 'tortilla', 'seasoned beef', 'cheese' ]

taco = [] // TypeError: Assignment to constant variable.
console.log(taco) // [ 'tortilla', 'seasoned beef', 'cheese' ]
```

### Using `const`
Node implements `const` completely, so use it anytime you'd like in Node projects.

Browser support is much more spotty. Again, [MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/const#Browser_compatibility) has the details.
