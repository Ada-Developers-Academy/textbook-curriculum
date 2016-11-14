# Fun with Functions!
## Learning Goals
- Learn how Javascript functions are different than Ruby methods
- Distinguish between a function _expression_ and a function _declaration_
- Begin exploring what _higher order_ functions are

## Functional expressions vs. Function declarations
Javascript's appeal and power and flexibility are in the myriad ways we can interact with functions.

* Functions are __objects__
* `var foo = function(bar){};` vs. `function foo(bar){}`
* In _many_ cases, the differences here are nominal, but it's important to understand the first example is an __expression__ while the second is a __declaration__.
* [This StackOverflow answer is one of the best I've seen in describing the difference and when it matters](http://stackoverflow.com/questions/3887408/javascript-function-declaration-and-evaluation-order).
* In general you should always prefer the expression syntax when defining functions. The expression syntax can be used anywhere that the declaration syntax can be used, as well as additional places. Plus, the expression syntax has semantics that match the semantics of regular variables which is important because functions are variables!

### Functions, methods, constructor calls
```javascript
var foo = function() { console.log('nah'); }
var obj = {
  foo: function() {
    console.log('foo!');
  }
}

var MyObject = function(){};
//prototypes is how JS does inheritance. We will take more about them later
MyObject.prototype.foo = function(){ console.log('meh'); };

var o = new MyObject(); //makes a new instance of MyObject
```

### Calling functions directly
```javascript
foo(); // 'nah'
obj.foo(); //'foo!'
o.foo(); //'meh'
```

### Passing functions as variables
* Computer scientists call this _higher order functions_ and/or _first-class functions_.

```javascript
var talker = function( sum ){
  console.log( "Yo the sum is: " + sum );
};

var doMath = function( num1, num2, im_a_function ){
  var sum = num1 + num2;
  im_a_function( sum ); //Hey! let's execute the function we were given!
};

doMath(1000, 2, talker); //Hey! talker is a function!
doMath(1000, 2, function(x) { Math.pow(x, 2); }) //Hey! this is an anonymous function!
```

#### Somewhat Practical Example: Array.prototype.sort

```javascript
var backwards = function(x, y){
  if( x > y ){
    return -1;
  }
  if( x < y ){
    return 1;
  }
};

[4, 2, 5, 1, 9, 5].sort(); //=> [1, 2, 4, 5, 5, 9]
[4, 2, 5, 1, 9, 5].sort( backwards ); //=> [9, 5, 5, 4, 2, 1];
```

### Functions
Functions in JavaScript are __awesome__. Rather than using the `def` keyword like we're used to, JavaScript uses the `function` keyword to declare a function. They are more "pure" than Ruby methods and can be put in variables, and passed around like any other type. We will spend a lot of time talking about functions as they are the cornerstone of understanding JavaScript.

```javascript
function choicier(choice1, choice2) {
  if (choice1 == choice2) {
    return "These are the same!";
  } else {
    return "These are not the same!"
  }
}

// You **must** use parens to execute a function
choicier; // this returns the function
choicier(4, 4) // "These are the same!" - execute the function and returns the result
```

```javascript
var adder = function (a, b) {
  return a + b;   // You need to explicitly call return in JavaScript
}

// You need to use parens to call your function!
adder;        // this returns the function that you just declared
adder(1, 2);  // 3 - this executes the function and returns the result
```

#### A note about `this`
The keyword `this` is probably the most misunderstood concept in JavaScript. At its core, `this`, when invoked inside a function, refers to the invocation _context_ of the containing function (wat). Essentially, `this` is kinda like `self` in Ruby (this object, right here), but it is much, much more common in JavaScript for functions to be executed in contexts beyond where they were declared.

As we explore how functions work, we will also discover the ins and outs of `this`. For now, we can think of `this` to mean _this object, right here_.

```javascript
  var repeater = function(word) {
    console.log(this);
    return word + word;
  };

  var repeater_object = {
    dog: " bark bark ",
    repeater: function(word) {
      console.log(this);
      return word + word;
    },
    repeat_dog: function(word) {
      // `this` refers to the current object in context
      // most of the time, this will be repeater_object
      return word + this.dog + word + this.dog;
    }
  };

  repeater("cat"); //omg so much stuff
  repeater_object.repeater("cat"); //lots less stuff; why?
  repeater_object.repeat_dog("cat"); //cat bark bark cat bark bark
```

## Additional Resources
* [Slides Used in Class](https://docs.google.com/presentation/d/1QboS170RoaKq2dVwLgXmUZHhzz8I5Cs1H08w0euvmY8/edit?usp=sharing)
* [MDN on Functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Functions)
