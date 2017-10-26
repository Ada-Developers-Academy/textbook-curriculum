# JavaScript Classes

## Introduction

JavaScript uses prototype-based objects.  This works, but is very awkward for OOP-trained developers.  So for ES6 classes were introduced as syntactical sugar to allow developers to write classes and OOP code, like we did in Ruby, for JavaScript.  It's important to remember that classes don't change how JavaScript behaves, instead it provides a more traditional framework for the developer and the interpreter converts it all behind the scenes into prototype based OOP.

**Note**: Classes were introduced to JavaScript in ES6 and are not available in older browsers.

## Learning Goals
By the end of this you should be able to:
- Explain how JavaScript creates object instances with __prototypical__ objects.  
- Create your own classes with instance variables and methods.
- Use `static` to create class methods.
- Use `extends` to create subclasses and use super to access a parent class' attributes & methods.

## JavaScript Objects

As we saw in the intro you can create an object that is very similar to a Ruby hash.  Objects can contain any kind of variable, including arrays, functions and even other objects.  Remember you can use a `this` to refer to the object similarly to Ruby's `self`.  Here's an example:

```javascript
let myDog = {
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
    return `${this.name}, a ${this.breed} owned by ${this.owner.name}`;
  }
};
```

## Prototype-based Objects

You can create an object manually like a Ruby hash, but to create a template to generate objects from like you would with a Ruby class.

```javascript
const SALESTAX = 0.08;
let Book = function(title, author, price) {
  this.title = title;
  this.author = author;
  this.price = price;
};

Book.prototype.totalPrice = function() {
  return this.price + this.price * SALESTAX;
}

let forWhomtheBell = new Book("For Whom the Bell Tolls", "Hemmingway", 15);

console.log(forWhomtheBell.totalPrice());
console.log(forWhomtheBell.title);

> 16.2
> For Whom the Bell Tolls
```

The function `Book` above, called a **constructor** creates instance variables by attaching them to it's context `this`.    Every function has a prototype object as a field in JavaScript and instances created with `new` gain the prototype of it's constructor method.

So instance of `Book` created with `new Book` will run the constructor and gain any methods and properties from the `Book` prototype.

If you think this is a little odd... yes it is.  

Fortunately as of [ES6](http://es6-features.org/#ClassDefinition), JavaScript has added some syntactical sugar to let us write classes and the JavaScript interpreter will convert that into __prototypical__ objects.  

**So why cover this?**  It's important to know when you inspect and examine JavaScript code in debuggers that behind the scenes things are actually done using functions and prototypes.  Classes are simply syntax sugar to make our lives as devs easier.  Also as a developer, you will often work on an existing codebase that predates classes, and with team members who still write JavaScript code using the older methods.  

## Introducing Classes

In Ruby classes look like this:

```ruby
class Book
  attr_reader :title, :author
  def initialize(name, author)
    @title = title
    @author = author
  end

  def to_s      # Each dog instance is unique
    "#{@title} by #{@author}"
  end
end

# Test it out
my_book = book.new ("Pragmatic Thinking & Learning", "Hunt")
puts my_book.to_s   # Instance method

```

When you create a new book instance the `initialize` method runs and sets the instance variables to starting values.  

Below is this Book class written in JavaScript.  It has a title, and author attributes and a `toString` method which outputs the object as a String.  Notice that everything in a class falls between the curly braces without any commas to separate each item.  

```javascript
class Book {
  constructor(title, author) {
    this.title = title;
    this.author = author;
  }

  toString() {
   return `${this.title} by ${this.author}`;
  }
}

let warAndPeace = new Book("War and Peace", "Leo Tolstoy");

console.log(warAndPeace.toString());
> War and Peace by Leo Tolstoy
```

Classes can also be declared as an expression, similar to a function.

```javascript
const Book = class {
 // code
};
```


## Methods

In a JavaScript class, methods are functions declared inside the class, without the `function` keyword.  There are a number of special functions such as __constructor__, __getter methods__ and __setter methods__.

### Constructor Methods

The constructor method is a special method named `constructor` which is called when a new instance is created.  You can think of it like an `initialize` method from Ruby.  Constructors exist to start our instances off in a proper state.  Use them to set your attributes with initial values using `this.<attributeName>` to create attributes (similar to using @ in Ruby).

```javascript
class Book {
  constructor(title, author) {
    console.log("Constructor Ran!");
    this.title = title;
    this.author = author;
  }
}

let poodr = new Book("Practical Object Oriented Programming in Ruby", "Sandy Mietz");

> Constructor Ran!
```

### Instance Methods

Instance methods are created like a constructors with their own names.  

```javascript
const SALESTAX = 0.08;

class Book {
  constructor(title, author, price) {
    this.title = title;
    this.author = author;
    this.price = price;
  }
  totalPrice() {
    return this.price * (1.0 + SALESTAX);
  }
}

var adaBook = new Book("Poodr", "Sandy Meitz", 100);
console.log(adaBook.totalPrice());
> 108
```

### Getter & Setter Methods

Getter methods are methods which are run when a property with the same name is accessed.  Similarly a Setter method is called when there is an attempt to change a property.  

```javascript
class Book {
  constructor(title, author) {
    console.log("Constructor Run!");
    this._title = title;
    this._author = author;
  }

  // getter methods
  get author() {
    return this._author;
  }

  // setter method
  set author(newAuthor) {
    if (typeof newAuthor === "string") {
      this._author = newAuthor;
    }
  }

}
let poodr = new Book("Practical Object Oriented Programming in Ruby", "Sandy Meitz");

// setter method
poodr.author = "Chris";

console.log(`${poodr.author}`); // getter method
> Chris
```

Notice that the properties are all named __\_propertyName__.  This is a typical naming convention for instance variables you want to keep private.  It's a convention that signals an intent to prevent access outside the class as nothing is really private in JavaScript.  Properties cannot have the same names as our getter and setter methods as doing so will result in infinite recursion.  

**Question**:  Why would naming the property the same as the getter or setter method result in infinite recursion?

**Exercise**:  Create getter and setter methods for title.

### Static Methods

Static methods are equivalent to class methods in Ruby.  They are attached to the class rather than instances of the class.


```javascript
class Book {
  constructor(title, author, price) {
    this.title = title;
    this.author = author;
    this.price = price;
  }

  static compare(bookA, bookB) {
    return bookA.price - bookB.price;
  }
}

let poodr = new Book("Practical Object Oriented Programming in Ruby", 49);
let learnToProgram = new Book("C Learn to Program", "Bjarne Stroustrup" 30);

console.log(Person.compare(poodr, learnToProgram));
> 19
```

Like a Ruby class method the above example calls the static method with the name of the class as `Book.compare`.  Trying to call the method with `poodr.compare(poodr, learnToProgram);` will result in a TypeError.  

## Inheritance

Classes can be subclassed using the `extends` keyword.  

```javascript
class Book {
  constructor(title, author) {
    this.title = title;
    this.author = author;
  }

  toString() {
    return `${this.title} by ${this.author}`;
  }

}

class Textbook extends Book {

  constructor(title, author, subject) {
    super(title, author);

    this.subject = subject
  }
  toString() {
    return super.toString() + " about: " + this.subject;
  }

}

let cHowToProgram = new Textbook("C How to Program", "Bjarne S", "Comp Sci");
console.log(cHowToProgram.toString());
>  C How to Program by Bjarne S about: Comp Sci
```

In the example above we can use the `super` keyword to access the parent class'  version of the `toString` method and we overrode the parent class' method to add our own functionality.  

## Summary

In this less we have seen:
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
