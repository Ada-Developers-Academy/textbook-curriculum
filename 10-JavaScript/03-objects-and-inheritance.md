# JavaScipt 103: Objects & Inheritance.
## Learning Goals
- Compare Ruby's _classical inheritance_ with JavaScript's _prototypal inheritance_
- Refactor some code to inherit behavior from a prototype

Check out this code. It shows how Ruby does inheritance, and how it handles instantiating object instances:

```ruby
class FuzzyPets
  NAP_HOURS = 7
  attr_reader :nap_hours

  def initialize
    @nap_hours = NAP_HOURS
  end

  def dog
    puts "borf!"
  end

  def cat
    puts "mrow!"
  end
end

class MyPets < FuzzyPets
  def bird
    puts "cherp!"
  end
end

my_pets = MyPets.new
my_pets.nap_hours # 7
my_pets.dog  # borf!
my_pets.bird # cherp!
```

Nice, right? In Ruby, we know that seeing `class MyPets < FuzzyPets`, means that `MyPets` is defined with having all of the methods, accessors, properties, and constants that exist on `FuzzyPets`. We would say that _MyPets inherits FuzzyPets_.

JavaScript doesn't have an inheritance operator or keyword like Ruby's `<`. Instead, it has a `new` keyword such that `new MyPets()` produces an object that inherits from `MyPets.prototype`. Every `function` in JavaScript has a `prototype`. By default, it's an empty object (`{}`), but we can extend it or assign to be another object. Once a `prototype` isn't an empty object, the `function` can act as a _class_ and be used to instantiate other instances.

So where's `FuzzyPets` in that setup? How would we create `MyPets` such that it inherits from `FuzzyPets` in JavaScript?

## Inheritance Using Object Prototypes
Let's copypasta this code block into our Node REPL:

```javascript
var FuzzyPets = {
  nap_hours: 7,
  dog: function() { console.log('borf!'); },
  cat: function() { console.log('mrow!'); }
}

function MyPets() {
  this.bird = function() { console.log('cherp!'); }
};


MyPets.prototype = FuzzyPets;
var my_pets = new MyPets();
```

### What did we just do?
`FuzzyPets` is a generic JavaScript object. `MyPets` is a function (which is also an object) that sets a property on itself (`this.bird`). We then assign `MyPets`'s prototype to be `FuzzyPets`. By assigning the prototype, we are telling JavaScript that new _instances_ of the `MyPets` object should inherit the properties and functions defined on `FuzzyPets`.

Ok. So now what? Well, let's take a look at what we can do with `my_pets`:

```javascript
my_pets.bird(); // my_pets -> MyPets
my_pets.dog(); // my_pets -> MyPets -> my_pets.prototype -> dog()
my_pets.cat(); // my_pets -> MyPets -> my_pets.prototype -> cat()
my_pets.nap_hours; // my_pets -> my_pets.prototype -> nap_hours
```

### So how did we instantiate `MyPets`?
The `new` keyword is responsible for creating the instance. Notice that we invoked the function too! The whole line is `new MyPets()`. Invoking the function triggers the function body of `MyPets`, essentially using the function body as the constructor/initializer for the object.

So `my_pets` has a `bird()` function that it got as part of the invocation of `MyPets()`. The function body of `MyPets()` is the constructor for new instances.

### What can we do with this?
We can build complex functions that look and act like objects we'd use in Ruby. For an example, I built the following `Calculator()` function to be able to do multiple operations on demand. In this example, I used `prototype` to add new functions to `Calculator()` function. Using this, I can _instantiate_ as many calculators as I need. Consuming this function looks like this:

```javascript
function Calculator(x) {
  this._x = x; //let's talk a moment about _x
}

Calculator.prototype = {
  addition: function(n) { return this._x += n; },
  subtract: function(n) { return this._x -= n; },
  division: function(n) { return this._x /= n; },
  multiply: function(n) { return this._x *= n; }
}

var calc = new Calculator(0);
calc.addition(4); // 4
calc.multiply(3); // 12
calc.division(2); // 6
calc.subtract(14); // -8
```

## A note about using `Object.create()`
Introduced in ES5, `Object.create()` is a function that creates new objects. It takes one or two parameters. The first is an object that will be the new object's prototype. The second parameter is an optional object. If the second parameter is provided, it's properties and functions will be applied to the newly created object. You can read more about using `Object.create()` [over at MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/create).

There are a couple of gotchas and (to me, at least) unintuitive behaviors with using `Object.create()`, so be sure to read the docs carefully when you try using it.

## A note about the `class` keyword in ES6.
When reading about JavaScript, you'll come across folks excited about ES6 adding some new keywords like `class`, `extends`, `constructor`, and `super`. These keywords will allow us to build objects and inheritances that feel more familiar to us. However, JavaScript will remain a prototypal language; these keywords are just syntactic sugar sprinkled on top of what we are doing here with `prototype`.

## READING IS FUNDAMENTAL!
- [Prototypal Inheritance in JavaScript](http://javascript.crockford.com/prototypal.html)
- [MDN Docs on JS Prototypes](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Inheritance_and_the_prototype_chain)
