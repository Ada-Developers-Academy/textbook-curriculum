# JavaScript 103: Objects
## Learning Goals
- Examine how objects are created and instantiated
- See different ways to create and extend objects
- See how there is not a direct path from Ruby to JavaScript objects

## JavaScript Objects
We spoke briefly about objects in our introductory conversation, but there's way more to JavaScript objects than that. Let's take a deeper look.

### Recap: Hash-like Objects
So far, every object we've built has been defined explicitly in our code. This is very similar to how hashes work in Ruby. Objects can contain any sort of variable, including arrays, functions and even other objects. Remember that inside an object, you can use `this` to refer to that object, similar to Ruby's `self`. Here's an example, just to review:

```javascript
var myDog = {
  name: 'fido',
  breed: 'labrador',
  age: 4,
  speak: function() {
    console.log('woof');
  },
  owner: {
    name: 'Ada',
    address: '1215 4th Ave #1050'
  },
  toString: function() {
    return this.name + ", a " + this.breed " owned by " + this.owner.name;
  }
};
```

This is great for one-off objects, but what if we need to keep track of many similar objects? We'd have to explicitly define each one, which could quickly turn into a lot of repeated code.

### Instantiating Objects

#### Ruby-style: Classical Objects
In Ruby, we solve the problem of many similar objects using classes. We define a class, give it some methods and variables, and then create and manipulate instances of the class.

```ruby
# dog.rb
class Dog
  attr_reader :name, :breed
  def initialize(name, breed)
    @name = name
    @breed = breed
  end

  def speak()
    puts "woof"
  end
end

myDog = Dog.new('fido', 'labrador')
myDog.speak
```

This pattern of defining a class and then instantiating it is very common in object oriented languages, and languages that use it are sometimes said to have _classical_ objects. JavaScript uses a slightly different technique called _prototypical_ objects.

#### JavaScript Style: Prototypical Objects
When building a prototypical object in JavaScript, there are three important steps:
- Define the _constructor_, a function that sets up any details specific to this instance (usually instance variables)
- Define the constructor's `prototype`, an object that establishes pieces common to all instances (usually instance methods)
- Call the constructor using JavaScript's `new` keyword to create new instances of the object

The big idea of prototypical objects is that, rather than defining a special language construct like a class, you create an original object to be the _prototype_ for new objects. Any new object is created as a clone of the original.

```javascript
// dog.js

// First we define the constructor
var Dog = function(name, breed) {
  this.name = name;
  this.breed = breed;
};

// Second we add the prototype
Dog.prototype = {
  speak: function () {
    console.log("woof")
  }
};

// Third we instantiate the object with the new keyword
var myDog = new Dog("fido", "labrador");
myDog.speak();
```

Now we can create as many dogs as we want!

Note the `new` keyword. The syntax is a little different from Ruby, and it's easy to get tripped up.

Note also that `Dog.prototype` is just a JavaScript object. It happens to be the object that JavaScript looks for when a constructor is invoked with `new`, but other than that it behaves just as we've seen before. So you could do things like:

```javascript
// Call a function from the prototype directly
Dog.prototype.speak();

// Add a function to the prototype
Dog.prototype.isHungry = function() {
  return true; // always hungry
};
```

### Example: Calculator
Here is another example: a `Calculator` object that keeps track of a result as you do mathematical operations. Note the use of `prototype` to add new functions to `Calculator`. Using this, I can _instantiate_ as many calculators as I need. Consuming this function looks like this:

```javascript
var Calculator = function(x) {
  this._x = x; //let's talk a moment about _x
};

Calculator.prototype = {
  addition: function(n) { return this._x += n; },
  subtract: function(n) { return this._x -= n; },
  division: function(n) { return this._x /= n; },
  multiply: function(n) { return this._x *= n; }
};

var calc = new Calculator(0);
calc.addition(4); // 4
calc.multiply(3); // 12
calc.division(2); // 6
calc.subtract(14); // -8
```

### Inheritance
Inheritance in JavaScript is complicated! It also doesn't come up all that often, and because the syntax is so weird many common JavaScript libraries provide their own custom version of it. As such we won't cover it in detail in this course. If you're interested in learning more about how it works in raw JavaScript, check out [the MDN guide](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Objects/Inheritance).

## A Note About the `class` Keyword in ES6.
When reading about JavaScript, you'll come across folks excited about [ES6 adding some new keywords](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes) like `class`, `extends`, `constructor`, and `super`. These keywords will allow us to build objects and inheritances that feel more familiar to us. However, JavaScript will remain a prototypal language; these keywords are just syntactic sugar sprinkled on top of what we are doing here with `prototype`.

## READING IS FUNDAMENTAL!
- [Prototypal Inheritance in JavaScript](http://javascript.crockford.com/prototypal.html)
- [MDN Docs on JS Prototypes](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Inheritance_and_the_prototype_chain)
