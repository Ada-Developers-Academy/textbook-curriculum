# JavaScript Classes

## Introduction

JavaScript uses prototype-based objects.  This works, but is very awkward for OOP-trained developers.  So for ES6, classes were introduced as syntactical sugar to allow developers to write classes and __classical__ OOP code, like we did in Ruby, for JavaScript.  It's important to remember that classes don't change how JavaScript behaves, instead it provides a more traditional framework for the developer.  The interpreter converts it all behind the scenes into prototype based OOP.

## Learning Goals
By the end of this you should be able to:
- Create your own classes with instance variables and methods.
- Use `static` to create class methods.
- Use `extends` to create subclasses and use super to access a parent class' attributes & methods.

##  Introducing Classes

Fortunately as of [ES6](http://es6-features.org/#ClassDefinition), JavaScript has added some syntactical sugar to let us write classes and the JavaScript interpreter will convert that into __prototypical__ objects.  This lets us write more familiar syntax and get the Object-Oriented results we're used to.  

**So why cover prototypical syntax?**  It's important to know when you inspect and examine JavaScript code in debuggers that behind the scenes things are actually done using functions and prototypes.  Classes are simply syntax sugar to make our lives as devs easier.  Also as a developer, you will often work on an existing codebase that predates classes, and with team members who still write JavaScript code using the older methods.  

## Introducing Classes

In Ruby classes look like this:

```ruby
class Book
  attr_reader :title, :author
  def initialize(name, author)
    @title = title
    @author = author
  end

  def to_s      # Each book instance is unique
    "#{@title} by #{@author}"
  end
end

# Test it out
my_book = Book.new("Pragmatic Thinking & Learning", "Hunt")
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

The constructor method is a special method named `constructor` which is called when a new instance is created.  You can think of it like an `initialize` method from Ruby.  Constructors exist to start our instances off in a proper state.  Use them to set your attributes with initial values using `this.<attributeName>` to create attributes (similar to using @ in Ruby).  Yes, functions used to create objects with `new` are also called **constructors** because they set up a new instance.  

```javascript
class Book {
  constructor(title, author) {
    console.log("Constructor Ran!");
    this.title = title;
    this.author = author;
  }
}

let poodr = new Book("Practical Object Oriented Programming in Ruby", "Metz");

> Constructor Ran!
```

**Exercise**:  With a fellow classmate create an `Animal` class similar to `Book` above.  The `constructor` should take a `sound` parameter and save it in an instance variable.  Then create an instance of the class.  Verify that it works.

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
    return this.price * (1 + SALESTAX);
  }
}

let adaBook = new Book("Practical Object Oriented Programming in Ruby", "Metz", 100);
console.log(adaBook.totalPrice());

> 108
```

**Exercise**:  For our `Animal` class, create a `speak` method which will print the sound to the console.  Try it out to verify that the method is working.

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
let poodr = new Book("Practical Object Oriented Programming in Ruby", "Metz");

// setter method
poodr.author = "Chris";

console.log(poodr.author); // getter method
> Chris
```

Notice that the properties are all named __\_propertyName__.  This is a typical naming convention for instance variables you want to keep private.  It's a convention that signals an intent to prevent access outside the class as nothing is **really** private in JavaScript.  Properties cannot have the same names as our getter and setter methods as doing so will result in infinite recursion.  

**Question**:  Why would naming the property the same as the getter or setter method result in infinite recursion?

**Exercise**:  Create getter and setter methods for the `Animal`'s `sound`' so that you can do:  `myAnimal.sound = "Ruff"` and `console.log(myAnimal.sound)`.

### Static Methods

Static methods are equivalent to class methods in Ruby.  They are attached to the class rather than instances of the class.


```javascript
class Book {
  constructor(title, author, price) {
    this._title = title;
    this._author = author;
    this._price = price;
  }
  //... getter & setter methods
  static bestPrice(bookA, bookB) {
    if (bookA.price <= bookB.price)
      return bookA.title;
    else
      return bookB.title;
  }
}

let poodr = new Book("Practical Object Oriented Programming in Ruby", 49);
let cpppl = new Book("The C++ Programming Language", "Bjarne Stroustrup", 30);

console.log(Book.bestPrice(poodr, cpppl));
> The C++ Programming Language
```

Like a Ruby class method the above example calls the static method with the name of the class as `Book.compare`.  Trying to call the method with `poodr.compare(poodr, cpppl);` will result in a TypeError.  

**Exercise**:  Add a static method to Animal called `createAnimals`, which takes an array of Strings (sounds) and returns an Array of Animals which make those sounds.  

## Inheritance

Classes can be subclassed using the `extends` keyword.  

```javascript
class Book {
  constructor(title, author) {
    this._title = title;
    this._author = author;
  }
  // .. getter & setter functions
  toString() {
    return `${this.title} by ${this.author}`;
  }

}

class Textbook extends Book {

  constructor(title, author, subject) {
    super(title, author);

    this.subject = subject;
  }
  toString() {
    return super.toString() + " about: " + this.subject;
  }

}

let cpppl = new Textbook("The C++ Programming Language", "Bjarne Stroustrup", "Comp Sci");
console.log(cpppl.toString());
>  The C++ Programming Language by Bjarne Stroustrup about: Comp Sci
```

In the example above we can use the `super` keyword to access the parent class'  version of the `toString` method and we overrode the parent class' method to add our own functionality.  

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
