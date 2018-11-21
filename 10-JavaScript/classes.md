# Object-Oriented Classes in JavaScript

## Learning Goals
- Understand on a high-level that ES6 introduced classes as syntactical sugar
- By the end of this you should be able to:
  - Create your own classes with instance variables and methods.
  - Use `static` to create class methods.
  - Use `extends` to create subclasses.
  - Use `super` to access a parent class' attributes & methods.


## Introduction: JavaScript uses Prototype-Based Objects

JavaScript uses prototype-based objects.  This works, but is very awkward for OOP-trained developers.  So for ES6, classes were introduced as syntactical sugar to allow developers to write classes and __classical__ OOP code, like we did in Ruby, for JavaScript.  It's important to remember that classes don't change how JavaScript behaves, instead it provides a more traditional framework for the developer.  The interpreter converts it all behind the scenes into prototype based OOP.



## Introducing Classes

Fortunately as of [ES6](http://es6-features.org/#ClassDefinition), JavaScript has added some syntactical sugar to let us write classes and the JavaScript interpreter will convert that into __prototypical__ objects.  This lets us write more familiar syntax and get the Object-Oriented results we're used to.  

**So why cover prototypical syntax?**  It's important to know when you inspect and examine JavaScript code in debuggers that behind the scenes things are actually done using functions and prototypes.  Classes are simply syntax sugar to make our lives as devs easier.  Also as a developer, you will often work on an existing codebase that predates classes, and with team members who still write JavaScript code using the older methods.  


### Our Example: `Zine`

For this lecture, we will be building the class `Zine`. [A zine](https://en.wikipedia.org/wiki/Zine), short for magazine or fanzine, is a small-circulation self-published work of text and images, usually reproduced via photocopier. Zines are either the product of a single person, or of a very small group and are popularly photocopied into physical prints for circulation.

A zine is like a small, self-published book. They have titles and authors (or contributors, illustrators, editors, writers, etc.), pages, and content.

We chose the example class `Zine` because we were bored of teaching `Book`s.

## Syntax

In Ruby, defining a class and then creating an instance of one looks like this:

```ruby
class Zine
  def initialize(title)
    @title = title
  end
end

zine = Zine.new 'So you want to be a wizard'
```

In JavaScript, defining a class and then creating an instance of one looks like this:

```javascript
class Zine {
  constructor(title) {
    this.title = title;
  }
}

let zine = new Zine('So you want to be a wizard');
```

### Try it
Let's make our first class! Open up the node console and put in the definition for the `Zine` class (typing the code from above into the node console or copying/pasting it into the node console will both work).

Then, make many instances of the `Zine` class. Make an instance of `Zine`s with the following titles:

1. So you want to be a wizard
1. Bite Size Command Line!
1. Linux debugging tools you'll love

You should get input that looks like this:

```javascript
const wizardZine = new Zine('So you want to be a wizard');
> undefined
wizardZine
> Zine { title: 'So you want to be a wizard' }
const commandLineZine = new Zine('Bite Size Command Line!');
> undefined
commandLineZine
> Zine { title: 'Bite Size Command Line!' }
const linuxZine = new Zine('Linux debugging tools you\'ll love');
> undefined
linuxZine
> Zine { title: 'Linux debugging tools you\'ll love' }
```

Congratulations! You made your first class in JavaScript!

---

In Ruby, a more fully-developed class with methods may look like this:

```ruby
class Zine
  attr_reader :title, :contributor
  def initialize(title, contributor)
    @title = title
    @contributor = contributor
  end

  def to_s # Each zine instance is unique
    "#{@title} by #{@contributor}"
  end
end

# Test it out
zine = Zine.new("So you want to be a wizard", "Julia Evans")
puts zine.to_s  # Instance method
```

When you create a new `Zine` instance, the `initialize` method runs and sets the instance variables to starting values.  

Below is this `Zine` class written in JavaScript.  It has `title` and `contributor` attributes set in the `constructor` method and a `toString` method which outputs the object as a String.  Notice that everything in a class falls between the curly braces **without any commas to separate each item.**

```javascript
class Zine {
  constructor(title, contributor) {
    this.title = title;
    this.contributor = contributor;
  }

  toString() {
    return `${this.title} by ${this.contributor}`;
  }
}

let zine = new Zine('So you want to be a wizard', 'Julia Evans');

console.log(zine.toString());
// So you want to be a wizard by Julia Evans
```

Classes can also be declared as an expression:

```javascript
const Zine = class {
 // code
};
```

## Methods

In a JavaScript class, methods are functions declared inside the class, without the `function` keyword.  There are a number of special functions such as __constructor__, __getter methods__ and __setter methods__.

### Constructor Methods

The constructor method is a special method named `constructor` which is called when a new instance is created.  You can think of it like an `initialize` method from Ruby.  Constructors exist to start our instances off in a proper state.  Use them to set your attributes with initial values using `this.<attributeName>` to create attributes (similar to using @ in Ruby).

```javascript
class Zine {
  constructor(title, contributor) {
    console.log('Constructor Ran!');
    this.title = title;
    this.contributor = contributor;
  }
}

let wizardZine = new Zine('So you want to be a wizard', 'Evans');

> Constructor Ran!
```

**Exercise**:  With a fellow classmate create an `Animal` class similar to `Zine` above.  The `constructor` should take a `sound` parameter and save it in an instance variable.  Then create an instance of the class.  Verify that it works.

### Instance Methods

Instance methods are created like constructors with their own names.

```javascript
const SALESTAX = 0.08;

class Zine {
  constructor(title, contributor, price) {
    this.title = title;
    this.contributor = contributor;
    this.price = price;
  }

  totalPrice() {
    return this.price * (1 + SALESTAX);
  }
}

let wizardZine = new Zine('So you want to be a wizard', 'Evans', 1.00);
console.log(wizardZine.totalPrice());

> 1.08
```

**Exercise**:  For our `Animal` class, create a `speak` method which will print the sound to the console.  Try it out to verify that the method is working.

### Getter & Setter Methods

Getter methods are methods which are run when a property with the same name is accessed.  Similarly a Setter method is called when there is an attempt to change a property.  

```javascript
class Zine {
  constructor(title, contributor) {
    console.log('Constructor Run!');
    this._title = title;
    this._contributor = contributor;
  }

  // getter methods
  get contributor() {
    return this._contributor;
  }

  // setter method
  set contributor(newContributor) {
    if (typeof newContributor === 'string') {
      this._contributor = newContributor;
    }
  }

}
let wizardZine = new Zine('So you want to be a wizard', 'Evans');

// setter method
wizardZine.contributor = 'Chris';

console.log(wizardZine.contributor); // getter method
> Chris
```

Notice that the properties are all named __\_propertyName__.  This is a common naming convention for instance variables you want to keep private.  It's a convention that signals an intent to prevent access outside the class as nothing is **really** private in JavaScript.  Properties cannot have the same names as our getter and setter methods as doing so will result in infinite recursion.  

**Question**:  Why would naming the property the same as the getter or setter method result in infinite recursion?

At Ada, we will not use getter and setter functions and not use the  __\_propertyName__ convention, but it is a convention you will likely encounter.  Instead we will create regular functions to access and change variables as per [AirBNB's style guide](https://github.com/airbnb/javascript#accessors--no-getters-setters).  This is because they can cause unexpected side-effects because we're treating functions like they are instance variables.

For example if I wrote:
```javascript
wizardZine.contrib = 'Devin';
```
Even if there is no attribute named `contrib`, this code will give __no error__ at all!  Because Objects are extendable (you can always add more attributes), this will not result in an error message and tracking down the bug is harder to spot.  You can read more about it [here.](https://nemisj.com/why-getterssetters-is-a-bad-idea-in-javascript/)

**Exercise**:  Create getter and setter methods for the `Animal`'s `sound`' so that you can do:  `myAnimal.sound = 'Ruff'` and `console.log(myAnimal.sound)`.

**Exercise** After you have created getter and setter methods, convert them into regular methods named `getSound` and `setSound`.

### Static Methods

Static methods are equivalent to class methods in Ruby.  They are attached to the class rather than instances of the class.

```javascript
class Zine {
  constructor(title, contributor, price) {
    this.title = title;
    this.contributor = contributor;
    this.price = price;
  }

  static lowestPrice(zineA, zineB) {
    if (zineA.price <= zineB.price) {
      return zineA.title;
    }
    return zineB.title;
  }
}

const wizardZine = new Zine('So you want to be a wizard', 'Evans', 2.00);
const linuxZine = new Zine('Linux debugging tools you\'ll love', 'Evans', 1.00);

console.log(Zine.lowestPrice(wizardZine, linuxZine));
> Linux debugging tools youll love

```

Just like a Ruby class method, the above example calls the static method on the name of the class as `Zine.lowestPrice`.  Trying to call the method with `wizardZine.lowestPrice(wizardZine, linuxZine);` will result in a TypeError.

**Exercise**:  Add a static method to Animal called `createAnimals`, which takes an array of Strings (sounds) and returns an Array of Animals which make those sounds.  

## Inheritance

Classes can be subclassed using the `extends` keyword.  

```javascript
class Zine {
  constructor(title, contributor) {
    this._title = title;
    this._contributor = contributor;
  }
  // .. getter & setter functions
  toString() {
    return `${this._title} by ${this._contributor}`;
  }

}

class Fanzine extends Zine {

  constructor(title, contributor, subject) {
    super(title, contributor);

    this._subject = subject;
  }
  toString() {
    return `${super.toString()} about: ${this._subject}`;
  }

}

const janusAndAurora = new Fanzine('Janus & Aurora', 'Ursula K. Le Guin', 'Science Fiction');
console.log(janusAndAurora.toString());
>  Janus & Aurora by Ursula K. Le Guin about: Science Fiction
```

In the example above we can use the `super` keyword to access the parent class' version of the `toString` method and we overrode the parent class' method to add our own functionality.

**Exercise**:  Create a `Cat` class that extends `Animal` and has a name attribute, with getter and setter methods.  All `Cat` instances should "Meow" when speaking.

## Summary

In this lesson we have seen:
- How to use classes to create object instances
- How to use a constructor to set up a new object in proper state
- Add instance methods including getter and setter methods to control access to our attributes.
- Create static methods using the `static` keyword
- Extend existing classes with subclasses

## Resources
- [MDN on classes](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes)
- [MDN on getter methods](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/get)
- [MDN on setter methods](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/set)
- [JavaScript ES6 Class Syntax](https://coryrylan.com/blog/javascript-es6-class-syntax)
